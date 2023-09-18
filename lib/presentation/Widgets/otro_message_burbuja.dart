import 'package:flutter/material.dart';

class OtroMyMessage extends StatelessWidget {
  const OtroMyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Consequat qui cillum.', style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}