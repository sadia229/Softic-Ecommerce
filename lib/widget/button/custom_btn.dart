import 'package:flutter/material.dart';
import 'package:softic_ecommerce/general/utils/config.dart';
import 'package:softic_ecommerce/general/utils/text_style.dart';

class KButton extends StatelessWidget {
  final String data;
  final VoidCallback onPressed;
  const KButton({Key? key, required this.data, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: context.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        child: Center(
          child: Text(
            data,
            style: KTextStyle.title3.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
