import 'dart:ffi';

import 'package:finaltask/Features/add/presention/maager/cubit/add_cubit.dart';
import 'package:finaltask/Features/add/presention/view/widget/customtextfiled.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAdWidget extends StatefulWidget {
  @override
  _CreateAdWidgetState createState() => _CreateAdWidgetState();
}

class _CreateAdWidgetState extends State<CreateAdWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _desc = '';
  int _price = 0;

  final String firstImagePath =
      'asset/image/Screenshot 2024-05-27 120627.png'; // المسار الثابت للصورة الأولى
  final List<String> imagePaths = [
    'asset/image/Screenshot 2024-05-27 120627.png',
    'asset/image/Screenshot 2024-05-27 120627.png'
  ]; // المسارات الثابتة للصور الإضافية

  Future<void> _submitAd() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await BlocProvider.of<AddCubit>(context).submitAd(
          name: _name,
          desc: _desc,
          price: _price,
          firstImagePath: firstImagePath,
          imagePaths: imagePaths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Ad'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              CustomTextFormField(
                labelText: 'Name',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 3 ||
                      value.length > 255) {
                    return 'Please enter a valid name (3-255 characters).';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              CustomTextFormField(
                labelText: 'Description',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 3 ||
                      value.length > 255) {
                    return 'Please enter a valid description (3-255 characters).';
                  }
                  return null;
                },
                onSaved: (value) {
                  _desc = value!;
                },
              ),
              CustomTextFormField(
                labelText: 'Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      double.tryParse(value) == null ||
                      double.parse(value)! < 0 ||
                      double.parse(value)! > 999999) {
                    return 'Please enter a valid price (0-999999).';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              BlocListener<AddCubit, AddState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if(state is Addfailer )
                  {
                    print("object000000000000000000000000000000000000000000000000000000000000000${state.errmas}");
                  }
                },
                child: ElevatedButton(
                  onPressed: _submitAd,
                  child: Text('Create Ad'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
