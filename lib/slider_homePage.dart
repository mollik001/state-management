import 'package:flutter/material.dart';
import 'package:practice_sm/provider/sliderProvider.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                max: 0.9,
                inactiveColor: Color.fromARGB(17, 226, 81, 71),
                thumbColor: const Color.fromARGB(255, 0, 0, 0),
                activeColor: Colors.green,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(value.value),
                  ),
                  child: Center(
                    child: Text("Make me DISAPPEAR !"),
                  ),
                )),
              ],
            );
          }),
        ],
      ),
    );
  }
}
