import 'package:json_annotation/json_annotation.dart';
import "testDetails.dart";
part 'testData.g.dart';

@JsonSerializable()
class TestData {
  TestData();

  late num status;
  late String msg;
  late List<TestDetails> test;
  
  factory TestData.fromJson(Map<String,dynamic> json) => _$TestDataFromJson(json);
  Map<String, dynamic> toJson() => _$TestDataToJson(this);
}
