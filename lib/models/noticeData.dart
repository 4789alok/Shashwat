import 'package:json_annotation/json_annotation.dart';
import "noticeDetails.dart";
part 'noticeData.g.dart';

@JsonSerializable()
class NoticeData {
  NoticeData();

  late num status;
  late String msg;
  late List<NoticeDetails> news;
  
  factory NoticeData.fromJson(Map<String,dynamic> json) => _$NoticeDataFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeDataToJson(this);
}
