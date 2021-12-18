

import 'package:patterns_scoped/pages/models/post_model.dart';
import 'package:patterns_scoped/pages/services/http_service.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScoped extends Model{

  List<Post> items = [];
  bool isLoading = false;

  Future apiPostList() async {
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    print(response);
    isLoading = true;
    notifyListeners();

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }

    isLoading = false;
    notifyListeners();
    print("++++++++");
  }

  Future<bool> deletePostList(Post post) async {
    isLoading = false;
    notifyListeners();
    var response = await Network.Del(Network.API_Delete + post.id.toString(), Network.paramsEmpty());
    print("DeletePost => ${response.toString()}");

    isLoading = true;
    notifyListeners();

    return response != null;
  }

}