import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finaltask/Features/detailes/data/repo/repo.dart';
import 'package:finaltask/core/apiservices/Failure.dart';
import 'package:finaltask/core/apiservices/dio.dart';



class delRepoImp extends delRepo { 
  Dio dio=Dio();
  
  @override
  Future<Either<Failure, void>> delete(id) async{
   try {
      final Request api = Request(dio);

       await api.deleteAd(
       id,
          );
    
          
    
      return right(Void);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
}
