import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../auth/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authService = AuthService();
  void logOut() async {
    await authService.signOut();
    // if (mounted) {
    //   Navigator.pop(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Muhon"),
        actions: [IconButton(onPressed: logOut, icon: Icon(Icons.logout))],
      ),
      body: Center(child: Text(currentEmail.toString())),
    );
  }
}
