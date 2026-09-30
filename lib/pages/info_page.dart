import "package:emirate_insight/data/emirate_class.dart";
import "package:emirate_insight/data/notifiers.dart";
import "package:flutter/material.dart";
import "../data/constants.dart";
import 'package:google_fonts/google_fonts.dart';
import "../data/info_class.dart";



class InfoPage extends StatefulWidget {
  const InfoPage({
    super.key,
    required this.emirate,
    required this.info,
  });

  final Emirate emirate;
  final Information? info;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
    // Scaffold holds the whole page together, including the AppBar and the body
    return Scaffold(
      // AppBar with a BackButton to return to the HomePage
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
          color: Constants.secondaryColor,
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              selectedPageNotifier.value = 0;
              selectedEmirateNotifier.value = null;
            });
          },
        )

      ),

      // Keeping some distance from the edges of the screen
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20),

          // Arranging the content of the page in a vertical Column()
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  // Card containing the image and text
                  Container(
                    width: double.infinity,
                    height: 900,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  // Image and text inside the card
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Image of the Emirate
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                              Constants.images[widget.emirate.name]!,
                            width: double.infinity,
                            height: 210,
                          ),
                        ),

                        // Gap
                        SizedBox(height: 20),

                        // Name of the Emirate
                        Text(
                            widget.emirate.name,
                            style: GoogleFonts.poppins(
                                color: Constants.mainColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            )
                        ),

                        SizedBox(height: 10),

                        // General Info (title)
                        Text(
                          "General Info",
                          style: GoogleFonts.poppins(
                            color: Constants.mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        // Gap
                        SizedBox(height: 10),

                        // General Info (content)
                        Text(
                          /*
                          * Essentially, info can be null if an Emirate isn't selected
                          * That's why we have ?? "No information available."
                          * Prevents crashes if info is null (somehow)
                          * */
                          widget.info?.generalInfo ?? "No information available.",

                          style: GoogleFonts.poppins(
                              color: Constants.mainColor,
                              fontSize: 13,
                              fontWeight: FontWeight.normal
                          ),
                        ),

                        SizedBox(height: 20),

                        // Landmarks (title)
                        Text(
                          "Landmarks",

                          style: GoogleFonts.poppins(
                              color: Constants.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        // Gap
                        SizedBox(height: 10),

                        // Landmarks (content)
                        Text(
                          widget.info?.landmarks ?? "No information available.",

                          style: GoogleFonts.poppins(
                              color: Constants.mainColor,
                              fontSize: 13,
                              fontWeight: FontWeight.normal
                          ),
                        ),

                        // Gap
                        SizedBox(height: 20),

                        // Current Ruler (title)
                        Text(
                          "Current Ruler",

                          style: GoogleFonts.poppins(
                              color: Constants.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        // Gap
                        SizedBox(height: 10),

                        // Current Ruler (content)
                        Text(
                          widget.info?.currentRuler ?? "No information available.",
                          style: GoogleFonts.poppins(
                              color: Constants.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal
                          ),
                        ),

                        // Gap
                        SizedBox(height: 20),

                        // Known For
                        RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Known For: ",
                                  style: GoogleFonts.poppins(
                                      color: Constants.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                                TextSpan(
                                  text: widget.info?.knownFor ?? "No information available.",
                                  style: GoogleFonts.poppins(
                                      color: Constants.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ]
                            )
                        ),

                        // Gap
                        SizedBox(height: 10),

                        // Quiz Button
                        FilledButton(
                          onPressed: () {
                            selectedPageNotifier.value = widget.emirate.pageIndex + 7;
                          },

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
                              "Test me!"
                          ),
                        )

                      ],
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}