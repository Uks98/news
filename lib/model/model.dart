class News{
  String author;
  String title;
  String description;
  String urlImg;
  String content;

  News({this.author,this.title,this.description,this.urlImg,this.content,});

  factory News.fromJson( Map<String,dynamic> data){
    return News(
      author: data["author"] ?? "There's no writer",
      title: data["title"] ?? "",
      description: data["description"] ?? "",
      urlImg: data["urlToImage"] ?? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
      content: data["content"] ?? "",
    );
  }
}