import 'package:flutter/material.dart';

class GuideSectionTitle extends StatelessWidget {
  final String title;
  const GuideSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.width * 0.043),
    );
  }
}
