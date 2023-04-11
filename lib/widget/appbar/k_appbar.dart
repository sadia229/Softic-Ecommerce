import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget {
  final String title;
  const KAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
    );
  }
}
