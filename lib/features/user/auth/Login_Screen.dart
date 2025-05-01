import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jammer/Home/Home_Screen.dart';
import 'package:jammer/features/user/auth/Signup_Screen.dart';
import 'package:jammer/features/user/data/services/auth_api.dart';
import 'package:jammer/features/user/presentation/widgets/Widget_SocialButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthApi _authService = AuthApi();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();
  bool isPassword = true;
  bool isLoading = false;
  var height, width;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _Passwordcontroller.dispose();

    super.dispose();
  }

  void _login(BuildContext context) async {
    setState(() => isLoading = true);

    try {
      var response = await _authService.login(
        _emailcontroller.text,
        _Passwordcontroller.text,
      );

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response["message"]),
          backgroundColor: response["isSuccess"]
              ? const Color.fromRGBO(76, 175, 80, 1)
              : Colors.red,
        ),
      );

      if (response["isSuccess"]) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
          // context.go('/login'); // Navigate to login screen
        });
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios)),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: height * 0.1),
            SizedBox(height: height * 0.04),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            TextField(
              controller: _Passwordcontroller,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
            ElevatedButton(
              onPressed: isLoading ? null : () => _login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(height: height * 0.01),
            Center(
              child: Text("Or Login with social account"),
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  asset: "assets/Google.png",
                  onPressed: () {
                    print("Google Sign Up Clicked");
                  },
                ),
                SizedBox(width: width * 0.04),
                SocialButton(
                  asset: "assets/facebook.png",
                  onPressed: () {
                    print("Facebook Sign Up Clicked");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
