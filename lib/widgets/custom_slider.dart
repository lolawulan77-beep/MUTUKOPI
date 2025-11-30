import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String label;
  final double value;
  final Function(double) onChanged;

  const CustomSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label: ${value.toStringAsFixed(1)}",
            style: const TextStyle(fontSize: 18)),
        Slider(
          value: value,
          min: 0,
          max: 10,
          divisions: 100,
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
