// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answerListDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerListDetails _$AnswerListDetailsFromJson(Map<String, dynamic> json) =>
    AnswerListDetails()
      ..id = json['id'] as num?
      ..medium_id = json['medium_id'] as num?
      ..standard_id = json['standard_id'] as num?
      ..subject_id = json['subject_id'] as num?
      ..chapter_id = json['chapter_id'] as num?
      ..test_id = json['test_id'] as num?
      ..type = json['type'] as String?
      ..option5 = json['option5'] as String?
      ..option6 = json['option6'] as String?
      ..question = json['question'] as String?
      ..question_image = json['question_image'] as String?
      ..option1 = json['option1'] as String?
      ..option2 = json['option2'] as String?
      ..option3 = json['option3'] as String?
      ..option4 = json['option4'] as String?
      ..option_image1 = json['option_image1'] as String?
      ..option_image2 = json['option_image2'] as String?
      ..option_image3 = json['option_image3'] as String?
      ..option_image4 = json['option_image4'] as String?
      ..answer = json['answer'] as String?
      ..marks = json['marks'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?
      ..user_answer = json['user_answer'] as String?;

Map<String, dynamic> _$AnswerListDetailsToJson(AnswerListDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medium_id': instance.medium_id,
      'standard_id': instance.standard_id,
      'subject_id': instance.subject_id,
      'chapter_id': instance.chapter_id,
      'test_id': instance.test_id,
      'type': instance.type,
      'option5': instance.option5,
      'option6': instance.option6,
      'question': instance.question,
      'question_image': instance.question_image,
      'option1': instance.option1,
      'option2': instance.option2,
      'option3': instance.option3,
      'option4': instance.option4,
      'option_image1': instance.option_image1,
      'option_image2': instance.option_image2,
      'option_image3': instance.option_image3,
      'option_image4': instance.option_image4,
      'answer': instance.answer,
      'marks': instance.marks,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'user_answer': instance.user_answer,
    };
