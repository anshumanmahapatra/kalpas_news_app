import 'package:hive/hive.dart';

import '../model/hive_news_model.dart';

class HiveNewsDb {
  Future addNews(String title, String summary, String published, int id) async {
    final news = HiveNewsModel()
      ..title = title
      ..summary = summary
      ..published = published
      ..id = id;

    final box = Boxes.getNews();
    box.put('$id', news);
  }

  void deleteNews(HiveNewsModel hiveNewsModel) {
    hiveNewsModel.delete();
  }
}

class Boxes {
  static Box<HiveNewsModel> getNews() => Hive.box<HiveNewsModel>('news');
}
