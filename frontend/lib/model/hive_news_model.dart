import 'package:hive/hive.dart';

part 'hive_news_model.g.dart';

@HiveType(typeId: 0)
class HiveNewsModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String summary;

  @HiveField(2)
  late String published;

  @HiveField(3)
  late int id;
}
