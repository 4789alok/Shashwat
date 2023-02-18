import 'package:json_annotation/json_annotation.dart';

part 'subjectDetails.g.dart';

@JsonSerializable()
class SubjectDetails {
  SubjectDetails();

  late num? id;
  late num? medium_id;
  late num? standard_id;
  late String? name;
  late String? notes;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory SubjectDetails.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectDetailsToJson(this);
}
