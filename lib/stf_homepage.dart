import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_sm/provider/count_provider.dart';
import 'package:provider/provider.dart';

class StatefulHomepage extends StatefulWidget {
  const StatefulHomepage({super.key});

  @override
  State<StatefulHomepage> createState() => _StatefulHomepageState();
}

class _StatefulHomepageState extends State<StatefulHomepage> {
  @override
  void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print(
        'build'); // now this will not be printed in every button click. state management done!!
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statefull Widget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Consumer<CountProvider>(
              builder: (context, value, child) {
                return Text(
                  value.count
                      .toString(), // the UI data should be changed with every button click.
                  style: TextStyle(fontSize: 50),
                );
              },
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
