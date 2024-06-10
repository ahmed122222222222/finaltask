import 'package:flutter/material.dart';
import 'package:finaltask/Features/Home/presintion/view/widget/chiledproductcard.dart';


class gridview extends StatefulWidget {
  const gridview({
    super.key,
    required this.data, required this.pagenamber,
  });
final  int pagenamber;
  // ignore: prefer_typing_uninitialized_variables
   final   data;

  @override
  State<gridview> createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final product = widget.data[index];
        return ProductCard(product: product, pagenamber: widget.pagenamber,);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({required this.product, required this.pagenamber});
final int pagenamber;
  @override
  Widget build(BuildContext context) {
    final String name = product['name'] ?? 'No Name';
    final String desc = product['desc'] ?? 'No Description';
    final String price = product['price'] ?? 'No Price';
    final String image = product['first_image'] ?? '';

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: chiledproductcard(image: image, name: name, desc: desc, price: price, product: product, pagenamber: pagenamber,),
    );
  }
}
