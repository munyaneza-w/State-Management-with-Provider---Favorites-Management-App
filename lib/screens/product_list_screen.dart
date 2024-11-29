import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../favorites.dart';
import 'favorites_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<String> products = [
    'Apple iPhone 14',
    'Samsung Galaxy S23',
    'Sony WH-1000XM5 Headphones',
    'Apple MacBook Air',
    'Dell XPS 13 Laptop',
    'Nintendo Switch',
    'PlayStation 5',
    'Xbox Series X',
    'Canon EOS R5 Camera',
    'GoPro Hero 12',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(product),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  Provider.of<Favorites>(context, listen: false)
                      .addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$product added to favorites!')),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritesScreen()),
          );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
