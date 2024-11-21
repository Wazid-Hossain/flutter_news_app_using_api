import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app_using_api/model/newsmodel.dart';

class ApiService {

final all_news_url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=987ff5b8314348a8bc12798bfedb23c7";
final breaking_news_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=987ff5b8314348a8bc12798bfedb23c7";


Future<List<NewsModel>> getAllnews() async{
    try{
        Response response = await get(Uri.parse(all_news_url));
        if(response.statusCode == 200) {
            Map<String, dynamic> json = jsonDecode(response.body);
            List<dynamic> body = json ['articles'];
            List<NewsModel> articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
            return articleslist;

        } else{
            throw ("No News Found");
        }

    } catch(e){
        throw e;

    }
}


Future<List<NewsModel>> getBrakeinNews() async{
    try{
        Response response = await get(Uri.parse(breaking_news_url));
        if(response.statusCode == 200) {
            Map<String, dynamic> json = jsonDecode(response.body);
            List<dynamic> body = json ['articles'];
            List<NewsModel> articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
            return articleslist;

        } else{
            throw ("No News Found");
        }

    } catch(e){
        throw e;

    }
}
}