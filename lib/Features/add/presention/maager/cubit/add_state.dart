part of 'add_cubit.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}
final class AddIload extends AddState {}
final class AddIsucess extends AddState {
  final String mass;

  AddIsucess({required this.mass});
}
final class Addfailer extends AddState {
  final String errmas;

  Addfailer({required this.errmas});
}