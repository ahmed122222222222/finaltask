import 'package:flutter/material.dart';
import 'package:finaltask/Features/detailes/presention/view/widget/details.dart';
import 'package:finaltask/Features/detailes/presention/view/widget/image.dart';
import 'package:finaltask/Features/detailes/presention/view/widget/snakbar.dart';
import 'package:finaltask/Features/detailes/presention/view/widget/updatebuttom.dart';

class bodydetailes extends StatelessWidget {
  const bodydetailes({
    super.key,
    required this.firstImage,
    required this.images,
    required this.name,
    required this.desc,
    required this.price,
    required this.product,
    required this.id,
    required this.pagenamber,
  });

  final String firstImage;
  final List images;
  final String name;
  final String desc;
  final String price;
  final Map<String, dynamic> product;
  final String id;
  final int pagenamber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (firstImage.isNotEmpty)
            Image.network(
              firstImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'asset/image/Screenshot 2024-05-27 120330.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
            ),
          if (images.isNotEmpty)
            Container(
              height: 100,
              child: image(images: images),
            ),
          detailes(name: name, desc: desc, price: price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              updaebuom(product: product, pagenamber: pagenamber),
              snakbarcus(id: id, pagenamber: pagenamber),
            ],
          ),
        ],
      ),
    );
  }
}
