// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SearchArabic extends StatefulWidget {
  const SearchArabic({super.key});

  @override
  State<SearchArabic> createState() => _SearchState();
}

class _SearchState extends State<SearchArabic> {
  String finalSelectedResult = 'بحث';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 140, 7)),
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    final selectedSearch = await showSearch(
                      context: context,
                      delegate: MySearchDelegate(
                          allResults: result, suggestions: sug),
                    );
                    setState(() {
                      finalSelectedResult = selectedSearch;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 0, 140, 7),
                  )),
              Text(
                finalSelectedResult,
                style: const TextStyle(color: Color.fromARGB(255, 0, 140, 7)),
              ),
            ],
          ),
        ),
        // ListView() later when start backend add search results
      ],
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: Text(
    //       finalSelectedResult,
    //       style: const TextStyle(
    //         fontSize: 35,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //     actions: [
    //       IconButton(
    //           onPressed: () async {
    //             final selectedSearch = await showSearch(
    //               context: context,
    //               delegate:
    //                   MySearchDelegate(allResults: result, suggestions: sug),
    //             );
    //             setState(() {
    //               finalSelectedResult = selectedSearch;
    //             });
    //           },
    //           icon: const Icon(Icons.search))
    //     ],
    //     backgroundColor: Colors.transparent,
    //   ),
    // );
  }
}

class MySearchDelegate extends SearchDelegate {
  final List<String> allResults;
  final List<String> suggestions;

  MySearchDelegate({required this.allResults, required this.suggestions});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: non_constant_identifier_names
    final List<String> Results = allResults
        .where(
          (result) => result.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: Results.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(Results.elementAt(index)),
          onTap: () {
            query = Results[index];
            close(context, query);
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggest = suggestions
        .where(
          (sug) => sug.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: suggest.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(suggest.elementAt(index)),
          onTap: () {
            query = suggest[index];
            close(context, query);
          },
        ),
      ),
    );
  }
}

final List<String> sug = [
  'e',
  'f',
  'g',
];

final List<String> result = [
  'a',
  'b',
  'c',
];
