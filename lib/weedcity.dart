import 'package:flutter/material.dart';

class WeedCity extends StatefulWidget {
  const WeedCity({Key? key}) : super(key: key);

  @override
  State<WeedCity> createState() => _WeedCityState();
}

class _WeedCityState extends State<WeedCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weed City'),
      ),
    );
  }
}
