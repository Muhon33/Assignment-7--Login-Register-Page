import 'package:flutter/material.dart';
import 'package:signin_register/pages/loginPage.dart';
import 'package:signin_register/pages/registerPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://oqlvbpizkifgknivsyuj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9xbHZicGl6a2lmZ2tuaXZzeXVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYzMTk2MzksImV4cCI6MjA3MTg5NTYzOX0.Qb_AIPbbuSBvdEwWkTbfWmJinNLOuIPwQuCOCADJZuY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
