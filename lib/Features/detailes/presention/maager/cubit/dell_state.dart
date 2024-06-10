part of 'dell_cubit.dart';

@immutable
sealed class DellState {}

final class DellInitial extends DellState {}

final class Dellload extends DellState {}
final class Dellsucess extends DellState {}
final class Delldel extends DellState {
  final String errmas;

  Delldel({required this.errmas});
}
