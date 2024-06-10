import 'package:dartz/dartz.dart';


import '../../../../core/apiservices/Failure.dart';


abstract class delRepo {
  Future<Either<Failure, dynamic>> delete(
     id);

 
}