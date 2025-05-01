import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jammer/Home/Profile_Screen.dart';
import 'package:jammer/features/user/presentation/screens/Checkout_screen.dart';
import 'package:jammer/features/user/presentation/screens/Favourite_Screen.dart';
import 'package:jammer/features/user/presentation/screens/Product_detailScreen..dart';
import 'package:jammer/features/user/presentation/screens/catagories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height, width;
  int _selectedIndex = 0; // Track selected icon

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: height * 0.4, // Custom height of the slider
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.8, // Width of each item
                ),
                items: [
                  // First Slide (Text)
                  Container(
                      width: width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://media.istockphoto.com/id/1387359785/photo/shot-of-two-women-dressed-in-stylish-yellow-clothes-against-a-yellow-background.jpg?s=612x612&w=0&k=20&c=PnGys3vvBk6GhWyU2qC06JpMGYeui7khi8Sq0OUcvOk="),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [],
                      )),

                  // Second Slide (Image)
                  Container(
                      width: width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://s3.envato.com/files/484467137/647dcaa2f8b2823bb0817f4d_withmeta.jpg'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [],
                      )),

                  // Third Slide (Button)
                  Container(
                      width: width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/fashion-girl-casual-summer-clothes_158538-4499.jpg'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [],
                      )),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          const Text(
                            "New",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.67,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoriesScreen(),
                                  ));
                            },
                            child: const Text(
                              'View all',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: height * 0.25,
                        width: width,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(),
                                      ));
                                },
                                child: Container(
                                  height: height * 0.25,
                                  width: width * 0.3,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.15,
                                        width: width * 0.3,
                                        decoration: const BoxDecoration(
                                          color: Colors.greenAccent,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://media.istockphoto.com/id/1387359785/photo/shot-of-two-women-dressed-in-stylish-yellow-clothes-against-a-yellow-background.jpg?s=612x612&w=0&k=20&c=PnGys3vvBk6GhWyU2qC06JpMGYeui7khi8Sq0OUcvOk="),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 10,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 10,
                                          ),
                                          Text(
                                            '(10)',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8),
                                          )
                                        ],
                                      ),
                                      const Text(
                                        "Model Dress",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "120\$",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 243, 33, 54),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          const Text(
                            "Sale",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.67,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoriesScreen(),
                                  ));
                            },
                            child: const Text(
                              'View all',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: height * 0.25,
                        width: width,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: height * 0.25,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.15,
                                      width: width * 0.3,
                                      decoration: const BoxDecoration(
                                        color: Colors.greenAccent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://img.freepik.com/free-photo/fashion-girl-casual-summer-clothes_158538-4499.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Text(
                                          '(10)',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 8),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "Model Dress",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "120\$",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 243, 33, 54),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(), // Optional notch effect
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Even spacing
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0
                        ? Color.fromARGB(255, 243, 33, 54)
                        : Colors.grey),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart,
                      color: _selectedIndex == 1
                          ? Color.fromARGB(255, 243, 33, 54)
                          : Colors.grey),
                  onPressed: () {
                    _onItemTapped(1);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(),
                        ));
                  }),
              IconButton(
                  icon: Icon(Icons.shopping_bag_rounded,
                      color: _selectedIndex == 2
                          ? Color.fromARGB(255, 243, 33, 54)
                          : Colors.grey),
                  onPressed: () {
                    _onItemTapped(2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesScreen(),
                        ));
                  }),
              IconButton(
                  icon: Icon(Icons.favorite,
                      color: _selectedIndex == 3
                          ? Color.fromARGB(255, 243, 33, 54)
                          : Colors.grey),
                  onPressed: () {
                    _onItemTapped(3);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(),
                        ));
                  }),
              IconButton(
                  icon: Icon(Icons.person,
                      color: _selectedIndex == 4
                          ? const Color.fromARGB(255, 243, 33, 54)
                          : Colors.grey),
                  onPressed: () {
                    _onItemTapped(4);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                  }),
            ],
          ),
        ));
  }
}
