import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finaltask/Features/detailes/presention/maager/cubit/dell_cubit.dart';

class delbottom extends StatelessWidget {
  const delbottom({
    super.key,
    required this.id,
    required this.pagenamber,
  });

  final String id;
  final int pagenamber;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<DellCubit>(context).dele(id);
       
      },
      child: Text('Delete'),
    );
  }
}