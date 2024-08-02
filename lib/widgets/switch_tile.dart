import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: initialValue,
        onChanged: onChanged,
      ),
    );
  }
}
