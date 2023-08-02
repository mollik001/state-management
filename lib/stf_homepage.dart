import 'package:flutter/material.dart';

class StatefulHomepage extends StatefulWidget {
  const StatefulHomepage({super.key});

  @override
  State<StatefulHomepage> createState() => _StatefulHomepageState();
}

int number = 0;

class _StatefulHomepageState extends State<StatefulHomepage> {
  @override
  Widget build(BuildContext context) {
    print(
        'build'); // The code will be rebuilt from this line with every button click.
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                number
                    .toString(), // the UI data should be changed with every button click.
                style: TextStyle(fontSize: 50),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          number++;
          print(number);
          setState(
              () {}); //it itforms fultter that the internal state has changed and the app should be rebuilt.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
