import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finaltask/Features/Home/presintion/manager/assinmentget_cubit.dart';
import 'package:finaltask/Features/detailes/presention/maager/cubit/dell_cubit.dart';
import 'package:finaltask/Features/detailes/presention/view/widget/deletbuttom.dart';

// ignore: camel_case_types
class snakbarcus extends StatelessWidget {
  const snakbarcus({
    super.key,
    required this.id,
    required this.pagenamber,
  });

  final String id;
  final int pagenamber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DellCubit, DellState>(
      listener: (context, state) {
        
        if (state is Dellsucess) {
           BlocProvider.of<adCubit>(context).getcourses("api/ads",pagenamber);
        Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
              "sucessfly",
              style: TextStyle(color: Colors.black),
            )),
          );
          
        }
      },
      child: delbottom(id: id, pagenamber: pagenamber),
    );
  }
}