import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:finaltask/Features/add/data/repo/repo.dart';
import 'package:meta/meta.dart';


part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit({
    required this.add
  }) : super(AddInitial());
  addRepo add;
   Future<void> submitAd({
    required String name,
    required String desc,
    required int price,
    required String firstImagePath,
    required List<String> imagePaths,
  }) async{
    
   var result=await add.add(name, desc, price, firstImagePath, imagePaths);
    print(result);
     result.fold(
      (failure) => emit(Addfailer(errmas: failure.errmas)),
      (r) => emit(AddIsucess(mass: "succefly")),
    );

  }
}
