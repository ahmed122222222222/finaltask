import 'package:dartz/dartz.dart';
import 'package:finaltask/core/apiservices/Failure.dart';


abstract class addRepo {
  Future<Either<Failure, void>>  add(name,desc,price,firstImagePath,imagePaths);

 
}