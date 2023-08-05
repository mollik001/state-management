import 'package:flutter/material.dart';
import 'package:practice_sm/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class SecondFavourite extends StatefulWidget {
  const SecondFavourite({super.key});

  @override
  State<SecondFavourite> createState() => _SecondFavouriteState();
}

class _SecondFavouriteState extends State<SecondFavourite> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Only'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.selectedItem.length,
              itemBuilder: (context, index) {
                int itemIndex = provider.selectedItem[index];
                return ListTile(
                  onTap: () {
                    provider.toggleFavorite(itemIndex);
                  },
                  title: Text('Item ${itemIndex + 1}'),
                  trailing: Icon(Icons.favorite),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
