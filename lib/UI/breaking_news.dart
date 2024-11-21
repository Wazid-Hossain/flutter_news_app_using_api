import 'package:flutter/material.dart';
import 'package:news_app_using_api/componets/news_item_list.dart';
import 'package:news_app_using_api/model/newsmodel.dart';
import 'package:news_app_using_api/service/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getBrakeinNews(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<NewsModel> articleslist = snapshot.data ?? [];
          return ListView.builder(itemBuilder: (context, index)
          {
            
            return NewsItemList(newsModel: articleslist[index],);

          }, itemCount: articleslist.length,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      ),
    );
  }
}