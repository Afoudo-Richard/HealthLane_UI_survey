import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:healthlane_mobileapp2_survey/Widgets/checkbox_answer.dart';
import 'package:healthlane_mobileapp2_survey/Widgets/radio_answer.dart';
import 'package:healthlane_mobileapp2_survey/Widgets/textfield_answer.dart';
import 'package:healthlane_mobileapp2_survey/constants/constants.dart';

import 'package:healthlane_mobileapp2_survey/Models/question_model.dart';
import 'package:healthlane_mobileapp2_survey/Models/options_model.dart';

import 'Widgets/pop_up_containier.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  bool boxChecked = false;
  bool radioChecked = false;
  int currentQuestion = 0;
  bool showPopup = false;

  List _allowNext = [];

  int _selected = 0;

  List<Question> _questions;
  final _formkey = GlobalKey<FormBuilderState>();

  List<Question> fetchQuestions() {
    List<Question> questions = [];

    Map<String, dynamic> data = jsonDecode(jsonData);

    for (var question in data['questions']) {
      questions.add(Question.fromJson(question));
    }

    // data['questions'].map((e) => {questions.add(Question.fromJson(e))});

    return questions;
  }

  _nextQuestion() {
    if (currentQuestion < _questions.length - 1) {
      setState(() {
        currentQuestion++;
        print(currentQuestion);
      });
    }
  }

  _prevQuestion() {
    if (currentQuestion != 0) {
      setState(() {
        currentQuestion--;
        print(currentQuestion);
      });
    }
  }

  _submitForm() {
    _formkey.currentState.save();
    print(_formkey.currentState.value);

    Map answers = _formkey.currentState.value;

    List<Map> results = [];
    List<Question> all_questions = fetchQuestions();

    for (var question in all_questions) {
      for (var key in answers.keys) {
        if (key == question.id) {
          var temp = {};
          temp['question'] = key;

          switch (question.questionType) {
            case "multiple_choice_single_answer":
              temp['options'] = [answers[key]];
              break;
            case "multiple_choice_multiple_answer":
              temp['options'] = answers[key];
              break;
            // case "boolean_type":
            //   temp['options'] = [answers[key]];
            //   break;
            case 'number':
              temp['number'] = int.parse(answers[key]);
              break;
            case 'text':
              temp['text'] = answers[key];
              break;
          }

          results.add(temp);
          break;
        }
      }
    }

    print(results);
  }

  _generateQuestions(List<Question> questions) {
    List<Widget> listOfQuestions = [];
    questions.forEach((item) {
      var generatedQuestion = Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                item.englishText,
                style: kButtonTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: Column(
                children: [_generateOptions(item)],
              ),
            ),
          ],
        ),
      );

      listOfQuestions.add(generatedQuestion);
    });

    return listOfQuestions;
  }

  _generateOptions(Question item) {
    switch (item.questionType) {
      case "multiple_choice_single_answer":
        return FormBuilderRadioGroup(
          onChanged: (answer) {
            _allowNext[currentQuestion] = answer.isEmpty ? false : true;
          },
          name: item.id,
          options: List<FormBuilderFieldOption>.from(
              item.options.map((e) => FormBuilderFieldOption(
                    value: e.id,
                    child: Text(
                      e.optionTextEnglish,
                      style: kButtonTextStyle,
                    ),
                  ))),
        );

        break;
      case "multiple_choice_multiple_answer":
        return FormBuilderCheckboxGroup(
          onChanged: (answers) {
            _allowNext[currentQuestion] = answers.isEmpty ? false : true;
          },
          name: item.id,
          options: List<FormBuilderFieldOption>.from(
              item.options.map((e) => FormBuilderFieldOption(
                    value: e.id,
                    child: Text(
                      e.optionTextEnglish,
                      style: kButtonTextStyle,
                    ),
                  ))),
        );

        break;
      // case "boolean_type":
      //   return FormBuilderRadioGroup(name: item.id, options: [
      //     FormBuilderFieldOption(
      //       value: "yes",
      //       child: Text("Yes"),
      //     ),
      //     FormBuilderFieldOption(
      //       value: "no",
      //       child: Text("No"),
      //     ),
      //   ]);
      //   break;

      case 'number':
        return FormBuilderTextField(
          onChanged: (value) {
            final alphanumeric = RegExp(r'^[0-9]+$');
            var match = alphanumeric.hasMatch(value);

            if (value.isEmpty) {
              _allowNext[currentQuestion] = false;
            } else {
              if (match == false) {
                _allowNext[currentQuestion] = false;
                final snackBar = SnackBar(
                  content: Text('Only a number is required'),
                  duration: Duration(
                    seconds: 1,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                _allowNext[currentQuestion] = true;
              }
            }
          },
          name: item.id,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Enter you Answer here',
            labelText: 'Your Answer',
            hintStyle: TextStyle(fontSize: 15),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          ),
          // valueTransformer: (text) => num.tryParse(text),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            FormBuilderValidators.numeric(context),
            FormBuilderValidators.max(context, 70),
          ]),
          keyboardType: TextInputType.number,
        );
        break;
      case 'text':
        return FormBuilderTextField(
          onChanged: (value) {
            _allowNext[currentQuestion] = value.isEmpty ? false : true;
          },
          name: item.id,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            labelText: 'Answer',
            hintStyle: TextStyle(fontSize: 15),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          ),
          // valueTransformer: (text) => num.tryParse(text),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            FormBuilderValidators.numeric(context),
            FormBuilderValidators.max(context, 70),
          ]),
          keyboardType: TextInputType.text,
        );
        break;
      case 'date_time':
        return FormBuilderDateTimePicker(
          onChanged: (datetime) {
            _allowNext[currentQuestion] =
                datetime.toString().isEmpty ? false : true;
          },
          name: 'date',
          // onChanged: _onChanged,
          inputType: InputType.both,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            labelText: 'Date Time',
            hintStyle: TextStyle(fontSize: 15),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          ),
          // initialValue: DateTime.now(),
          // enabled: true,
        );
        break;

      default:
        return Text("hello world");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questions = fetchQuestions();
    _allowNext.length = _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_rounded,
                  color: kPrimaryColor,
                  size: 40,
                ),
                SizedBox(width: 15),
                Text(
                  'Your Medical Information',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.grey.shade50,
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondaryLight,
                          ),
                        ),
                        Container(
                          height: 8,
                          width: (MediaQuery.of(context).size.width /
                                  _questions.length.toDouble()) *
                              (currentQuestion + 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kSecondaryLight,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kSecondaryLight2,
                            ),
                            child: Text(
                              '1 Question',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Sleep (${currentQuestion + 1}/${_questions.length})',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                icon: Icon(Icons.more_horiz_rounded),
                                onPressed: () {
                                  setState(() {
                                    showPopup = !showPopup;
                                  });
                                },
                                iconSize: 30,
                                color: kPrimaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView(
                    children: [
                      FormBuilder(
                        key: _formkey,
                        child: IndexedStack(
                          index: currentQuestion,
                          children: _generateQuestions(_questions),
                        ),
                        onChanged: () {
                          print("Print my form has changed");
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          showPopup
              ? Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kSecondaryLight,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(0, 3),
                            color: Colors.grey.shade300,
                          )
                        ]),
                    height: MediaQuery.of(context).size.height * 0.62,
                    child: ListView(
                      children: [
                        PopupContainer(
                          category: 'Family History',
                          child: Icon(
                            Icons.check,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                        ),
                        PopupContainer(
                            category: 'Lifestyle',
                            child: Icon(
                              Icons.check,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        PopupContainer(
                          category: 'Sleep(7/13)',
                          child: Text(
                            '1 Question',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -3),
              color: Colors.grey.shade50,
              spreadRadius: 1.5,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentQuestion != 0
                ? ReusableButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: kPrimaryColor,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Back',
                          style: kButtonTextStyle,
                        ),
                      ],
                    ),
                    onTap: () {
                      print(_allowNext);
                      _prevQuestion();
                    },
                  )
                : SizedBox(),
            currentQuestion != _questions.length - 1
                ? ReusableButton(
                    child: Row(
                      children: [
                        Text(
                          'Next',
                          style: kButtonTextStyle,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: kPrimaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                    onTap: () {
                      print(_allowNext);
                      if (_questions[currentQuestion].compulsory) {
                        if (_allowNext[currentQuestion] == true) {
                          _nextQuestion();
                        } else {
                          final snackBar = SnackBar(
                            content: Text('This Question is required'),
                            duration: Duration(
                              seconds: 1,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        _nextQuestion();
                      }
                    },
                  )
                : ReusableButton(
                    child: Row(
                      children: [
                        Text(
                          'Finish',
                          style: kButtonTextStyle,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.check,
                          color: kPrimaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                    onTap: () {
                      if (_questions[currentQuestion].compulsory) {
                        if (_allowNext[currentQuestion] == true) {
                          _submitForm();
                        } else {
                          final snackBar = SnackBar(
                            content: Text('This Question is required'),
                            duration: Duration(
                              seconds: 1,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        _submitForm();
                      }
                      
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class ReusableButton extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const ReusableButton({this.onTap, this.child});

  @override
  _ReusableButtonState createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35), color: kSecondaryLight),
          padding: EdgeInsets.all(13),
          child: widget.child),
    );
  }
}
