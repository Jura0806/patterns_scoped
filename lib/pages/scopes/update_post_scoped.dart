
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:patterns_scoped/pages/models/post_model.dart';
import 'package:patterns_scoped/pages/services/http_service.dart';
import 'package:scoped_model/scoped_model.dart';

import '../home_page.dart';

class UpdateScoped extends Model{

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  bool isLoading = false;
  Random random = new Random();


  void updatePostList({int id, BuildContext context}) async {
    Post post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));
      isLoading = true;
      notifyListeners();

    var response =
    await Network.PUT(Network.API_Update + id.toString(), Network.paramsUpdate(post));
    print(response);

      if(response != null){
        Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      }
      isLoading = false;
      notifyListeners();

    print("CreatePost => $response");
  }


}