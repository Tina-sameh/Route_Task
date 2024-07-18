import 'dart:convert';

import 'package:task/Api/api_constants.dart';
import 'package:http/http.dart' as http;

import '../model/products_response.dart';
class ApiManager{
  static Future<ProductsResponse> getProductes() async{
    Uri uri=Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,{});
    try{
      var response= await http.get(uri);
      var responseBody=response.body;
      var json= jsonDecode(responseBody);
      ProductsResponse productsResponse= ProductsResponse.fromJson(json);
      return productsResponse;
    }catch(e){
      throw e ;
    }

  }

  static Future<ProductsResponse> searchProductes(String query) async{
    Uri uri=Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApiSearch,{
      "title":query
    });
    try{
      var response= await http.get(uri);
      var responseBody=response.body;
      var json= jsonDecode(responseBody);
      ProductsResponse productsResponse= ProductsResponse.fromJson(json);
      return productsResponse;
    }catch(e){
      throw e ;
    }

  }
}