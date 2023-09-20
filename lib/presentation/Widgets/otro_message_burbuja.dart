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
            child: Text('otro mensaje', style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBurbuja(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBurbuja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network('https://yesno.wtf/assets/no/9-dc99c0e3c066b28d3a12262692cd5432.gif', 
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
          return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('estoy enviando una imagen'),
          );
      },
      ),
    );
  }
}