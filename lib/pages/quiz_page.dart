import "package:emirate_insight/data/notifiers.dart";
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';


import "../data/constants.dart";
import "../data/emirate_class.dart";
import "../data/question_class.dart";

class QuizPage extends StatefulWidget {

  //
  const QuizPage({
    super.key,
    required this.emirate,
    required this.questions,
  });

  final Emirate emirate;
  final List<Question> questions;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{

  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _nextQuestion() {

    // Non-final question behavior
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {

        if (selectedAnswerNotifier.value ==
            widget.questions[currentQuestionIndex].correctAnswerIndex) {
          correctAnswers++;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Correct!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Constants.secondaryColor,
                ),
              ),
              backgroundColor: Constants.correctAnsColor,
              duration: Duration(seconds: 2),
            )
          );
        }

        else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Wrong answer",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Constants.secondaryColor,
                  ),
                ),
                backgroundColor: Constants.wrongAnsColor,
                duration: Duration(seconds: 2),
              )
          );
        }

        currentQuestionIndex++;

        selectedAnswerNotifier.value = null;

      });
    }

    // Last question behavior
    else {

      if (selectedAnswerNotifier.value ==
          widget.questions[currentQuestionIndex].correctAnswerIndex) {
        correctAnswers++;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Correct!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Constants.secondaryColor,
                ),
              ),
              backgroundColor: Constants.correctAnsColor,
              duration: Duration(seconds: 2),
            )
        );
      }

      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Wrong answer",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Constants.secondaryColor,
                ),
              ),
              backgroundColor: Constants.wrongAnsColor,
              duration: Duration(seconds: 2),
            )
        );
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Constants.mainColor,
            ),
            contentTextStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: Constants.mainColor,
            ),
            backgroundColor: Constants.secondaryColor,
            title: Center(
              child: Text(
                  "Score: $correctAnswers / 5"
              ),
            ),
            content: correctAnswers == 5
                ? Text("You got a perfect score!")
                : Text("Better luck next time!"),
            actions: [
              FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Constants.mainColor,
                    foregroundColor: Constants.secondaryColor,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                    minimumSize: Size(double.infinity, 40)
                ),
                onPressed: () {
                  Navigator.of(context).pop();

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    selectedPageNotifier.value = 0;
                    selectedEmirateNotifier.value = null;
                    selectedAnswerNotifier.value = null;
                  });
                },
                child: Text("Return to Home Page"),
              )
            ],
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedQuestionNotifier.value = currentQuestionIndex;
    selectedAnswerNotifier.value = null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "\t${widget.emirate.name} Quiz",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Constants.secondaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  selectedPageNotifier.value = 0;
                  selectedEmirateNotifier.value = null;
                });
              },
              icon: Icon(Icons.home, color: Constants.secondaryColor),
            ),
          ),
        ],

      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: selectedQuestionNotifier,
            builder: (context, selectedQuestion, child) {
              return AnimatedSwitcher(
                key: ValueKey(currentQuestionIndex),
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 700,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "${selectedQuestion! + 1} / 5",
                                style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor,
                                ),
                              ),

                              SizedBox(height: 50),

                              Text(
                                widget.questions[selectedQuestion].question,
                                style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: true
                              ),

                              SizedBox(height: 50),


                              ValueListenableBuilder<int?>(
                                valueListenable: selectedAnswerNotifier,
                                builder: (context, selectedAnswer, child) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (selectedAnswerNotifier.value == 0) {
                                              selectedAnswerNotifier.value = null;
                                            } else {
                                              selectedAnswerNotifier.value = 0;
                                            }
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: selectedAnswer == 0
                                                  ? Constants.mainColor
                                                  : Colors.transparent,
                                              border: Border.all(
                                                color: Constants.mainColor,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.questions[selectedQuestion].options[0],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: selectedAnswer == 0
                                                      ? Constants.secondaryColor
                                                      : Constants.mainColor,
                                                ),
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 15),

                                        GestureDetector(
                                          onTap: () {
                                            if (selectedAnswerNotifier.value == 1) {
                                              selectedAnswerNotifier.value = null;
                                            } else {
                                              selectedAnswerNotifier.value = 1;
                                            }
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: selectedAnswer == 1
                                                  ? Constants.mainColor
                                                  : Colors.transparent,
                                              border: Border.all(
                                                color: Constants.mainColor,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.questions[selectedQuestion].options[1],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: selectedAnswer == 1
                                                      ? Constants.secondaryColor
                                                      : Constants.mainColor,
                                                ),
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: 15),

                              ValueListenableBuilder<int?>(
                                valueListenable: selectedAnswerNotifier,
                                builder: (context, selectedAnswer, child) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (selectedAnswerNotifier.value == 2) {
                                              selectedAnswerNotifier.value = null;
                                            } else {
                                              selectedAnswerNotifier.value = 2;
                                            }
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: selectedAnswer == 2
                                                  ? Constants.mainColor
                                                  : Colors.transparent,
                                              border: Border.all(
                                                color: Constants.mainColor,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.questions[selectedQuestion].options[2],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: selectedAnswer == 2
                                                      ? Constants.secondaryColor
                                                      : Constants.mainColor,
                                                ),
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 15),

                                        GestureDetector(
                                          onTap: () {
                                            if (selectedAnswerNotifier.value == 3) {
                                              selectedAnswerNotifier.value = null;
                                            } else {
                                              selectedAnswerNotifier.value = 3;
                                            }
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: selectedAnswer == 3
                                                  ? Constants.mainColor
                                                  : Colors.transparent,
                                              border: Border.all(
                                                color: Constants.mainColor,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.questions[selectedQuestion].options[3],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: selectedAnswer == 3
                                                      ? Constants.secondaryColor
                                                      : Constants.mainColor,
                                                ),
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),


                              SizedBox(height: 20),

                              // Next question button
                              ValueListenableBuilder(
                                valueListenable: selectedAnswerNotifier,
                                builder: (context, selected, child) {
                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    transitionBuilder: (child, animation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: SlideTransition(
                                            position: Tween<Offset>(
                                              begin: const Offset(0, 0.1),
                                              end: Offset.zero,
                                            ).animate(animation),
                                            child: child
                                        ),
                                      );
                                    },
                                    child: selected == null
                                        ? const SizedBox(key: ValueKey("empty"))
                                        : FilledButton(
                                        onPressed: () {
                                          _nextQuestion();
                                        },

                                        key: ValueKey(currentQuestionIndex),

                                        style: FilledButton.styleFrom(
                                            elevation: 3,
                                            backgroundColor: Constants.mainColor,
                                            foregroundColor: Constants.secondaryColor,
                                            textStyle: GoogleFonts.poppins(
                                              fontSize: 16,
                                            ),
                                            minimumSize: Size(double.infinity, 40)
                                        ),

                                        child: Text(
                                          currentQuestionIndex == widget.questions.length - 1
                                              ? "Submit"
                                              : "Next"
                                        ),
                                      ),
                                  );
                                }
                              )

                            ],
                          )
                        )
                      ],
                    )
                  ]
                ),
              );
            }
          )
        ),
      ),
     );
   }
 }
