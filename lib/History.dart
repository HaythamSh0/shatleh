// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List history = [
    {'result': 'Lemon___canker', 'image': 'assets/images/olive.jpg'},
    {'result': 'Lemon_greening', 'image': 'assets/images/olive.jpg'},
    {'result': 'Olive___aculus_olearius', 'image': 'assets/images/olive.jpg'},
    {'result': 'Olive___Peacock_spot', 'image': 'assets/images/olive.jpg'},
    {'result': 'Tomato___Bacterial_spot', 'image': 'assets/images/olive.jpg'},
    {
      'result': 'Tomato_Yellow_Leaf_Curl_Virus',
      'image': 'assets/images/olive.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      backgroundColor: Colors.green[50],
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: ListView(
            children: [
              const Padding(padding: EdgeInsets.only(top: 8)),
              Card(
                child: Column(
                  children: [
                    for (int x = 0; x < history.length; x++)
                      historyList(
                        result: history[x]['result'],
                        img: history[x]['image'],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class historyList extends StatelessWidget {
  final result;
  final img;
  const historyList({super.key, this.result, this.img});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.history_toggle_off)),
            title: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(result),
            ),
            isThreeLine: true,
            subtitle: const Text('Date-time'),
          ),
          Image.asset(
            img,
            height: 250,
          ),
        ],
      ),
    );
  }
}
