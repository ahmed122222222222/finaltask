import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:finaltask/Features/Home/data/repo/repo.dart';




part 'assinmentget_state.dart';

class adCubit extends Cubit<adState> {
  adCubit({required this.repo})
      : super(adInitial());
  Repo repo;
  void getcourses(
      String endpoin,int pafenamber) async {
   
    emit(adload());
    final result =
        await repo.gettask(endpoin,pafenamber);
    print("le ${result}");
    print(0);
    result.fold(
      (failure) => emit(adfailuer(errmass: failure.errmas)),
      (r) => emit(adsucess(task: r)),
    );
  }
}
