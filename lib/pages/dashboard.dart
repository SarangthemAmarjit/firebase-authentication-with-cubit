import 'package:auto_route/auto_route.dart';
import 'package:firebaselogin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dashboard')),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
              child: Text(
            'Wecome to Dashboard',
            style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 20),
          )),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: (() async {
                final prefs = await SharedPreferences.getInstance();
                AuthService().signout().whenComplete(() {
                  if (prefs.containsKey('uid')) {
                    prefs.remove('uid');
                  }
                  return context.router.replaceNamed('/loginpage');
                });
              }),
              child: const Text('LogOut'))
        ],
      ),
    );
  }
}
