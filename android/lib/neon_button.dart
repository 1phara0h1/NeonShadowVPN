import 'package:flutter/material.dart';

class NeonButton extends StatelessWidget {
  final bool active;
  final VoidCallback onTap;
  const NeonButton({required this.active, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withOpacity(0.35),
              color.withOpacity(0.9),
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: active ? 40 : 20,
              color: color.withOpacity(active ? 0.8 : 0.4),
              spreadRadius: active ? 8 : 4,
            ),
          ],
        ),
        child: Icon(
          active ? Icons.power_off : Icons.power_settings_new,
          size: 64,
          color: Colors.white,
        ),
      ),
    );
  }
}
