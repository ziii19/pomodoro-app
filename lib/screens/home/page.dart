import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

part 'section.dart/button.dart';
part 'section.dart/time.dart';
part 'section.dart/mode.dart';
part 'section.dart/settings.dart';

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
