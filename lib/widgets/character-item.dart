import 'package:despicable_me_characters/models/character.dart';
import 'package:despicable_me_characters/widgets/character-details.dart';
import 'package:flutter/material.dart';
import 'package:despicable_me_characters/widgets/custom_clipper_path.dart';

import '../constants.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  final int currentPage;
  final PageController controller;
  const CharacterItem(
      {Key? key,
      required this.character,
      required this.currentPage,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 350),
              pageBuilder: (context, animation, secAnimation) =>
                  CharacterDetailsScreen(character: character),
            ));
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1;
          if (controller.position.hasContentDimensions) {
            double val = controller.page! - currentPage;
            value = (1 - (val.abs() * 0.5)).clamp(0.0, 1.0);
          }
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: CustomClipperPath(),
                  child: Hero(
                    tag: "background-${character.name}",
                    child: Container(
                      width: size.width * 0.92,
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                        gradient: character.color,
                      ),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: "hero-${character.name}",
                child: Align(
                  alignment: Alignment(0, -1),
                  child: Image(
                    image: AssetImage(character.imagePath),
                    height: size.height * 0.55 * value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, bottom: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: "heading-${character.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: buildText(
                          character.name,
                          kWhiteColor.withOpacity(0.8),
                          34.0,
                          FontWeight.w900,
                          1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Material(
                      color: Colors.transparent,
                      child: buildText(
                        "Click to read more",
                        kWhiteColor.withOpacity(0.8),
                        24.0,
                        FontWeight.w500,
                        0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
