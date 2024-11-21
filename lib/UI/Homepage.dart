import 'package:flutter/material.dart';
import 'package:news_app_using_api/UI/all_news.dart';
import 'package:news_app_using_api/UI/breaking_news.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
    (length: 2, child: Scaffold
    (appBar: AppBar
    (title: Center(child: Text("Flutter News App")),
    bottom: TabBar(tabs: [
      Tab(text: 
      "Braking News"
      ),
            Tab(text: 
            "All News"
            ,)

      ],
      ),
    ),
    
    body: TabBarView(children: [
      BreakingNews(),
      AllNews(),
    ],
    ),
    )
    );
  }
}