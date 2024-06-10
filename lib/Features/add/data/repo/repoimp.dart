import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finaltask/Features/add/data/repo/repo.dart';
import 'package:finaltask/core/apiservices/Failure.dart';
import 'package:finaltask/core/apiservices/dio.dart';


class addRepoimp extends addRepo{

  Dio dio =Dio();
  
  @override
  Future<Either<Failure, void>> add(name,desc,price,firstImagePath,imagePaths) async{
   try {
      final Request api = Request(dio);

       await api.AddAd(
       name:name , desc: desc, price: price, firstImagePath: firstImagePath, imagePaths: imagePaths,
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
