import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final Color? textColor;
  final Color? color;
  final VoidCallback onPress;
  final String? title;

  const CustomRoundedButton(
      {Key? key, this.color, this.title, required this.onPress, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.red, width: 1.5)),
          onPressed: onPress,
          minWidth: 200.0,
          height: 50.0,
          child: Text(
            title.toString(),
            style: TextStyle(color: textColor, fontFamily: 'Source Sans Pro', fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
