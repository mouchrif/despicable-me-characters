import 'package:despicable_me_characters/constants.dart';
import 'package:flutter/material.dart';

class Character {
  final String name;
  final String description;
  final String imagePath;
  final LinearGradient color;
  final List<String> auxImagesPath;
  Character({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.auxImagesPath,
  });
}

List<Character> characters = [
  Character(
    name: "Kevin",
    description:
        "Kevin is a tall, two-eyed minion with sprout cut hair and is usually seen wearing his golf apparel.\n Kevin loves to make fun of and tease people or Minions, shown when he made fun of Jerry and teases him for being a coward.He likes playing golf polo and cricket. In the film Minions, he is the main protagonist and leader of the trio in search of a new master. He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master).",
    imagePath: "assets/images/kevin-the-minion.png",
    color: kKevinGradientColors,
    auxImagesPath: [
      "assets/images/kevin-1.jpg",
      "assets/images/kevin-2.jpg",
      "assets/images/kevin-3.jpg",
      "assets/images/kevin-4.jpg",
    ],
  ),
  Character(
    name: "Agnes",
    description:
        "Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie. Most of the time, Agnes wears blue overalls over a yellow and brown striped t-shirt, and white sneakers with yellow socks. She also wears a white ballet outfit like Edith and Margo (at the ballet recital). For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. She also wears a blue princess hat on her head.",
    imagePath: "assets/images/girl-character.png",
    color: kAnesGradientColors,
    auxImagesPath: [
      "assets/images/agnes-1.png",
      "assets/images/agnes-2.jpg",
      "assets/images/agnes-3.jpg",
      "assets/images/agnes-4.png",
    ],
  ),
];
