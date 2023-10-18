
import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';


class py_quiz extends StatefulWidget {


  @override
  State<py_quiz> createState() => _py_quizState();
}

class _py_quizState extends State<py_quiz> {
  List _scoreTracker = [
    // Icon(
    //   Icons.check_circle,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.clear,
    //   color: Colors.red,
    // ),
  ];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
 bool EndofQuiz = false;
 bool correctAnswerSelected= false;
 




 void questionAnswered(bool answerScore) {
  setState(() {
    // Answer was selected
    answerWasSelected = true;
    // Checking if answer is correct. 
    if(answerScore) { // if answerScore is true then it'll increase the Totalscore.
      _totalScore+= 1;
      correctAnswerSelected= true;
    }

  // Adding To Score Tracker on Top

  _scoreTracker.add(
    answerScore? Icon(  // if  if answerScore is true then it'll show green check circle.
      Icons.check_circle,
      color: Colors.green,
    ) : 
    Icon(
      Icons.clear,  // else it will show red clear circle.
      color: Colors.red,
    )
  );

  // Checking if the quiz ends 

if(_questionIndex+1 == _questions.length) // question index + 1 bcs index starts from 0 and since we have 9 questions so 8+1 == 9 then quiz ends.
      EndofQuiz = true;
  });
 }

 void _nextQuestion() {
  setState(() {
    _questionIndex++; // increase the index
    answerWasSelected = false; // Reset All the questions back to not selected form
    correctAnswerSelected= false;
  });
  // What happens in the end of quiz
  if(_questionIndex>= _questions.length) {
    _resetQuiz();
  }
 }

  void _resetQuiz() {
    setState(() {
      _questionIndex =0;
      _totalScore =0;
      _scoreTracker= [];
      EndofQuiz = false;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Python Quiz"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      ),
      
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
               if(_scoreTracker.length == 0)
               SizedBox(
                height: 25.0,
               ),
              if(_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Text(
               _questions[_questionIndex]['question'],
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
              )),
            ),
          ...(_questions[_questionIndex]['answers']as List<Map<String, Object>>).map((answer) => Answer(
            answerText: answer['answerText'],
          answerColor: answerWasSelected? answer['score']==true? Colors.green: Colors.red : Colors.white,
          AnsColor: answerWasSelected? Colors.white: Colors.black,
          answerTap: () {
            // if answer was already selected then nothing happens onTap Again.
            if(answerWasSelected) {
              return;
            }
            questionAnswered(answer['score']==true);
          },
          )),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(-1, 0, 10, 0),
                  minimumSize: Size(double.infinity, 40.0)),
              onPressed: () {
                // Making Next Question Button Not to Work if answer was not selected so that user cannot bypass the answer
                if(!answerWasSelected) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select an Answer before moving to next question"))
              );
                  return;
                }
                _nextQuestion();
              },
              child: Text(EndofQuiz? "Restart Quiz":  "Next Question"),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "${_totalScore.toString()} / ${_questions.length}",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            if(answerWasSelected && !EndofQuiz)
            Container(
              height: 100,
              width: double.infinity,
              color: correctAnswerSelected? Colors.green: Colors.red,
              child: Center(
                child: Text(
                correctAnswerSelected? "Well Done!, You Got It...": "Wrong Answer, Try Again...",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )
              ),
            ),
            if(EndofQuiz) 
            Container(
              color: Colors.green,
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  _totalScore>4
                  ? "Congrats! Your Final Score Is: $_totalScore ":
                  "Your Final Score Is: $_totalScore. Better Luck Next Time...!"
                  , style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold, 
                  color: _totalScore>4? Colors.green: Colors.red,
                ), 
                textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      
    );

  }
}


final List<dynamic> _questions = const [
  {
    'question': 'Why Dictionaries Preffered More In Python?',
    'answers': [
      {'answerText': 'Dictionaries are faster than a list', 'score': true},
      {'answerText': 'Dictionaries are mutable ', 'score': false},
      {'answerText': 'Dictionaries can store more data in comparision to list.', 'score': false},
      {'answerText': 'None of Above', 'score': false},
    ],
  },
  {
    'question':
        'How do you achieve multithreading in Python?',
    'answers': [
      {'answerText': 'Through Multi-Threading (MT) Package', 'score': false},
      {'answerText': 'By applying OOP Concept', 'score': false},
      {'answerText': 'Global Interpreter Lock (GIL) Construct.', 'score': true},
      {'answerText': 'None of These', 'score': false},
    ],
  },
  {
    'question': 'Python was developed in which year?',
    'answers': [
      {'answerText': '1995', 'score': false},
      {'answerText': '1992', 'score': false},
      {'answerText': '1996', 'score': false},
       {'answerText': '1991', 'score': true},
    ],
  },
  {
    'question': 'In which year Python 3.0 is developed?',
    'answers': [
      {'answerText': '2001', 'score': false},
      {'answerText': '2005', 'score': false},
      {'answerText': '2008', 'score': true},
      {'answerText': '2002', 'score': false},
    ],
  },
  {
    'question':
        'What is monkey patching in python?',
    'answers': [
      {'answerText': 'Monkey patch is a function of python.', 'score': false},
      {'answerText': 'There is No "Monkey Patching" in python.', 'score': false},
      {'answerText': 'To patch the written code.', 'score': false},
       {'answerText': ' dynamic modifications of a class or module at run-time.', 'score': true},
    ],
  },
  {
    'question': 'Lambda Function returned objects are useful in ? ',
    'answers': [
      {'answerText': 'Functions', 'score': true},
      {'answerText': 'Data Types', 'score': false},
      {'answerText': 'Variables', 'score': false},
      {'answerText': 'None of above', 'score': false},

    ],
  },
  {
    'question': 'What is output of following code: x=123\n for i in x:\n print(i) ',
    'answers': [
      {'answerText': '1 2 3', 'score': false},
      {'answerText': '123', 'score': false},
      {'answerText': 'error', 'score': true},
       {'answerText': 'none of mentioned', 'score': false},

    ],
  },
  {
    'question': 'What is output of following code: \n for i in range(0):\n     print(i)',
    'answers': [
      {'answerText': '0', 'score': false},
      {'answerText': 'error', 'score': false},
      {'answerText': 'no output', 'score': true},
      {'answerText': '1', 'score': false},

    ],
  },
  {
    'question': 'Python Programming Language is Written in Which Language',
    'answers': [
      {'answerText': 'C', 'score': true},
      {'answerText': 'C++', 'score': false},
      {'answerText': 'C/C++', 'score': false},
      {'answerText': 'Java', 'score': false},
    ],
  },
];
