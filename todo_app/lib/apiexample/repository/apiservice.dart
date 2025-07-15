import 'package:dio/dio.dart';

import '../model/user.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get('/users');
    return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
  }

  Future<UserModel> createUser(UserModel user) async {
    final response = await _dio.post('/users', data: user.toJson());
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> updateUser(int id, UserModel user) async {
    final response = await _dio.put('/users/$id', data: user.toJson());
    return UserModel.fromJson(response.data);
  }

  Future<void> deleteUser(int id) async {
    await _dio.delete('/users/$id');
  }
}

final ApiService apiService = ApiService();