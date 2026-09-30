import "package:emirate_insight/pages/quiz_page.dart";
import "package:flutter/material.dart";

import "../data/emirate_class.dart";
import "../data/info_class.dart";
import "../data/notifiers.dart";
import "home_page.dart";
import "info_page.dart";
import "../data/constants.dart";

class WidgetTree extends StatelessWidget {
  WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          /*
          * AnimatedSwitcher controls how pages transition between each other
          * This transition is a SlideTransition()
          * The new page slides over the old page from the right to the left
          * */
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
                child: child
              );
            },
            child: KeyedSubtree(
              key: ValueKey(selectedPage),
              // Pages only build when accessed
              child: Builder(
                builder: (_) {

                  // Builds HomePage if selectedPage is 0
                  if (selectedPage == 0) {
                    return HomePage();
                  }

                  if (selectedPage < 8) {

                    /*
                    * If HomePage is not selected, the page is built based on the Emirate
                    * selectedPage - 1 is used to get the correct Emirate from the list of Emirates
                    * Because index 0 is for the HomePage
                    * */
                    Emirate emirate = Constants.emirates[selectedPage - 1];

                    return InfoPage(
                        emirate: emirate,
                        info: Constants.infoPages[emirate.name]
                        ?? Information(
                              generalInfo: "No information available",
                              landmarks: "",
                              currentRuler: "",
                              knownFor: "",
                            )
                    );
                  }

                  /*
                  * We create a new emirate value to use selectedPage - 8
                  * This is because there are only 7 Emirates...
                  * ...thus preventing RangeErrors
                  * */
                  Emirate emirate = Constants.emirates[selectedPage - 8];

                  return QuizPage(
                    emirate: emirate,
                    questions: Constants.quizzes[emirate.name] ?? []
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}