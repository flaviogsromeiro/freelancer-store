import 'package:flutter/material.dart';

class AppSimpleMessageDialog extends StatelessWidget {
  const AppSimpleMessageDialog({
    required this.description,
    required this.dialogColor,
    required this.icon,
    super.key,
  });
  final String description;
  final Color dialogColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _contentBox(context),
    );
  }

  Stack _contentBox(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 61,
            right: 16,
            bottom: 16,
          ),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 5,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: dialogColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned.directional(
          start: 0,
          end: 0,
          textDirection: TextDirection.ltr,
          child: CircleAvatar(
            backgroundColor: dialogColor,
            radius: 45,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
