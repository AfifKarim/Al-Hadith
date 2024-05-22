import 'package:flutter/material.dart';

class leadingTileIcon extends StatelessWidget {
  final iconColor;
  final String text;

  const leadingTileIcon({
    super.key,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.pentagon, color: iconColor, size: 50),
        Positioned(
            bottom: 12.0,
            right: 19,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Colors.white),
            )),
      ],
    );
  }
}
