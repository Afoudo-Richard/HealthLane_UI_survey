const String jsonData = ''' 
  {
  "questions": [
    {
      "_id": "60fecc0e7054c50018163d12",
      "compulsory": true,
      "englishText": "what is your name",
      "frenchText": "votre nom",
      "questionType": "multiple_choice_single_answer",
      "gender": "all",
      "options": [
        {
          "deleted": false,
          "_id": "60fecc0e7054c50018163d13",
          "optionTextEnglish": "john",
          "optionTextFrench": "john",
          "__v": 0,
          "createdAt": "2021-07-26T14:51:58.365Z",
          "updatedAt": "2021-08-04T12:27:10.221Z",
          "question": "60fecc0e7054c50018163d12"
        },
        {
          "deleted": false,
          "_id": "60fecc0e7054c50018163d14",
          "optionTextEnglish": "mary",
          "optionTextFrench": "mary",
          "__v": 0,
          "createdAt": "2021-07-26T14:51:58.366Z",
          "updatedAt": "2021-08-04T12:27:10.251Z",
          "question": "60fecc0e7054c50018163d12"
        }
      ]
    },
    {
      "_id": "6113f99d7491871509b71a6a",
      "compulsory": true,
      "englishText": "MCQ multiple answers",
      "frenchText": "test",
      "questionType": "multiple_choice_multiple_answer",
      "gender": "male",
      "options": [
        {
          "deleted": false,
          "_id": "6113f99e7491871509b71a6b",
          "optionTextEnglish": "anser 1 en",
          "optionTextFrench": "anser1 fr",
          "__v": 0,
          "createdAt": "2021-08-11T16:23:58.014Z",
          "updatedAt": "2021-08-11T16:23:58.066Z",
          "question": "6113f99d7491871509b71a6a"
        },
        {
          "deleted": false,
          "_id": "6113f99e7491871509b71a6c",
          "optionTextEnglish": "answer 2 en",
          "optionTextFrench": "answer 2 fr",
          "__v": 0,
          "createdAt": "2021-08-11T16:23:58.015Z",
          "updatedAt": "2021-08-11T16:23:58.066Z",
          "question": "6113f99d7491871509b71a6a"
        },
        {
          "deleted": false,
          "_id": "6113f99e7491871509b71a6d",
          "optionTextEnglish": "answer 3 en",
          "optionTextFrench": "answer 3 fr",
          "__v": 0,
          "createdAt": "2021-08-11T16:23:58.015Z",
          "updatedAt": "2021-08-11T16:23:58.066Z",
          "question": "6113f99d7491871509b71a6a"
        }
      ]
    },
    {
      "_id": "6113f9bd7491871509b71a6f",
      "compulsory": true,
      "englishText": "Number inpuyt question",
      "frenchText": "dfadf",
      "questionType": "number",
      "gender": "male",
      "options": []
    },
    {
      "_id": "6113f9bd7491871509b71a6f",
      "compulsory": true,
      "englishText": "Number inpuyt question",
      "frenchText": "dfadf",
      "questionType": "date_time",
      "gender": "male",
      "options": []
    },
    {
      "_id": "6113f9d27491871509b71a70",
      "compulsory": false,
      "englishText": "Text input question",
      "frenchText": "text french",
      "questionType": "text",
      "gender": "male",
      "options": []
    },
    {
      "_id": "6113f9ec7491871509b71a71",
      "compulsory": false,
      "englishText": "not compulsotry question",
      "frenchText": "",
      "questionType": "multiple_choice_single_answer",
      "gender": "male",
      "options": [
        {
          "deleted": false,
          "_id": "60fecc0e7054c50018163d13",
          "optionTextEnglish": "Richard",
          "optionTextFrench": "Richard",
          "__v": 0,
          "createdAt": "2021-07-26T14:51:58.365Z",
          "updatedAt": "2021-08-04T12:27:10.221Z",
          "question": "60fecc0e7054c50018163d12"
        },
        {
          "deleted": false,
          "_id": "60fecc0e7054c50018163d14",
          "optionTextEnglish": "Arc",
          "optionTextFrench": "Arc",
          "__v": 0,
          "createdAt": "2021-07-26T14:51:58.366Z",
          "updatedAt": "2021-08-04T12:27:10.251Z",
          "question": "60fecc0e7054c50018163d12"
        }
      ]
    },
        {
      "_id": "6113f99d7491871509b71a6a",
      "compulsory": true,
      "englishText": "Which of them are your best Language?",
      "frenchText": "test",
      "questionType": "multiple_choice_multiple_answer",
      "gender": "male",
      "options": [
        {
          "deleted": false,
          "_id": "6113f99e7491871509b71a6b",
          "optionTextEnglish": "Java",
          "optionTextFrench": "Java",
          "__v": 0,
          "createdAt": "2021-08-11T16:23:58.014Z",
          "updatedAt": "2021-08-11T16:23:58.066Z",
          "question": "6113f99d7491871509b71a6a"
        },
        {
          "deleted": false,
          "_id": "6113f99e7491871509b71a6c",
          "optionTextEnglish": "Python",
          "optionTextFrench": "Python",
          "__v": 0,
          "createdAt": "2021-08-11T16:23:58.015Z",
          "updatedAt": "2021-08-11T16:23:58.066Z",
          "question": "6113f99d7491871509b71a6a"
        },
        {
          "deleted": false,
          "_id": "6113f99e7491871509b71a6d",
          "optionTextEnglish": "C",
          "optionTextFrench": "C",
          "__v": 0,
          "createdAt": "2021-08-11T16:23:58.015Z",
          "updatedAt": "2021-08-11T16:23:58.066Z",
          "question": "6113f99d7491871509b71a6a"
        }
      ]
    }
  ]
}

''';
