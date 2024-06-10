import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:finaltask/Features/detailes/data/repo/repo.dart';

part 'dell_state.dart';

class DellCubit extends Cubit<DellState> {
  DellCubit({required this.del}) : super(DellInitial());
 final delRepo del;
  void dele(id)async
  {
     emit(Dellload());
    final result =
        await del.delete(id);
    print("le ${result}");
    print(0);
    result.fold(
      (failure) => emit(Delldel(errmas: failure.errmas)),
      (r) => emit(Dellsucess()),
    );
  }
}
