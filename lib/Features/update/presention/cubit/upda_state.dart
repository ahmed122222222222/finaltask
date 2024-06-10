part of 'upda_cubit.dart';

@immutable
sealed class UpdaState {}

final class UpdaInitial extends UpdaState {}
final class Updaload extends UpdaState {}
final class Updasucess extends UpdaState {}
final class Updafauiler extends UpdaState {
  final String errmas;

  Updafauiler({required this.errmas});
}
