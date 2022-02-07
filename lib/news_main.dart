import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:news_aboard/news_detail.dart';
import 'package:news_aboard/option_lan.dart';
import 'package:news_aboard/option_list.dart';
import 'model/model.dart';
import 'model/news_api.dart';

class NewsMain extends StatefulWidget {
  const NewsMain({Key key}) : super(key: key);

  @override
  _NewsMainState createState() => _NewsMainState();
}

class _NewsMainState extends State<NewsMain> {
  List<News> news = [];
  List<String> item = ["언어", "카테고리"];
  String dropdownValue = "언어";
  String searchName = "business";
  String lan = "kr";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final l = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OptionList()));
                if (searchName != null) {
                  searchName = l;
                  getNewsData();
                }
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () async {
                final lans = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanList()));
                if (lans != null) {
                  lan = lans;
                  getNewsData();
                } else {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              icon: Icon(
                Icons.sort_by_alpha,
                color: Colors.black,
              )),
        ],
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "Yummy News",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[200],
      //  floatingActionButton: FloatingActionButton(
      //    onPressed: () async {
      //      NewsApi api = NewsApi();
      //      List<News> news = await api.getNewsApi("sport");
      //      news.removeWhere((element) => element.description == "corona");
      //      for (final r in news) {
      //        print("${r.title}");
      //      }
      //    },
      //  ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 1000,
                  child: ListView.separated(
                      physics: ScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            // Divider(
                            //   thickness: 1.3,
                            //   endIndent: 8,
                            //   indent: 8,
                            //   color: Colors.grey[400],
                            // ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => NewsDetail(
                                  index: index,
                                  news: News(
                                    author: news[index].author,
                                    title: news[index].title,
                                    description: news[index].author,
                                    content: news[index].content,
                                    urlImg: news[index].urlImg,
                                  ),
                                )
                                ));
                          },
                          child: Card(
                            elevation: 5,
                            child: Stack(children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 13.0, top: 10),
                                  child: news[index].author.length <= 3
                                      ? Text(
                                          "${news[index].author} 기자",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      : Text(
                                          "${news[index].author}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Container(
                                  width: 500,
                                  height: 270,
                                  child: Image.network(
                                    news[index].urlImg,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 300),
                                child: Container(
                                    margin: EdgeInsets.all(18),
                                    child: Text(
                                      "${news[index].title}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                              ),
                              news[index].title.length <= 95 ? Padding(
                                padding: EdgeInsets.only(top: 360),
                                child: Container(
                                    margin: EdgeInsets.all(18),
                                    child: Text(
                                      "${news[index].description}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.grey[600]),
                                    )),
                              ):Padding(
                                padding: EdgeInsets.only(top: 380),
                                child: Container(
                                    margin: EdgeInsets.all(18),
                                    child: Text(
                                      "${news[index].description}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.grey[600]),
                                    )),
                              )
                            ]),
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget getPage(){
  //   if(news.isEmpty){
  //     return Container();
  //   }
  //   int _status = getStatus(news.first);
//
  //   return Container(
  //     color: colors[_status],
  //     child: Column(
  //       children: [
  //         Text("현재위치"),
  //         Text("${statusName}"),
  //         Image.asset(icon[_status],fit: BoxFit.contain,),
  //         Text(status[_status]),
  //         Text("통합 환경 대기 지수 : ${data.first.khai}"),
//
  //       ],
  //     ),
  //   );
  // }

  void getNewsData() async {
    NewsApi api = NewsApi();
    news = await api.getNewsApi(searchName, lan);
    news.removeWhere((element) => element.description == "business");
    setState(() {});
  }
}
