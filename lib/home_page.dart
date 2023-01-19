import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shatleh/post.dart';
import 'package:shatleh/rootPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String content = "";

class _HomePageState extends State<HomePage> {
  Future sharePost() async {
    try {
      final insertPost = FirebaseFirestore.instance.collection('posts').doc();
      final json = {
        'post_id': insertPost.id,
        'content': content,
        'userID': UserId,
        'likes': 0,
        'un': username
      };
      await insertPost.set(json);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          content = '';
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Posted Sucssefully!',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 0, 151, 5)),
                )
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      );
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text("Unable To post"),
              content: Text('${e.message}')));
    }
  }

  //here will recive json file that have the data to put it in the posts
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.green[50],
          body: StreamBuilder<List<Post>>(
            stream: readPost(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return const Text('no posts yet');
              } else if (snapshot.hasData) {
                final posts = snapshot.data!;
                return ListView(
                  children: posts.map(buildPost).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back)),
                      const Text("POST")
                    ],
                  ),
                  content: ListTile(
                    title: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          content = value;
                        });
                      },
                      maxLength: 255,
                      maxLines: 7,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: "put text here to post",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              if (content.isNotEmpty) {
                                if (content.length <= 255) {
                                  sharePost();
                                } else {
                                  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => const AlertDialog(
                                          title: Text("Unable To post"),
                                          content: Text(
                                              'the lenght of the post exceed 255 charachters')));
                                }
                              } else {
                                Navigator.of(context).pop();
                                showDialog(
                                    context: context,
                                    builder: (ctx) => const AlertDialog(
                                        title: Text("Unable To post"),
                                        content: Text('The post is empty')));
                              }
                            },
                            child: const Icon(Icons.post_add)),
                      ],
                    ),
                  ],
                ),
              );
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.post_add),
          ),
        ));
  }
}

Widget buildPost(Post post) {
  return Card(
    child: Column(children: <Widget>[
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(post.name),
        ),
      ),
      Text(
        style: const TextStyle(fontSize: 15),
        post.content,
        textAlign: TextAlign.left,
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
                    right: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                // ignore: sort_child_properties_last
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Icon(
                      Icons.thumb_up,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Like",
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
                      "Comment",
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
                        left: BorderSide(color: Colors.grey.withOpacity(0.5)))),
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

Stream<List<Post>> readPost() => FirebaseFirestore.instance
    .collection('posts')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Post.fromJson(doc.data())).toList());
