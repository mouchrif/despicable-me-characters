import 'package:despicable_me_characters/constants.dart';
import 'package:despicable_me_characters/models/character.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  _CharacterDetailsScreenState createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationHeight;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void didChangeDependencies() async {
    final Size size = MediaQuery.of(context).size;
    _animationHeight =
        Tween<double>(begin: 60, end: 250).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOutCubic,
    ));
    if (_controller!.isDismissed) {
      await Future.delayed(Duration(milliseconds: 400));
      _controller!.forward();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _toggler() {
    if (_controller!.isDismissed) {
      _controller!.forward();
    } else if (_controller!.isCompleted) {
      _controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: widget.character.color,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if(_controller!.isDismissed){
                        Navigator.of(context).pop();
                      }else{
                        _toggler();
                        await Future.delayed(Duration(milliseconds: 500));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Icon(
                      FontAwesomeIcons.times,
                      color: kWhiteColor.withOpacity(0.8),
                      size: 28.0,
                    ),
                  ),
                  Hero(
                    tag: "hero-${widget.character.name}",
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        image: AssetImage(widget.character.imagePath),
                        height: size.height * 0.42,
                      ),
                    ),
                  ),
                  Hero(
                      tag: "heading-${widget.character.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: buildText(
                            widget.character.name,
                            kWhiteColor.withOpacity(0.8),
                            34,
                            FontWeight.w900,
                            1.2),
                      )),
                  SizedBox(height: 10),
                  buildText(
                    widget.character.description,
                    kWhiteColor.withOpacity(0.8),
                    16,
                    FontWeight.normal,
                    0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {
                print("tap");
                _toggler();
              },
              onVerticalDragStart: (details) {
                print(details.globalPosition);
              },
              child: AnimatedBuilder(
                animation: _animationHeight!,
                builder: (context, child) => Container(
                  height: _animationHeight!.value,
                  decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(0.95),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(29),
                      topRight: Radius.circular(29),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText("${widget.character.auxImagesPath.length} Photos", 
                          Colors.black, 16.0,
                          FontWeight.normal, 
                          0
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30,
                            children: [
                              ...widget.character.auxImagesPath
                                  .map(
                                    (auxImage) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image(
                                          image: AssetImage(auxImage),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  )
                                .toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
