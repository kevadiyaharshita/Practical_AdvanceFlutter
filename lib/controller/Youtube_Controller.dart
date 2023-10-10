import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/modal/Youtube_Modal.dart';

import '../helpers/api_helper.dart';

class YoutubeController extends ChangeNotifier {
  List<YoutubeModal>? ym;
  List<YoutubeModal>? searchym;

  Future<List<YoutubeModal>?> getData() async {
    ym = await ApiHelper.apiHelper.getData();
    notifyListeners();
    return ym;
  }

  Future<List<YoutubeModal>?> getSearchData({required String query}) async {
   searchym = await ApiHelper.apiHelper.getSearchData(query: query);
    notifyListeners();
    return searchym;

  }


  YoutubeController() {
    getData();
  }
}
