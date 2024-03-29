import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_agriculture/components/button.dart';
import 'package:smart_agriculture/controllers/auth_controller.dart';
import 'package:smart_agriculture/routes/route.dart';
import 'package:smart_agriculture/utils/spacing.dart';

class Login extends GetView<AuthController> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _error = '';

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  'https://res.cloudinary.com/dluwcubyw/image/upload/v1705887191/capstone/crop-monitoring-via-mobile-device_mkgwml.png',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            if (_error.isNotEmpty)
              Text(_error, style: const TextStyle(color: Colors.red)),
            addVerticalSpace(15),
            SizedBox(
              width: 200, // Set the width to your desired value
              child: AppButtons(
                textColor: Colors.white,
                backgroundColor: const Color(0xFF34a0a4),
                text: 'Login',
                borderColor: Colors.white,
                onTap: () => {Get.toNamed(Routes.HOME)},
              ),
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
              onTap: () => {controller.handleSignIn()},
            )
          ],
        ),
      ),
    );
  }
}
