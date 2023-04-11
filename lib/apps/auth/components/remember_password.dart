import 'package:flutter/material.dart';
import 'package:softic_ecommerce/general/utils/text_style.dart';

class RememberPassword extends StatefulWidget {
  const RememberPassword({Key? key}) : super(key: key);

  @override
  State<RememberPassword> createState() => _RememberPasswordState();
}

class _RememberPasswordState extends State<RememberPassword> {
  bool rememberValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberValue,
          onChanged: (value) {
            setState(() {
              rememberValue = value!;
            });
          },
        ),
        const SizedBox(width: 5), //SizedBox
        Text('Remember Me', style: KTextStyle.title6), //Text
      ],
    );
  }
}
