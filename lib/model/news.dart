


class News{
  final String title;
  final String detail;
  final String urlToImage;


  News({
    required this.title,
    required this.detail,
    required this.urlToImage
});

  factory News.fromJson(Map<String, dynamic> json){
    return News(
        title: json['title'] ?? '',
        detail: json['detail'] ?? '',
        urlToImage: json['urlToImage'] ?? ''
    );
  }
}