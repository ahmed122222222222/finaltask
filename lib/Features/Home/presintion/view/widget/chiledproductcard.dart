import 'package:flutter/material.dart';
import 'package:finaltask/Features/Home/presintion/view/widget/foterofwidget.dart';

class chiledproductcard extends StatelessWidget {
  const chiledproductcard({
    super.key,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    required this.product,
    required this.pagenamber,
  });

  final String image;
  final String name;
  final String desc;
  final String price;
  final int pagenamber;
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image.isNotEmpty
              ? Image.network(
                  image,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'asset/image/Screenshot 2024-05-27 120330.png',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    );
                  },
                )
              : const SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Center(
                    child: Text('No Image'),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          foterofwidget(price: price, product: product, pagenamber: pagenamber),
        ],
      ),
    );
  }
}
