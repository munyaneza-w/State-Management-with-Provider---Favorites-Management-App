import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../favorites.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, favorites, child) {
          final favoriteItems = favorites.items;
          return favoriteItems.isEmpty
              ? Center(child: Text('No favorites added yet!'))
              : ListView.builder(
                  itemCount: favoriteItems.length,
                  itemBuilder: (context, index) {
                    final item = favoriteItems[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(item),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            favorites.removeItem(item);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('$item removed from favorites!')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
