import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int actifIndex = 0;
  final List<String> animatedTextListPhaseOne = <String>["I'm A", "I'm A"];
  final List<String> animatedTextListPhaseTwo = <String>["Flutter Developer", "Python Developer"];
  late final AnimationController menuController;
  List<bool> menu = <bool>[false, false, false];
  @override
  void dispose() {
    menuController.dispose();
    animatedTextListPhaseOne.clear();
    animatedTextListPhaseTwo.clear();
    super.dispose();
  }

  @override
  void initState() {
    menuController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Padding(padding: const EdgeInsets.all(16), child: Container(width: MediaQuery.of(context).size.width, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/${index + 1}.${(index + 1) == 4 ? 'jpeg' : 'jpg'}")))));
          },
          options: CarouselOptions(
            viewportFraction: .4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (int index, CarouselPageChangedReason reason) => setState(() => actifIndex = index % 4),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedSmoothIndicator(
          activeIndex: actifIndex,
          curve: Curves.fastOutSlowIn,
          count: 4,
          effect: CustomizableEffect(
            dotDecoration: DotDecoration(borderRadius: BorderRadius.circular(75), color: Colors.white),
            activeDotDecoration: DotDecoration(
              height: 10,
              width: 10,
              rotationAngle: 90,
              verticalOffset: 8,
              borderRadius: BorderRadius.circular(75),
              color: const Color.fromARGB(255, 17, 255, 160),
            ),
          ),
        ),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "Hi, I'm\n".tr, style: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Colors.white, fontSize: 16))),
              TextSpan(text: "Hafedh Gunichi", style: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Color.fromARGB(255, 17, 255, 160), fontSize: 16, fontWeight: FontWeight.bold))),
              TextSpan(text: ", \n", style: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Colors.white, fontSize: 16))),
              TextSpan(text: "A Developer\nBased in Tunisia.".tr, style: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Colors.white, fontSize: 16))),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 1,
            children: <Widget>[
              AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 1100),
                animatedTexts: <AnimatedText>[for (String text in animatedTextListPhaseOne) TypewriterAnimatedText(text.tr, speed: const Duration(milliseconds: 100), curve: Curves.linear, textStyle: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Colors.white, fontSize: 20)))],
              ),
              AnimatedTextKit(
                pause: const Duration(milliseconds: 800),
                repeatForever: true,
                animatedTexts: <AnimatedText>[for (String text in animatedTextListPhaseTwo) TyperAnimatedText(text.tr, speed: const Duration(milliseconds: 100), curve: Curves.linear, textStyle: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Color.fromARGB(255, 17, 255, 160), fontSize: 20)))],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(tooltip: "Github", splashColor: Colors.transparent, focusColor: Colors.transparent, highlightColor: Colors.transparent, onPressed: () async => await launchUrlString("https://github.com/hafedh049"), icon: const Icon(FontAwesomeIcons.github, size: 25, color: Colors.white)),
            const SizedBox(width: 10),
            IconButton(tooltip: "LinkedIn", splashColor: Colors.transparent, focusColor: Colors.transparent, highlightColor: Colors.transparent, onPressed: () async => await launchUrlString("https://www.linkedin.com/in/hafedh-gunichi-a18a60222/"), icon: const Icon(FontAwesomeIcons.linkedin, size: 25, color: Colors.grey)),
            const SizedBox(width: 10),
            IconButton(tooltip: "Facebook", splashColor: Colors.transparent, focusColor: Colors.transparent, highlightColor: Colors.transparent, onPressed: () async => await launchUrlString("https://www.facebook.com/sagittarius.aurora.25.12.2020"), icon: const Icon(FontAwesomeIcons.facebook, size: 25, color: Colors.blue)),
            const SizedBox(width: 10),
            IconButton(tooltip: "LeetCode", splashColor: Colors.transparent, focusColor: Colors.transparent, highlightColor: Colors.transparent, onPressed: () async => await launchUrlString("https://leetcode.com/hafedhgunichi/"), icon: Image.asset("assets/leetcode.png")),
            const SizedBox(width: 10),
            IconButton(tooltip: "HackerRank", splashColor: Colors.transparent, focusColor: Colors.transparent, highlightColor: Colors.transparent, onPressed: () async => await launchUrlString("https://www.hackerrank.com/hafedh_gunichi?hr_r=1"), icon: Image.asset("assets/hackerrank.png")),
          ],
        ),
      ],
    );
  }
}
