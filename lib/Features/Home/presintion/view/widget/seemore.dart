import 'package:flutter/material.dart';
import 'package:finaltask/Features/detailes/presention/view/Details.dart';

class seebuttom extends StatelessWidget {
  const seebuttom({
    super.key, required this.product, required this.pagenamber,
  });
  final Map<String, dynamic> product;
  final int pagenamber;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TextButton(
        onPressed: () {
          Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen( product: product, pagenamber: pagenamber,)),
);
        },
        child: const Text(
          "see more",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
