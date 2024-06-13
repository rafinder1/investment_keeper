import 'package:flutter/material.dart';
import 'package:investment_keeper/src/features/home/presentation/page/home_page.dart';
// import 'package:investment_keeper/src/features/make_money_bank/presentation/page/make_money_banks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
