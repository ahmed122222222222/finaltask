import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finaltask/Features/update/data/repo/uprepo.dart';
import 'package:finaltask/core/apiservices/Failure.dart';
import 'package:finaltask/core/apiservices/dio.dart';

class upRepoImp extends upRepo { 
  Dio dio=Dio(); 
  @override
  Future<Either<Failure, dynamic>> gettask(String adId,  String? name,String? desc,int? price,List<String>? imageUrls,)async {
    try {
      final Request api = Request(dio);

      Map<String,dynamic> responseData = await api.updateAd(adId,name: name,desc: desc,price: price,imageUrls: imageUrls);
      Map<String,dynamic>  courses = responseData;
          
      print(courses);
      return right(courses);
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