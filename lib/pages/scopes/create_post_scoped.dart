

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:patterns_scoped/pages/models/post_model.dart';
import 'package:patterns_scoped/pages/services/http_service.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateScoped extends Model{

  Random random = new Random();
  bool isLoading = false ;
   Post post;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future<bool> createPostList() async {
    post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));

      isLoading = true;
      notifyListeners();

    var response =
    await Network.POST(Network.API_Create, Network.paramsCreate(post));

      isLoading = false;
      notifyListeners();

   return response != null;
  }

}