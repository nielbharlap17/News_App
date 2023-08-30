import 'package:flutter/material.dart';
import 'package:news_app_clone/controller/fetch_news.dart';
import 'package:news_app_clone/model/NewsArt.dart';
import 'package:news_app_clone/view/widget/news_container.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  GetNews() async {

   newsArt = await FetchNews.fetchNews();
  setState(() {
isLoading = false;
  });
  }
  @override
  void initState(){
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage : 0),
        scrollDirection: Axis.vertical,
          onPageChanged: (value){
          setState(() {
            isLoading = true;
          });
            GetNews();
          },
          itemBuilder: (context,index) {

            return  isLoading ? Center (child: CircularProgressIndicator(),):NewsContainer(
                imgUrl: newsArt.imgUrl,
            newsCnt: newsArt.newsCnt,
                newsHead: newsArt.newsHead,
                newsDes: newsArt.newsDes,
                newsUrl: newsArt.newsUrl);
          }),
    );
  }
}
