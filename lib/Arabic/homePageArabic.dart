// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomePageArabic extends StatefulWidget {
  const HomePageArabic({super.key});

  @override
  State<HomePageArabic> createState() => _HomePageArabicState();
}

class _HomePageArabicState extends State<HomePageArabic> {
  List posts = [
    {
      "name": "haytham",
      "content":
          "none none none none none none none none none none none none none none none none none none"
    },
    {
      "name": "mohammad",
      "content":
          "none none none none none none none none none none none none none none none none none none"
    },
    {
      "name": "tahseen",
      "content":
          "none none none none none none none none none none none none none none none none none none"
    },
  ]; //here will recive json file that have the data to put it in the posts
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.green[50],
          body: ListView(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 8)),
              Card(
                child: Column(children: [
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: TextFormField(
                      maxLength: 255,
                      maxLines: 7,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(right: 10),
                        hintText: "اكتب المنشور هنا",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey.withOpacity(0.5)))),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "نشر",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              Padding(padding: EdgeInsets.only(right: 4)),
                              Icon(
                                Icons.post_add,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  )
                ]),
              ),
              for (int i = 0; i < posts.length; i++)
                postList(
                  name: posts[i]['name'],
                  content: posts[i]['content'],
                ),
            ],
          ),
        ));
  }
}

// ignore: camel_case_types
class postList extends StatelessWidget {
  final name;
  final content;
  const postList({super.key, this.name, this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(name),
          ),
          isThreeLine: true,
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              //show dialog with delete and edit options
            },
          ),
          subtitle: const Text('time'),
        ),
        Text(
          content,
          textAlign: TextAlign.right,
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
        ),
        Image.asset(
          'assets/images/Logo.jpeg',
          height: 300,
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left:
                              BorderSide(color: Colors.grey.withOpacity(0.5)))),
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "إعجاب",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/comments');
                },
                child: Padding(
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "تعليق",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(color: Colors.grey.withOpacity(0.5)))),
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Share",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                ),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 5))
      ]),
    );
  }
}
