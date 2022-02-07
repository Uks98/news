import 'package:flutter/material.dart';

class OptionList extends StatefulWidget {
  const OptionList({Key key}) : super(key: key);

  @override
  _OptionListState createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  List<String> category = [
    "business",
    "entertainment",
    'general',
    'health',
    "science",
    "sports",
    "technology"
  ];
  List<String> explain = ["비즈니스","연애","정부","건강","과학","스포츠","기술"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("카테고리"),
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
                            Navigator.of(context).pop(category[index]);
                          },
                          subtitle: Text(explain[index]),
                          title: Text(
                            category[index],
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
                    itemCount: category.length)),
          ],
        ),
      ),
    );
  }
}
