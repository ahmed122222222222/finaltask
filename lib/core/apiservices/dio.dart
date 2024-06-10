import 'package:dio/dio.dart';
import 'dart:io';



class Request {
  String baseurl = "http://flutter.visooft-code.com/";
  final Dio dio;

  Request(this.dio);

Future<void> postAd({
  required String name,
  required String desc,
  required double price,
  required File firstImage,
  required List<File> images,
}) async {
  final url = 'http://flutter.visooft-code.com/api/ads';
  
  var dio = Dio();

  try {
    FormData formData = FormData.fromMap({
      'name': name,
      'desc': desc,
      'price': price,
      'first_image': await MultipartFile.fromFile(
        firstImage.path,
        filename: firstImage.path.split('/').last,
      ),
      'images': await Future.wait(images.map((image) async {
        return await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      })),
    });

    var response = await dio.post(url, data: formData, options: Options(
      headers: {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      },
    ));

    if (response.statusCode == 200) {
      print('Request successful');
      print(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print(response.data);
    }
  } catch (e) {
    print('Error: $e');
  }
}

  Future<dynamic> getReqest(
      {required String endPoint,  int page = 1,}) async {
   
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json', 
    };

    var re = await dio.get('$baseurl$endPoint?page=$page',
        options: Options(
          headers: headers,
        ));
    print('get ${re.statusCode}');
    return re.data;
  }

  Future<void> deleteAd(String adId) async {
  var dio = Dio();

  // API endpoint URL
  var url = 'http://flutter.visooft-code.com/api/ads/$adId';

  // Headers
  var headers = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  try {
    // Make the request
    var response = await dio.delete(url, options: Options(headers: headers));

    // Check if the request was successful
    if (response.statusCode == 200) {
      print('Ad deleted successfully');
    } else {
      print('Failed to delete ad. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
void updareq() async {
  var dio = Dio();

  // Create form data
  FormData formData = FormData.fromMap({
    'name': 'test add 42',
    'desc': 'description ',
    'price': '250',
    'old_images[0]': '12',
    'first_image': await MultipartFile.fromFile('/path/to/file', filename: 'first_image.jpg'),
    'images[]': await MultipartFile.fromFile('/path/to/file', filename: 'image.jpg'),
  });

  // Set headers
  var headers = {
    'Content-Type': 'multipart/form-data',
    'Accept': 'application/json'
  };

  try {
    // Make the request
    var response = await dio.post(
      'http://flutter.visooft-code.com/api/update/ads/42',
      data: formData,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print(response.statusMessage);
    }
  } catch (e) {
    print(e);
  }
}
Future<dynamic> updateAd(
  String adId, {
  String? name,
  String? desc,
  int? price,
  List<String>? imageUrls, // استبدل List<File> ب List<String>
}) async {
  var dio = Dio();

  var url = 'http://flutter.visooft-code.com/api/update/ads/$adId';
  var headers = {
    HttpHeaders.acceptHeader: 'application/json',
  };

  var formData = FormData();

  if (name != null) formData.fields.add(MapEntry('name', name));
  if (desc != null) formData.fields.add(MapEntry('desc', desc));
  if (price != null) formData.fields.add(MapEntry('price', price.toString()));

  // Only add image URLs if they are provided
  if (imageUrls != null && imageUrls.isNotEmpty) {
    for (var imageUrl in imageUrls) {
      // Add the image URL to the form data
      formData.fields.add(MapEntry('images[]', imageUrl));
    }
  }

  try {
    var response = await dio.post(url, data: formData, options: Options(headers: headers));

    print(response.data);
    // Handle successful update here
  } catch (e) {
    print('Error: $e');
    if (e is DioError && e.response != null && e.response?.statusCode == 422) {
      print('Validation errors: ${e.response?.data}');
      throw Exception('Validation errors occurred. Please check your input.');
    } else {
      throw Exception('An error occurred. Please try again later.');
    }
  }
}

  Future<void> AddAd({
    required String name,
    required String desc,
    required int price,
    required String firstImagePath,
    required List<String> imagePaths,
  }) async {
    try {
      MultipartFile firstImage = await _getFileFromAsset("asset/image/Screenshot 2024-05-27 120627.png");
      List<MultipartFile> images = [];
      for (String path in imagePaths) {
        images.add(await _getFileFromAsset("asset/image/Screenshot 2024-05-27 120627.png"));
      }

      FormData formData = FormData.fromMap({
        'name': name,
        'desc': desc,
        'price': price,
        'first_image': firstImage,
        'images[]': images,
      });

      Dio dio = Dio();
      Response response = await dio.post(
        'http://flutter.visooft-code.com/api/ads',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Ad created successfully!');
      } else {
        print('Failed to create ad: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  
}
Future<MultipartFile> _getFileFromAsset(String path) async {
    return MultipartFile.fromFile(path, filename: path.split('/').last);
  }
