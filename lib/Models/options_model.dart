class Option {
  final String id;
  final String optionTextEnglish;
  final String optionTextFrench;
  final String question;

  Option.fromJson(Map<String, dynamic> data)
    :
      id = data['_id'],
      optionTextEnglish = data['optionTextEnglish'],
      optionTextFrench = data['optionTextFrench'],
      question = data['question'];

}