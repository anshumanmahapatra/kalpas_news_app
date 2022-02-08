import '../model/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApi {
  Future<List<NewsModel>> getNews() async {
    final response = await http.get(
      Uri.parse('https://api.first.org/data/v1/news'),
    );

    if (response.statusCode == 200) {
      Map result = jsonDecode(response.body);
      List newsDetails = result['data'];
      return NewsModel.getNewsDetails(newsDetails);
    } else {
      throw Exception('Sorry we could not fetch any news');
    }
  }
}
