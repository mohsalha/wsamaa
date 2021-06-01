import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wsamaa_project/api/api_setting.dart';

class ApiReqeusets {
  Future<List> getAllPosts() async {
    try {
      var response = await http.get(Uri.parse(ApiSetting.POSTS));
      List data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print('get all post catch : $e');
      return [];
    }
  }

  Future<List> getCategory() async {
    try {
      var response = await http.get(Uri.parse(ApiSetting.CATEGORY));
      List data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print('get category catch $e');
      return [];
    }
  }

  Future<List> getPostsCategory(int id) async {
    try {
      var response = await http.get(Uri.parse(ApiSetting.postCategory(id)));
      print('response type${response.body.runtimeType}');
      List data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print('postCategory ex : $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> getPostsMedia(int id) async {
    try {
      var response = await http.get(Uri.parse(ApiSetting.postMedia(id)));
      Map<String, dynamic> data = jsonDecode(response.body);
      print('media ${data.length}');
      return data;
    } catch (e) {
      print('media ex : $e');
      return {};
    }
  }
}
