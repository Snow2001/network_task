
import 'dart:convert';

import 'package:http/http.dart';

import 'Post.dart';

class Network{
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type' : "application/json; charset=UTF-8"
  };

  static String API_LIST = "/api/v1/employees";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/";//id
  static String API_DELETE = "/api/v1/delete/"; //id

  static Future<String?> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, api, params);
    var response = await get(url, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, api);
    var response = await post(url, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, api);
    var response = await put(url, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 202){
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, api, params);
    var response = await delete(url, headers: headers,);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty(){
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsUpdate(Post post){
    Map<String, String> params = Map();
    params.addAll({
      "id": post.id.toString(),
      "employee_name": post.employee_name!,
      "employee_salary": post.employee_salary.toString(),
      "employee_age": post.employee_age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsCreate(Post post){
    Map<String, String> params = Map();
    params.addAll({
      "employee_name": post.employee_name!,
      "employee_salary": post.employee_salary.toString(),
      "employee_age": post.employee_age.toString(),
    });
    return params;
  }
}
