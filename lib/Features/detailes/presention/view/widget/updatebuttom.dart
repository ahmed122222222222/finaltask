import 'package:flutter/material.dart';
import 'package:finaltask/Features/update/presention/view/update.dart';

class updaebuom extends StatelessWidget {
  const updaebuom({
    super.key,
    required this.product, required this.pagenamber,
  });

  final Map<String, dynamic> product;
  final int pagenamber;  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
    
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => UpdateScreen(
                      product: product, pagenamber: pagenamber,
                    )));
      },
      child: Text('Edit'),
    );
  }
}