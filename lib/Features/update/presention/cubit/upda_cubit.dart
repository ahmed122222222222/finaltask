import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:finaltask/Features/update/data/repo/uprepo.dart';

part 'upda_state.dart';

class UpdaCubit extends Cubit<UpdaState> {
  UpdaCubit({required this.up}) : super(UpdaInitial());
  upRepo up ;

  void upda ( String adId,  String? name,String? desc,int? price, List<String>? imageUrls,)async{
    emit(Updaload());
    final result =
        await up.gettask(adId,name,desc,price,imageUrls,);
    print("le ${result.toString()}");
   
    result.fold(
      (failure) => emit(Updafauiler(errmas: failure.errmas)),
      (r) => emit(Updasucess(),
    ));
  }
}
