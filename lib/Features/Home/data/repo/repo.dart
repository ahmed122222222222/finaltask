import 'package:dartz/dartz.dart';


import '../../../../core/apiservices/Failure.dart';


abstract class Repo {
  Future<Either<Failure, dynamic>> gettask(
      String endPoin,int pagenamber);

 
}