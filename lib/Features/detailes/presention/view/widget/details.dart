import 'package:flutter/material.dart';

class detailes extends StatelessWidget {
  const detailes({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
  });

  final String name;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            desc,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}