import 'package:dio/dio.dart';

Future<dynamic> getInfoPublish(id) async {
  var url = "https://jsonplaceholder.typicode.com/posts?userId=$id";
  try {
    final response = await Dio().get(url);
    print(response.data.runtimeType);
    return response.data;
  } catch (e) {
    print(e);
  }
}
