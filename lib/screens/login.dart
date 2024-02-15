import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_agriculture/components/button.dart';
import 'package:smart_agriculture/routes/route.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = '';

  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _error = 'Please fill in both username and password.';
      });
    } else {
      setState(() {
        _error = '';
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('login', true);
      await prefs.setString('user', _usernameController.text);
      // setLogin(true);
      // setUser(_usernameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  'https://res.cloudinary.com/dluwcubyw/image/upload/v1705887191/capstone/crop-monitoring-via-mobile-device_mkgwml.png',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            if (_error.isNotEmpty)
              Text(_error, style: TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () => {Get.toNamed(Routes.HOME)},
              child: const Text('Login'),
            ),
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {},
              child: const Text('Sign up', style: TextStyle(color: Colors.red)),
            ),
            AppButtons(
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              // isLoading: controller.isLoggingWithGoogle.value,
              imagePath: ('assets/icons/google.svg'),
              isSvg: true,
              text: "Continue with Google",
              onTap: () => {},
            )
          ],
        ),
      ),
    );
  }
}
