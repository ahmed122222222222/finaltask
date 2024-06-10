import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:finaltask/Features/Home/presintion/view/widget/seemore.dart';


class foterofwidget extends StatelessWidget {
  const foterofwidget({
    super.key,
    required this.price, required this.product, required this.pagenamber,
  });
final Map<String, dynamic> product;
  final String price;

  final int pagenamber;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Expanded(
          child: Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(child: seebuttom(product: product, pagenamber: pagenamber,)),
      ],
    );
  }
}

