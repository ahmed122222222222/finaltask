// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finaltask/Features/detailes/data/repo/repimp.dart';
import 'package:finaltask/Features/detailes/data/repo/repo.dart';
import 'package:finaltask/Features/detailes/presention/maager/cubit/dell_cubit.dart';
import 'package:finaltask/Features/detailes/presention/view/widget/bodydetails.dart';


class SecondScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final int pagenamber;
  const SecondScreen({super.key, required this.product, required this.pagenamber});

  @override
  Widget build(BuildContext context) {
    final String firstImage = product['first_image'] ?? '';
    final List<dynamic> images = product['images'] ?? [];
    final String name = product['name'] ?? 'No Name';
    final String desc = product['desc'] ?? 'No Description';
    final String price = (product['price'] ?? 0).toString();
    final String id = (product['id'] ?? 0).toString();

    // Function to check and correct the URL scheme
    String checkAndCorrectUrl(String url) {
      // Check if the URL starts with 'http://' or 'https://'
      if (url.startsWith('http://') || url.startsWith('https://')) {
        return url;
      } else {
        // If the URL does not start with a valid scheme, assume it's invalid
        return '';
      }
    }

    final delRepo del = delRepoImp();

    return BlocProvider(
      create: (context) => DellCubit(del: del),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: bodydetailes(
            firstImage: firstImage,
            images: images,
            name: name,
            desc: desc,
            price: price,
            product: product,
            id: id,
            pagenamber: pagenamber),
      ),
    );
  }
}
