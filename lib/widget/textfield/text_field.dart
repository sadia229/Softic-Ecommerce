import 'package:flutter/material.dart';
import '../../general/utils/text_style.dart';

// ignore: must_be_immutable
class KTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool passwordVisible;

  KTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.passwordVisible,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<KTextField> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<KTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      obscureText: widget.passwordVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Icon(widget.prefixIcon),
        ),
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? KTextStyle.title6.copyWith(color: Colors.black)
            : KTextStyle.title6.copyWith(
                color: Colors.black.withOpacity(0.4),
              ),
        suffixIcon: Icon(widget.suffixIcon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.8),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.8),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
