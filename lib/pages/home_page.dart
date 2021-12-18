
import 'package:flutter/material.dart';
import 'package:patterns_scoped/pages/scopes/scoped_model.dart';
import 'package:patterns_scoped/pages/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

import 'create_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeScoped scoped = new HomeScoped();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoped Model"),
      ),
      body: ScopedModel<HomeScoped>(
        model: scoped,
        child: ScopedModelDescendant<HomeScoped>(
          builder: (context, child, model) => Stack(
            children: [
              ListView.builder(
                itemCount: scoped.items.length,
                itemBuilder: (ctx, i) {
                  return itemOfList(scoped, scoped.items[i],context);
                },
              ),
              scoped.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePost()));
        },
      ),
    );
  }
}
