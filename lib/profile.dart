// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shatleh/post.dart';
import 'package:shatleh/stat_Widget.dart';
import 'package:shatleh/rootPage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Your Profile"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/editProfile');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 0, 202, 10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1))
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profile.jpeg'))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              //show username from DB
              username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              //show Email from DB
              email,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                statWidget("Followers", "!"), //Return follower count from DB
                statWidget("Following", "!"),
                //Return following count from DB
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<Post>>(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPost(Post post) {
    if (post.userId == UserId) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
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
                            left: BorderSide(
                                color: Colors.grey.withOpacity(0.5)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.share,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
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
    } else {
      return const Text('no Posts yet');
    }
  }
}

Stream<List<Post>> readPost() => FirebaseFirestore.instance
    .collection('posts')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Post.fromJson(doc.data())).toList());
