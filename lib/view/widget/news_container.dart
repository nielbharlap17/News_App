import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:news_app_clone/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;
  final String newsCnt;
  const NewsContainer({
    Key? key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         FadeInImage.assetNetwork(
             height: 400,
             width: MediaQuery.of(context).size.width,
             fit: BoxFit.cover,
             placeholder:"C:/src/news_app_clone/assets/img/placeholder.jpg",
             image:imgUrl),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  newsHead.length > 90?
                  "${newsHead.substring(0,90)}...":newsHead,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  newsDes,
                  style: const TextStyle(fontSize: 12, color: Colors.black38),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  newsCnt != "--"?
                  newsCnt.length > 250 ? newsCnt.substring(0,250):
                  "${newsCnt.toString().substring(0,newsCnt.length-15)}..":newsCnt,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailViewScreen(newsUrl: newsUrl)));
                  },
                  child: const Text('Read More'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}