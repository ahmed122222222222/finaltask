import 'package:flutter/material.dart';

class image extends StatelessWidget {
  const image({
    super.key,
    required this.images,
  });

  final List images;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        // Check if imageUrl is not an empty string and has a valid URI
    
        return Padding(
          padding: EdgeInsets.all(4),
          child: Image.network(
          images [index]['image'],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
