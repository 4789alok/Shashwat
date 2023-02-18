import 'package:flutter/material.dart';
import 'package:shashwat/Screen/tests/test_list.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Radio(
              activeColor: Color(0xFFff8000),
              value: 3,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = 3;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TestList()));
              }),
          const SizedBox(width: 8),
          const Text(
            'Standard 1',
            style: TextStyle(
                fontSize: 18,
                color:  Color(0xFF033d73),
                // color: Color(0xFFff8000),
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
