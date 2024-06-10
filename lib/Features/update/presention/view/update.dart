import 'dart:io';

import 'package:finaltask/Features/Home/presintion/manager/assinmentget_cubit.dart';
import 'package:finaltask/Features/Home/presintion/view/Home.dart';
import 'package:finaltask/Features/update/data/repo/updaterepoimplemtion.dart';
import 'package:finaltask/Features/update/data/repo/uprepo.dart';
import 'package:finaltask/Features/update/presention/cubit/upda_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  final int pagenamber;

  const UpdateScreen({required this.product, required this.pagenamber});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;
  File? _firstImageFile;
  List<File> _newImagesFiles = [];
  List<String> _removedImageUrls = [];
  late String initialName;
  late String initialDesc;
  late String initialPrice;

  @override
  void initState() {
    super.initState();

    initialName = widget.product['name'] ?? '';
    initialDesc = widget.product['desc'] ?? '';
    initialPrice = widget.product['price']?.toString() ?? '0';

    _nameController = TextEditingController(text: initialName);
    _descController = TextEditingController(text: initialDesc);
    _priceController = TextEditingController(text: initialPrice);
  }

  @override
  Widget build(BuildContext context) {
    final String firstImage = widget.product['first_image'] ?? '';
    final List<dynamic> oldImages = widget.product['images'] ?? [];
    bool allEqual = true;
    upRepo up = upRepoImp();
    final List<dynamic> comper = oldImages;
    return BlocProvider(
      create: (context) => UpdaCubit(up: up),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: bodyupdate(firstImage, oldImages, comper, allEqual, context),
      ),
    );
  }

  SingleChildScrollView bodyupdate(String firstImage, List<dynamic> oldImages,
      List<dynamic> comper, bool allEqual, BuildContext context) {
    var listView = ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _newImagesFiles.length,
                      itemBuilder: (context, index) {
                        final imageFile = _newImagesFiles[index];
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Image.file(
                                  imageFile,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        oldImages.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                          ],
                        );
                      },
                    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (firstImage.isNotEmpty && _firstImageFile == null)
              Image.network(
                firstImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/placeholder.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                },
              )
            else if (_firstImageFile != null)
              Image.file(
                _firstImageFile!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Change First Image'),
            ),
            if (oldImages.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Existing Images:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 120,
                    child: listviewbuild(oldImages),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            customburrom(),
            if (_newImagesFiles.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Images:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 100,
                    child: listView,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            BlocListener<UpdaCubit, UpdaState>(
              listener: (context, state) {
                if (state is Updasucess) {
                  BlocProvider.of<adCubit>(context).getcourses(
                      widget.product['id'].toString(), widget.pagenamber);
                }
                if (state is Updafauiler) {
                  print(state.errmas);
                }
              },
              child: ElevatedButton(
                onPressed: () async {
                  String? name;
                  String? desc;
                  int? price;

                  if (_nameController.text != initialName) {
                    name = _nameController.text;
                  }
                  if (_descController.text != initialDesc) {
                    desc = _descController.text;
                  }
                  if (_priceController.text != initialPrice) {
                    price = int.tryParse(_priceController.text);
                  }

                  if (oldImages.length == comper.length && comper.length != 0) {
                    for (int i = 0; i < oldImages.length; i++) {
                      if (oldImages[i] != comper[i]) {
                        setState(() {
                          allEqual = false;
                        });
                        break;
                      }
                    }
                  } else {
                    setState(() {
                      allEqual = false;
                    });
                  }
                  print(allEqual);

                  List<String> oldImageFiles = oldImages.map((imageInfo) {
                    String imageUrl = imageInfo[
                        'image']; // افترض أن 'image' هو مفتاح الرابط لكل صورة
                    return (imageUrl);
                  }).toList();
                 
                  BlocProvider.of<UpdaCubit>(context).upda(
                    widget.product['id'].toString(),
                    name,
                    desc,
                    price,
                    allEqual ? null : oldImageFiles,
                  );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => MyHomePage()));
                },
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView listviewbuild(List<dynamic> oldImages) {
    return ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(oldImages.length, (index) {
                      final imageUrl = oldImages[index]['image'] ?? '';
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      _removedImageUrls.add(imageUrl);
                                      oldImages.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                      );
                    }),
                  );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}

class customburrom extends StatelessWidget {
  const customburrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {},
      child: const Text('Select Images'),
    );
  }
}
