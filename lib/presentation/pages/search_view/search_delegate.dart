import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    "Pear",
    "Watermelons",
    "Oranges",
    "Blueberries",
    "Strawberries",
    "Raspberries",
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: super.appBarTheme(context).appBarTheme.copyWith(
                elevation: 0.0,
                backgroundColor: Colors.transparent
              ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    if (matchQuery.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        },
        itemCount: matchQuery.length,
      );
    } else {
      return Center(child: Text("Uh oh no matchs"));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Text("sUGG");
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text(searchTerms[i]),
      ),
      itemCount: searchTerms.length,
    );

    //     List<String> matchQuery = [];

    // for(var fruit in searchTerms)
    //   {
    //     if(fruit.toLowerCase().contains(query.toLowerCase()))
    //       {
    //         matchQuery.add(fruit);
    //       }
    //   }

    // if(matchQuery.isNotEmpty){
    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    //   itemCount: matchQuery.length,
    // );
    // }else{
    //   return Text("Uh oh no matchs");
    // }
  }
}
