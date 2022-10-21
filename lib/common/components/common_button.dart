import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;
  final String title;

  const CustomButton({
    Key? key,
    this.color,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      color: color,
    );
  }
}
