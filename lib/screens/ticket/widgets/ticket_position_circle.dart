import 'package:flutter/material.dart';
import 'package:ticket_app/core/res/styles/app_styles.dart';

class TicketPositionCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositionCircle({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos == true ? 22 : null,
      right: pos == true ? null : 22,
      top: 250,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: AppStyles.textColor,
          ),
        ),
        child: CircleAvatar(
          maxRadius: 4,
          backgroundColor: AppStyles.textColor,
        ),
      ),
    );
  }
}
