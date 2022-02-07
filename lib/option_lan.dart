import 'package:flutter/material.dart';

class LanList extends StatefulWidget {
  const LanList({Key key}) : super(key: key);

  @override
  _LanListState createState() => _LanListState();
}

class _LanListState extends State<LanList> {
  List<String> lan = [
    "kr",
    "us",
    'jp',
    'cn',
  ];
  List<String> _explain = ["한국어","English","Japan","China"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Language"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 1000,
                child: ListView.separated(
                    itemBuilder: (context, int index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          tileColor: Colors.white,
                          onTap: (){
                            Navigator.of(context).pop(lan[index]);
                          },
                          subtitle: Text(_explain[index]),
                          title: Text(
                            lan[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: lan.length)),
          ],
        ),
      ),
    );
  }
}
