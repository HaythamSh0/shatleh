// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  List comments = [
    {"name": "haytham", "comment": "hello my name is haytham"},
    {"name": "mohammad", "comment": "hello my name is mohammad"},
    {"name": "tahseen", "comment": "hello my name is tahseen"},
  ]; //here will recive json file that have the data to put it in the posts
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 30,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int x = 0; x < comments.length; x++)
                    CommentsList(
                      name: comments[x]['name'],
                      comment: comments[x]['comment'],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(top: BorderSide(color: Colors.grey))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "leave comment here",
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {},
                            ),
                            contentPadding: const EdgeInsets.all(5),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  final name;
  final comment;
  const CommentsList({super.key, this.name, this.comment});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text(comment),
    );
  }
}
