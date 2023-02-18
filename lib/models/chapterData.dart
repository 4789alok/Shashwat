import 'package:json_annotation/json_annotation.dart';
import 'package:shashwat/models/index.dart';
part 'chapterData.g.dart';

@JsonSerializable()
class ChapterData {
  ChapterData();

  late num status;
  late String msg;
  late List<ChapterDetails> chapter;
  late List<BannerDetails>? slider;

  factory ChapterData.fromJson(Map<String, dynamic> json) =>
      _$ChapterDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterDataToJson(this);
}
