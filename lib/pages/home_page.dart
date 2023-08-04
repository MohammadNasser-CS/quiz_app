import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int qAIndex = 0;
  bool showResult = false;
  int choosenIndex = -1;
  int yourScore = 0;
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
      'answers': ['Green', 'Red', 'Blue', 'Orange'],
    },
  ];

  List<String> correctAnswers = ['Football', 'Cat', 'Red'];
  bool incScore = false;
  void resetQuiz() {
    setState(() {
      showResult = false;
      qAIndex = 0;
      yourScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final qARecord = qA[qAIndex];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: showResult == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...[
                      SizedBox(height: size.height * 0.1),
                      Text(
                        qARecord['question'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Answer and get points !',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      SizedBox(height: size.height * 0.1),
                      Row(
                        children: [
                          Text(
                            'Question ${qAIndex + 1}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'of ${qA.length}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black26),
                          )
                        ],
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade300,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                        value: (qAIndex + 1) / qA.length,
                      ),
                      SizedBox(height: size.height * 0.03),
                      for (int i = 0; i < qARecord['answers'].length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                choosenIndex = i;
                                if (correctAnswers[qAIndex] ==
                                    qARecord['answers'][i]) {
                                  incScore = true;
                                } else {
                                  incScore = false;
                                }
                              });
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: (choosenIndex != i)
                                      ? Colors.white
                                      : Colors.green.shade600,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/icons/${qARecord['answers'][i]}.png'),
                                      width: 30,
                                      height: 30,
                                      color: null,
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.center,
                                    ),

                                    // Icon(
                                    //   Icons.add,
                                    //   color: (choosenIndex == i)
                                    //       ? Colors.white
                                    //       : Colors.black,
                                    // ),
                                    const SizedBox(width: 15),
                                    Text(
                                      qARecord['answers'][i],
                                      style: TextStyle(
                                        color: (choosenIndex == i)
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (choosenIndex != -1) {
                                if (incScore == true) {
                                  yourScore++;
                                  incScore = false;
                                }
                                if (qAIndex < qA.length - 1) {
                                  qAIndex++;
                                } else {
                                  showResult = true;
                                }
                                choosenIndex = -1;
                              } else {
                                const snackBar = SnackBar(
                                  content: Text(
                                      'Pleas Choose Answer Before Continue !'),
                                  duration: Duration(seconds: 1),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo.shade500,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text('Next'),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        yourScore > (qA.length / 2) ? 'Nice !' : 'Faild',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Score is --> $yourScore/${qA.length}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: resetQuiz,
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            textStyle: const TextStyle(
                              fontSize: 18,
                            )),
                        child: const Text('Reset!'),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
