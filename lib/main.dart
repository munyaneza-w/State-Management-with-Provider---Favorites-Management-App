import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorites App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ProductListScreen(),
      ),
    );
  }
}
