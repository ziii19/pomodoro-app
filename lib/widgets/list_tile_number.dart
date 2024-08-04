import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class CustomNumberInputTile extends StatefulWidget {
  final String title;
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  const CustomNumberInputTile({
    super.key,
    required this.title,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  CustomNumberInputTileState createState() => CustomNumberInputTileState();
}

class CustomNumberInputTileState extends State<CustomNumberInputTile> {
  late TextEditingController _controller;
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _controller = TextEditingController(text: _currentValue.toString());
  }

  void _increment() {
    if (_currentValue < widget.maxValue) {
      setState(() {
        _currentValue++;
        _controller.text = _currentValue.toString();
        widget.onChanged(_currentValue);
      });
    }
  }

  void _decrement() {
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        _controller.text = _currentValue.toString();
        widget.onChanged(_currentValue);
      });
    }
  }

  void _onValueChanged(String value) {
    final int? newValue = int.tryParse(value);
    if (newValue != null &&
        newValue >= widget.minValue &&
        newValue <= widget.maxValue) {
      setState(() {
        _currentValue = newValue;
        widget.onChanged(_currentValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, isDark) {
        return BlocBuilder<PomotimerBloc, PomotimerState>(
          builder: (context, state) {
            return ListTile(
              title: Text(
                widget.title,
                style:
                    TextStyle(color: isDark ? state.lightBg : state.textDark),
              ),
              trailing: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        onChanged: _onValueChanged,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 10)),
                      ),
                    ),
                    Container(
                      width: 30,
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(width: 1, color: Colors.grey))),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: _increment,
                              child: const Icon(Icons.arrow_drop_up, size: 18)),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey,
                          ),
                          GestureDetector(
                              onTap: _decrement,
                              child:
                                  const Icon(Icons.arrow_drop_down, size: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
