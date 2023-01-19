// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

class HistoryArabic extends StatefulWidget {
  const HistoryArabic({super.key});

  @override
  State<HistoryArabic> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryArabic> {
  List history = [
    {'result': 'مرض القرنية لليمون', 'image': 'assets/images/olive.jpg'},
    {'result': 'مرض التحمر الخضراء لليمون', 'image': 'assets/images/olive.jpg'},
    {'result': 'أكريوس أولياريوس - زيتون', 'image': 'assets/images/olive.jpg'},
    {'result': 'النقطة العقابية - زيتون', 'image': 'assets/images/olive.jpg'},
    {'result': 'البقع البكتيرية - طماطم', 'image': 'assets/images/olive.jpg'},
    {
      'result': 'فيروس الأوراق الصفراء الملتوية - طماطم',
      'image': 'assets/images/olive.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('السجلات'),
      ),
      backgroundColor: Colors.green[50],
      body: Directionality(
        textDirection: TextDirection.rtl,
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
