import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final double padding;
  final String icon;
  final Color color;
  final double size;
  final VoidCallback? onPressed;

  const SvgIconButton({
    required this.icon,
    required this.color,
    this.padding = 4.0,
    this.size = 24,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SvgPicture.asset(
          icon,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    );
  }
}
