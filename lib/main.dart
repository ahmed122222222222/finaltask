import 'package:finaltask/Features/add/data/repo/repoimp.dart';
import 'package:finaltask/Features/add/presention/maager/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finaltask/Features/Home/data/repo/Repoimplemintion.dart';
import 'package:finaltask/Features/Home/data/repo/repo.dart';
import 'package:finaltask/Features/Home/presintion/manager/assinmentget_cubit.dart';
import 'package:finaltask/Features/Home/presintion/view/Home.dart';
import 'package:finaltask/Features/detailes/data/repo/repimp.dart';
import 'package:finaltask/Features/detailes/data/repo/repo.dart';
import 'package:finaltask/Features/detailes/presention/maager/cubit/dell_cubit.dart';
import 'package:finaltask/Features/update/data/repo/updaterepoimplemtion.dart';
import 'package:finaltask/Features/update/data/repo/uprepo.dart';
import 'package:finaltask/Features/update/presention/cubit/upda_cubit.dart';

import 'Features/add/data/repo/repo.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Repo repo = RepoImp();
upRepo up =upRepoImp();
delRepo del=delRepoImp();
addRepo add=addRepoimp();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => adCubit(repo: repo)),
          BlocProvider(create: (context) => UpdaCubit(up: up)),
          BlocProvider(
      create: (context) => DellCubit(del: del),),
      BlocProvider(
      create: (context) => AddCubit(add: add),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}






