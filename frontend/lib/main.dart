import 'package:flutter/material.dart';
import 'triggers/trigger_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TriggerManager triggerManager;

  @override
  void initState() {
    super.initState();
    triggerManager = TriggerManager(context);
    triggerManager.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "SOS System Running",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}