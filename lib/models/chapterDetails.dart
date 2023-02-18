import 'package:json_annotation/json_annotation.dart';

part 'chapterDetails.g.dart';

@JsonSerializable()
class ChapterDetails {
  ChapterDetails();

  late num? id;
  late num? medium_id;
  late num? standard_id;
  late num? subject_id;
  late String? name;
  late String? notes;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory ChapterDetails.fromJson(Map<String, dynamic> json) =>
      _$ChapterDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterDetailsToJson(this);
}
