class NewsModel {
  final int id;
  final String title;
  final String summary;
  final String published;

  NewsModel(
      {required this.id,required this.title, required this.summary, required this.published});

  factory NewsModel.fromJson(Map json) {
    return NewsModel(
      id: json['id'],
      title: json['title'] ?? "",
      summary: json['summary'] ?? "",
      published: json['published'] ?? "",
    );
  }

  static List<NewsModel> getNewsDetails(List data) {
    return data.map((e) => NewsModel.fromJson(e)).toList();
  }
}
