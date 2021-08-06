import 'package:despicable_me_characters/models/character.dart';
import 'package:flutter/material.dart';
import 'package:despicable_me_characters/constants.dart';
import 'package:despicable_me_characters/widgets/character-item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despicable Me characters',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: currentPage, viewportFraction: 1.0, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: kBlackColor,
            size: 20,
          ),
        ),
        actions: [
          Icon(
            FontAwesomeIcons.search,
            color: kBlackColor,
            size: 20,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: buildText(
                "Despicable Me",
                kBlackColor.withOpacity(0.8),
                38.0,
                FontWeight.w600,
                1.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: buildText(
                "Characters",
                kBlackColor.withOpacity(0.8),
                32.0,
                FontWeight.normal,
                1.1,
              ),
            ),
            Expanded(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: [
                    ...characters
                        .map((character) => CharacterItem(
                              character: character,
                              currentPage: currentPage,
                              controller: _pageController!,
                            ))
                        .toList(),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
