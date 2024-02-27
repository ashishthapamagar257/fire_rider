import 'package:dio/dio.dart';
import 'package:fire_leader/api.dart';

//
// class ProductService{
//   static final _dio = Dio();
//
//   static Future userLogin({required Map data}) async {
//
//     try {
//       final response = await _dio.get(Api.getAllProducts);
//     } on DioException catch (err) {
//       throw '${err.response}';
//     }
//   }
//
//
// }

class ProductService{
  static final _dio = Dio();
  static Future userLogin({required Map data})async{
    try{
      final response = await  _dio.get(Api.getAllProducts);
    }on DioException catch(err){
      throw'${err.response}';
    }
  }
}