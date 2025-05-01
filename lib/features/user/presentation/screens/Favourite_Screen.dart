import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, String>> products = List.generate(
      5,
      (index) => {
            "title": "Stylish Dress",
            "price": "\$${30 + (index * 5)}",
            "size": "M",
            "color": "Black",
            "image":
                "https://t4.ftcdn.net/jpg/02/52/37/29/360_F_252372949_wF016jZCxmO9eClldKatxjQSNlnTHEM3.jpg",
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.network(
                product["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product["title"]!),
              subtitle:
                  Text("Color: ${product["color"]} | Size: ${product["size"]}"),
              trailing: Text(
                product["price"]!,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
