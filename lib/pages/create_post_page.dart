import 'package:flutter/material.dart';
import 'package:patterns_scoped/pages/scopes/create_post_scoped.dart';

import 'home_page.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key key}) : super(key: key);
  static String id = "create_post";

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  CreateScoped scoped = new CreateScoped();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Create new Post",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            texField(hintText: "Title", controller: scoped.titleController),
            SizedBox(
              height: 30,
            ),
            texField(hintText: "Body", controller: scoped.bodyController),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              onPressed: () async {
                scoped.createPostList().then((value) => {
                  if(value){
                    Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false)
                  }
                });
              },
              child: Text(
                "Add",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget texField({hintText, controller}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}
