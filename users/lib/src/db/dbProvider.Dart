import 'package:dio/dio.dart';
import 'package:users/src/model/User.dart';

import 'database.dart';

class UserApiProvider {
  Future<List<User>> getAllUser() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    Response response = await Dio().get(url);
    return (response.data as List).map((user) {
      DBProvider.db.createUser(User.fromJson(user));
    }).toList();
  }
}
