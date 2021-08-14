import 'package:healthlane_mobileapp2_survey/Models/options_model.dart';

class Question {
  final String id;
  final bool compulsory;
  final String englishText;
  final String frenchText;
  final String questionType;
  final String gender;
  final List<Option> options;

  Question.fromJson(Map<dynamic, dynamic> data)
    : id = data['_id'],
      compulsory = data['compulsory'],
      englishText = data['englishText'],
      frenchText = data['frenchText'],
      questionType = data['questionType'],
      gender = data['gender'],
      options = List<Option>.from(data['options'].map((e)=>Option.fromJson(e)).toList());
}