import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unit_test/user_model.dart';

class UserRepo {
  final http.Client client;
  UserRepo({required this.client});


  Future<User> getUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load user');
  }
}


