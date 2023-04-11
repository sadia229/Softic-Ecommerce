import 'package:flutter/material.dart';
import 'package:softic_ecommerce/general/utils/text_style.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;

  PasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<PasswordField> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<PasswordField> {
  bool _passwordVisible = true;
  final FocusNode _focusNode = FocusNode();

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      obscureText: _passwordVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(14.0),
          child: Icon(Icons.lock),
        ),
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? KTextStyle.title6.copyWith(color: Colors.black)
            : KTextStyle.title6.copyWith(
                color: Colors.black.withOpacity(0.4),
              ),
        suffixIcon: IconButton(
          icon: _passwordVisible
              ? Icon(
                  Icons.visibility_off,
                  size: 16,
                  color: Colors.black.withOpacity(0.4),
                )
              : Icon(
                  Icons.visibility,
                  size: 16,
                  color: Colors.black.withOpacity(0.4),
                ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
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
