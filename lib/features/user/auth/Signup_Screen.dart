import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jammer/features/user/auth/Login_Screen.dart';
import 'package:jammer/features/user/presentation/widgets/Widget_SocialButton.dart';
import 'package:jammer/features/user/data/services/auth_api.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

// final GoRouter _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => SignupScreen(),
//     ),
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => LoginScreen(),
//     ),
//   ],
// );
// @override
// Widget build(BuildContext context) {
//   return MaterialApp.router(
//     debugShowCheckedModeBanner: false,
//     routerConfig: _router,
//   );
// }

class _SignupScreenState extends State<SignupScreen> {
  final AuthApi _authService = AuthApi();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  bool isPassword = true;
  bool isLoading = false;
  double width = 0, height = 0;

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _Passwordcontroller.dispose();
    _phonecontroller.dispose();
    super.dispose();
  }

  void _signup(BuildContext context) async {
    setState(() => isLoading = true);

    try {
      var response = await _authService.signup(
        _namecontroller.text,
        _emailcontroller.text,
        _Passwordcontroller.text,
        _phonecontroller.text,
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
                builder: (context) => LoginScreen(),
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
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.07),
            TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText: 'Name',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
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
            SizedBox(height: height * 0.03),
            TextField(
              controller: _Passwordcontroller,
              // obscureText: isPassword,
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
            SizedBox(height: height * 0.03),
            TextField(
              controller: _phonecontroller,
              decoration: InputDecoration(
                hintText: 'Phone',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        )); // Navigate to login
                  },
                  child: Icon(Icons.arrow_right_alt, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            ElevatedButton(
              onPressed: isLoading ? null : () => _signup(context),
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
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(height: height * 0.01),
            Center(
              child: Text("Or sign up with social account"),
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
