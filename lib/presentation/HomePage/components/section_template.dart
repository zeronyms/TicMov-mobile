import 'package:flutter/material.dart';

class SectionTemplate extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionTemplate({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "Selengkapnya",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14, 
                      color: Color.fromARGB(153, 0, 26, 57),
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 17,
                    color: Color.fromARGB(153, 0, 26, 57),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        child,
      ],
    );
  }
}
