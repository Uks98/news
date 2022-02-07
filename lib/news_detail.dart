import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_aboard/model/model.dart';
import 'empty_appvar.dart';
import 'package:clay_containers/clay_containers.dart';

import 'news_main.dart';

class NewsDetail extends StatefulWidget {
  int index;
  News news;

  NewsDetail({Key key, this.news, this.index}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: ClayContainer(
                      color: Colors.grey[100],
                      child: Icon(Icons.arrow_back_ios_sharp,color: Colors.grey[500],),
                      curveType: CurveType.convex,
                      height: 50,
                      width: 50,
                      borderRadius: 60,
                      depth: 40,
                      spread: 40,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 20.0,top: 10),
                  child: ClayContainer(
                    color: Colors.grey[100],
                    child: Icon(Icons.share,color: Colors.grey[500],),
                    curveType: CurveType.convex,
                    height: 50,
                    width: 50,
                    borderRadius: 60,
                    depth: 40,
                    spread: 40,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 230,
                width: 370,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      widget.news.urlImg,
                      fit: BoxFit.cover,
                      scale: 3,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Container(
                margin: EdgeInsets.all(11),
                child: Text(
                  "${widget.news.title}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      letterSpacing: 0.5),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.news.author}",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey[500],
                        letterSpacing: 0.5),
                  ),
                  widget.news.author.length<20?Padding(
                    padding: const EdgeInsets.only(right: 17.0),
                    child: Text(
                      "10 Jan 2020",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.grey[500],
                          letterSpacing: 0.5),
                    ),
                  ):Container()
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  widget.news.content,
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
