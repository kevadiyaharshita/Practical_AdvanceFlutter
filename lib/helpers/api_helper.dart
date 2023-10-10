import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/modal/Youtube_Modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();
  String api =
      'https://www.googleapis.com/youtube/v3/videos?key=AIzaSyCdr3ED7zq01SNSKQOrKP13u9WO9mcTfVg&part=snippet&chart=mostPopular';

  Future<List<YoutubeModal>?> getData() async {
    http.Response response = await http.get(Uri.parse(api));
    log('${response.statusCode}');
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      // List allData = data['ingredients'];
      List items = data['items'];
      print('id: ${data['items'][0]['id']}');
      List<YoutubeModal> youtubemodal = items
          .map((e) => YoutubeModal.fromMap(
                snippet: e['snippet'],
                id_video: e['id'],
              ))
          .toList();

      return youtubemodal;
    } else {
      return null;
    }
  }

  Future<List<YoutubeModal>?> getSearchData({required String query}) async {
    http.Response response = await http.get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?key=AIzaSyCdr3ED7zq01SNSKQOrKP13u9WO9mcTfVg&q=$query&part=snippet'));
    log('${response.statusCode}');
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      // List allData = data['ingredients'];
      List items = data['items'];
      print('id: ${data['items'][0]['id']}');
      List<YoutubeModal> youtubemodal = items
          .map((e) => YoutubeModal.fromMap(
                snippet: e['snippet'],
                id_video: e['id']['videoId'],
              ))
          .toList();

      return youtubemodal;
    } else {
      return null;
    }
  }
}
