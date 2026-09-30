import "package:emirate_insight/data/emirate_class.dart";
import "package:flutter/material.dart";

// Used to control which page (from List pages[]) is currently displayed
ValueNotifier selectedPageNotifier = ValueNotifier(0);

// Controls which Emirate is currently selected on the HomePage()
ValueNotifier<Emirate?> selectedEmirateNotifier = ValueNotifier(null);

// Controls which question is currently selected in the quiz
ValueNotifier<int?> selectedQuestionNotifier = ValueNotifier(null);

// Controls which answer of a certain question is selected in the quiz
ValueNotifier<int?> selectedAnswerNotifier = ValueNotifier(null);