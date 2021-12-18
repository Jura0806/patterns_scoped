
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_scoped/pages/models/post_model.dart';
import 'package:patterns_scoped/pages/scopes/scoped_model.dart';

import '../update_post.dart';

Widget itemOfList(HomeScoped scoped, Post post,BuildContext context) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePost(title: post.title,body: post.body,id: post.id,)));
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          scoped.deletePostList(post).then((value) => {
            if(value){
              scoped.apiPostList()
            }
          });
        },
      )
    ],
  );
}