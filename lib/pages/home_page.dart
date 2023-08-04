import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int qAIndex = 0;
  bool showResult = false;
  List<Map<String, dynamic>> qA = [
    {
      'question': 'What is Your Favirate Sport ?',
      'answers': ['Football', 'Volleyball', 'Basketball', 'Tennis'],
    },
    {
      'question': 'What is Your Favirate Animal ?',
      'answers': ['Lion', 'Wolf', 'Cat', 'Dog'],
    },
    {
      'question': 'What is Your Favirate Color ?',
      'answers': ['Green', 'Red', 'Blue', 'White'],
    },
  ];
  void resetQuiz() {
    setState(() {
      showResult = false;
      qAIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final qARecord = qA[qAIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'It is AppBar Here',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showResult == false) ...[
                  Text(
                    qARecord['question'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                  for (int i = 0; i < qARecord['answers'].length; i++)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (qAIndex < qA.length - 1) {
                                qAIndex++;
                              } else {
                                showResult = true;
                              }
                            });
                          },
                          child: Text(qARecord['answers'][i])),
                    ),
                ],
                if (showResult == true) ...[
                  Text(
                    'Nice !',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Score is --> ${qAIndex}/${qA.length}',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: resetQuiz,
                    child: const Text('Reset!'),
                  )
                ]
              ]),
        ),
      ),
    );
  }
}
