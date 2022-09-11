import 'package:app_ecommerce_admin/pages/widget/auth_signin.dart';
import 'package:app_ecommerce_admin/pages/widget/auth_signup.dart';
import 'package:flutter/material.dart';

class AdminAuthPage extends StatelessWidget {
  const AdminAuthPage({
    super.key,
    this.route,
  });

  final String? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: IndexedStack(
          index: route == 'signin' ? 0 : 1,
          children: const [
            SigninPage(),
            SignupPage(),
          ],
        ),
      ),
    );
  }
}
