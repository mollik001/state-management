import 'package:flutter/material.dart';
import 'package:practice_sm/favourite_page.dart';
import 'package:practice_sm/provider/count_provider.dart';
import 'package:practice_sm/provider/favourite_provider.dart';
import 'package:practice_sm/provider/sliderProvider.dart';
import 'package:practice_sm/slider_homePage.dart';
import 'package:provider/provider.dart';

import 'stf_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Favourite(),
      ),
    );
  }
}
