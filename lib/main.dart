
import 'package:flutter/material.dart';
import 'blood_requests_screen.dart';

void main() {
  runApp(const BloodRequestsApp());
}

class BloodRequestsApp extends StatelessWidget {
  const BloodRequestsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Requests',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF183A78),
          primary: const Color(0xFF183A78),
        ),
      ),
      home: const BloodRequestsScreen(),
    );
  }
}
