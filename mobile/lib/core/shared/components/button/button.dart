// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final Color? foregroundColor;
  final Color? backgroundColor;
  final RoundedRectangleBorder? shape;
  final double? height;
  final Widget? child;
  final void Function()? onPressed;

  const Button({
    Key? key,
    this.foregroundColor = ThemeColors.white,
    this.backgroundColor = ThemeColors.primary,
    this.shape,
    this.height = 48,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => backgroundColor,
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => foregroundColor,
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) =>
                shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
          ),
        ),
        child: child,
      ),
    );
  }
}
