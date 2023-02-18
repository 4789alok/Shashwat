import 'package:json_annotation/json_annotation.dart';

part 'standardDetails.g.dart';

@JsonSerializable()
class StandardDetails {
  StandardDetails();

  late num? id;
  late num? medium_id;
  late String? name;
  late String? notes;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory StandardDetails.fromJson(Map<String, dynamic> json) =>
      _$StandardDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$StandardDetailsToJson(this);
}
