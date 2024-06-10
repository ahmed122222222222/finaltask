part of 'assinmentget_cubit.dart';

@immutable
sealed class adState {}

final class adInitial extends adState {}

final class adload extends adState {}

final class adsucess extends adState {
  final Map<String,dynamic> task;

 adsucess({required this.task});
}

final class adfailuer extends adState {
  final String errmass;

  adfailuer({required this.errmass});
}
