import 'package:flutter/material.dart';
import 'package:jammer/features/user/presentation/screens/Checkout_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Categories"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.red,
          tabs: [
            Tab(text: "Women"),
            Tab(text: "Men"),
            Tab(text: "Kids"),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "SUMMER SALES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Up to 50% off",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCategoryItem("New",
                    "https://media.istockphoto.com/id/1387359785/photo/shot-of-two-women-dressed-in-stylish-yellow-clothes-against-a-yellow-background.jpg?s=612x612&w=0&k=20&c=PnGys3vvBk6GhWyU2qC06JpMGYeui7khi8Sq0OUcvOk="),
                _buildCategoryItem("Clothes",
                    "https://media.istockphoto.com/id/1387359785/photo/shot-of-two-women-dressed-in-stylish-yellow-clothes-against-a-yellow-background.jpg?s=612x612&w=0&k=20&c=PnGys3vvBk6GhWyU2qC06JpMGYeui7khi8Sq0OUcvOk="),
                _buildCategoryItem("Shoes",
                    "https://media.istockphoto.com/id/1387359785/photo/shot-of-two-women-dressed-in-stylish-yellow-clothes-against-a-yellow-background.jpg?s=612x612&w=0&k=20&c=PnGys3vvBk6GhWyU2qC06JpMGYeui7khi8Sq0OUcvOk="),
                _buildCategoryItem("Accessories",
                    "https://media.istockphoto.com/id/1387359785/photo/shot-of-two-women-dressed-in-stylish-yellow-clothes-against-a-yellow-background.jpg?s=612x612&w=0&k=20&c=PnGys3vvBk6GhWyU2qC06JpMGYeui7khi8Sq0OUcvOk="),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        leading:
            Image.network(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsScreen(),
              ));
        },
      ),
    );
  }
}
