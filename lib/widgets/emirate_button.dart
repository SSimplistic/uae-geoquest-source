import "package:flutter/material.dart";

import "../data/constants.dart";
import "../data/emirate_class.dart";
import "../data/notifiers.dart";
import 'package:flutter_svg/flutter_svg.dart';

class EmirateButton extends StatelessWidget {
  const EmirateButton({
    super.key,
    required this.emirate,
    required this.selectedEmirate,
    required this.height,
    required this.topOffset,
    required this.leftOffset,
    required this.angle,
    this.color,
  });

  final Emirate emirate;
  final Emirate? selectedEmirate;
  final double height;
  final double topOffset;
  final double leftOffset;
  final double angle;

  final Color? color;

  @override
  Widget build(BuildContext context) {

    
    return Positioned(
      top: topOffset,
      left: leftOffset,
      child: SizedBox(
        height: height,
        child: Transform.rotate(
          angle: angle,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (selectedEmirateNotifier.value == emirate) {
                selectedEmirateNotifier.value = null;
              }

              else {
                selectedEmirateNotifier.value = emirate;
              }
            },
            child: AnimatedScale(
              scale: selectedEmirate == emirate ? 1.1 : 1,
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                opacity: selectedEmirate == null || selectedEmirate == emirate ? 1 : 0.4,
                duration: const Duration(milliseconds: 200),
                child: SvgPicture.asset(
                  emirate.svgPath,
                  height: height,
                  colorFilter: ColorFilter.mode(
                    color == null ? Constants.secondaryColor : color!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}