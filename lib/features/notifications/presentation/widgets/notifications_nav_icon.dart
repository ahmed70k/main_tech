import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsNavIcon extends StatelessWidget {
  final int count;
  final bool isActive;
  final double size;

  const NotificationsNavIcon({
    super.key,
    required this.count,
    this.isActive = false,
    this.size = 26,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: count > 0,
      label: Text(
        count > 99 ? '99+' : '$count',
        style: const TextStyle(fontSize: 10),
      ),
      backgroundColor: Colors.red.shade700,
      child: SvgPicture.asset(
        'assets/images/alerts_icon.svg',
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(
          isActive ? const Color(0xFF0BD1ED) : const Color(0xFFA0AAB2),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
