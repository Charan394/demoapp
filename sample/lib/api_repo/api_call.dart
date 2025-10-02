
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample/api_repo/api_result_model.dart';
import 'package:sample/features/api_models.dart/sample_model.dart';


class ApiCall {

static Future<ApiResult<dynamic>> getData(String endpoint) async {
    final url=Uri.parse(endpoint);
    try{
  final response = await http.get(url);
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
     
      return ApiResult(data:SampleResponse.listFromJson(data) , status: ApiStatus.success);
    }

  return ApiResult(data: 'error', status: ApiStatus.failure,);
  
  }catch(e){
    return ApiResult(data: 'error', status: ApiStatus.failure);
        //lets go

  }
}
}
