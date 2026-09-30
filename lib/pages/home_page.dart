import 'package:emirate_insight/data/notifiers.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "../data/constants.dart";
import '../data/emirate_class.dart';
import '../widgets/emirate_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Constants.secondaryColor,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        /*
         * Space (in pixels) between top of screen and content
         * Everything is some distance away from the top of the screen
         * This is because the only things on the HomePage() are:
         * The Welcome message, Emirate SVGs, and the Learn More button
         */
        child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
          ),
          child: Column( // Arranges all widgets in HomePage() in a vertical Column()
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: selectedEmirateNotifier,
                builder: (context, selected, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 160,
                      child: Text(
                        selected == null
                            ? "Select an Emirate to get started."
                            : selected.name,
                        style: GoogleFonts.poppins(
                          fontSize: selected == null ? 30 : 50,
                          fontWeight: FontWeight.bold,
                          color: Constants.secondaryColor,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,

                      ),
                    ),
                  );
                }
              ),

              Transform.scale(
                scale: 1.1,
                child: SizedBox(
                  width: 350,
                  height: 370,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [

                      // Abu Dhabi button
                      ValueListenableBuilder(
                        valueListenable: selectedEmirateNotifier,
                        builder: (context, selected, _) {
                          return EmirateButton(
                            emirate: Constants.emirates[0],
                            selectedEmirate: selected,
                            height: 200,
                            topOffset: 100,
                            leftOffset: 0,
                            angle: 0,
                          );
                        }
                      ),

                      // Dubai button
                      ValueListenableBuilder(
                        valueListenable: selectedEmirateNotifier,
                        builder: (context, selected, _) {
                          return EmirateButton(
                            emirate: Constants.emirates[1],
                            selectedEmirate: selected,
                            height: 60,
                            topOffset: 84,
                            leftOffset: 227.7,
                            angle: 25.13,
                          );
                        }
                      ),

                      // Sharjah button
                      ValueListenableBuilder(
                        valueListenable: selectedEmirateNotifier,
                        builder: (context, selected, _) {
                          return EmirateButton(
                            emirate: Constants.emirates[2],
                            selectedEmirate: selected,
                            height: 72.5,
                            topOffset: 67,
                            leftOffset: 246,
                            angle: 25.13,
                          );
                        }
                      ),

                      // Ras Al Khaimah button
                      ValueListenableBuilder(
                          valueListenable: selectedEmirateNotifier,
                          builder: (context, selected, _) {
                            return EmirateButton(
                              emirate: Constants.emirates[6],
                              selectedEmirate: selected,
                              height: 85,
                              topOffset: 35,
                              leftOffset: 279,
                              angle: 25.14,
                            );
                          }
                      ),

                      // Fujairah button
                      ValueListenableBuilder(
                          valueListenable: selectedEmirateNotifier,
                          builder: (context, selected, _) {
                            return EmirateButton(
                              emirate: Constants.emirates[3],
                              selectedEmirate: selected,
                              height: 48,
                              topOffset: 63.5,
                              leftOffset: 294.5,
                              angle: 25.13,
                              color: Constants.secondaryColor,
                            );
                          }
                      ),

                      // Umm Al Quwain button
                      ValueListenableBuilder(
                        valueListenable: selectedEmirateNotifier,
                        builder: (context, selected, _) {
                          return EmirateButton(
                            emirate: Constants.emirates[5],
                            selectedEmirate: selected,
                            height: 37.5,
                            topOffset: 58,
                            leftOffset: 256.5,
                            angle: 25.11,
                          );
                        }
                      ),

                      // Ajman button
                      ValueListenableBuilder(
                          valueListenable: selectedEmirateNotifier,
                          builder: (context, selected, _) {
                            return EmirateButton(
                              emirate: Constants.emirates[4],
                              selectedEmirate: selected,
                              height: 21,
                              topOffset: 72,
                              leftOffset: 254,
                              angle: 25.15,
                            );
                          }
                      ),

                    ]
                  ),
                ),
              ),

              ValueListenableBuilder<Emirate?>(
                valueListenable: selectedEmirateNotifier,
                builder: (context, selected, _) {
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
                        : Transform.scale(
                    scale: 1.1,
                    child: FilledButton(
                    key: const ValueKey("learn_more"),
                    onPressed: () {
                      selectedPageNotifier.value = selected.pageIndex;
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Constants.secondaryColor,
                      foregroundColor: Constants.mainColor,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 16,
                      )
                    ),
                    child: Text("Learn More")
                    ),
                  ),
                );
              },
              )
            ],
          ),
        ),
      )
    );
  }

}