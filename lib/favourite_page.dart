import 'package:flutter/material.dart';
import 'package:practice_sm/favourite_2ndPage.dart';
import 'package:practice_sm/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondFavourite()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                  print('rebuild');
                  return ListTile(
                    onTap: () {
                      value.toggleFavorite(index);
                    },
                    title: Text('Item ${index + 1}'),
                    trailing: Icon(value.selectedItem.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
