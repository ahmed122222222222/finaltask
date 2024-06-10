import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/apiservices/Failure.dart';

abstract class upRepo {
  Future<Either<Failure, dynamic>> gettask(String adId,  String? name,String? desc,int? price, List<String>? imageUrls);
}
