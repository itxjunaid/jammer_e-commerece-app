import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jammer/features/user/data/services/auth_api.dart';
import 'package:jammer/features/user/data/services/profile_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  final AuthApi _authService = AuthApi();
  UserData? userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    setState(() => isLoading = true);

    try {
      final response = await _authService.uSERgET();
      if (response.isSuccess) {
        setState(() {
          userData = response.data; // Use the parsed user data
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching user data: $e")),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('My Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchUserData, // Refresh user data on button press
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userData == null
              ? Center(child: Text("No user data available"))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildProfileAvatar(
                              userData!.fullName, userData!.image),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData!.fullName,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                userData!.email,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Add more UI elements to display user data
                    ],
                  ),
                ),
    );
  }

  Widget _buildProfileAvatar(String name, String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(imageUrl),
      );
    } else {
      return CircleAvatar(
        radius: 28,
        backgroundColor: Colors.blueAccent,
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }
  }
}
