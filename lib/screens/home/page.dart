import 'package:flutter/material.dart';

part 'section.dart/button.dart';
part 'section.dart/time.dart';
part 'section.dart/mode.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PomoMode(),
            SizedBox(height: 30),
            _PomoTime(),
            SizedBox(height: 30),
            _PomoButton()
          ],
        ),
      ),
    );
  }
}
