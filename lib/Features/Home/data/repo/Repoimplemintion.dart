import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finaltask/Features/Home/data/repo/repo.dart';
import 'package:finaltask/core/apiservices/Failure.dart';
import 'package:finaltask/core/apiservices/dio.dart';



class RepoImp extends Repo { 
  Dio dio=Dio(); 
  @override
  Future<Either<Failure, dynamic>> gettask(String endPoint,int pagenamber)async {
    try {
      final Request api = Request(dio);

      Map<String,dynamic> responseData = await api.getReqest(
        page: pagenamber,
          endPoint: endPoint,
          );
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
