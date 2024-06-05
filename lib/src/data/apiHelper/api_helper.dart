import 'package:dio/dio.dart';
import 'package:pratik_testing/src/presentation/view/homePage/model/get_api_model.dart';

class ApiHelper {
  Dio dio = Dio();
   Future<List<GetApiCall>?> getApiFunction() async {
    try {
      Response response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> dataResponse = response.data;
        return dataResponse.map((e) => GetApiCall.fromJson(e)).toList();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
// Future<TestModel?> demoApi()
// async {
//   Dio dio = Dio();
//   Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
//   if(response.statusCode == 200 || response.statusCode == 201)
//     {
//       return TestModel.fromJson(response.data);
//     }
//   else
//     {
//        return null;
//     }
// }

  // Future<LoginModel?> postApiCall() async {
  //   try {
  //     var data = {
  //       "email": "j.cena@ordo.eu",
  //       "password": "Kristian1@",
  //       "app": "WAITER"
  //     };
  //
  //     Response response =
  //     await dio.post("https://fa.hypertuning.it/api/v2/users/login",data: data);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       LoginModel loginModel = LoginModel.fromJson(response.data);
  //       return loginModel;
  //       // print(response);
  //       // print(loginModel);
  //     }
  //   } catch (e) {
  //     if (e == DioException) {
  //       throw Exception();
  //     } else {
  //       throw Exception();
  //     }
  //   }
  // }
}
