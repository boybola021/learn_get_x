import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'model.dart';

class Api {
  static const String baseUrl = "fakestoreapi.com";
  static const String apiProduct = "/products";
  static const String apiAddCart = "/carts";
  static const String apiUser = "/users";
  static const String apiCategory = "/products/categories";
  static const String apiGetSingleCategory = "products/category";
  static const Map<String, String> headersMedia = {
    'Content-Type': 'application/json'
  };
}

abstract class Network {
  Future<String?> getMethod({
    String baseUrl = Api.baseUrl,
    String api = Api.apiProduct,
  });

  Future<String?> getCategory(
      {String baseUrl = Api.baseUrl, String api = Api.apiCategory});
}

class HttpService extends Network {
  @override
  Future<String?> getMethod(
      {String baseUrl = Api.baseUrl, String api = Api.apiProduct}) async {
    try {
      Uri url = Uri.http(baseUrl, api);
      final response = await get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      debugPrint("Error: getMethod => $e");
      throw Exception("ERROR: getMethod => $e");
    }
    return null;
  }

  @override
  Future<String?> getCategory(
      {String baseUrl = Api.baseUrl, String api = Api.apiCategory}) async {
    try {
      Uri url = Uri.http(baseUrl, api);
      final response = await get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception("ERROR: $e");
    }
    return null;
  }
}

abstract class RepozitoryProduct {
  Future<List<Products>> fetchData();
}

class RepositoryProductImpl implements RepozitoryProduct {
  final Network network;

  RepositoryProductImpl({required this.network});

  @override
  Future<List<Products>> fetchData() async {
    String response = await network.getMethod(
          baseUrl: Api.baseUrl,
          api: Api.apiProduct,
        ) ??
        "[]";
    List list = jsonDecode(response);
    List<Products> product = list.map((e) => Products.fromJson(e)).toList();
    return product;
  }
}

late RepozitoryProduct repository;

void serviceLocator() {
  repository = RepositoryProductImpl(network: HttpService());
}
