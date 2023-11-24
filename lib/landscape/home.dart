import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final List<String> animatedTextListPhaseOne = <String>["I'm A", "I'm A"];
  final List<String> animatedTextListPhaseTwo = <String>["Flutter Developer", "Python Developer"];
  late final AnimationController menuController;
  final List<bool> menu = <bool>[false, false, false];
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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 20,
              children: <Widget>[
                Container(height: MediaQuery.of(context).size.width * .4, width: MediaQuery.of(context).size.width * .3, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(scale: 3.5, fit: BoxFit.cover, image: AssetImage("assets/${Random().nextInt(3) + 1}.jpg")))),
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
              ],
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
                    animatedTexts: <AnimatedText>[for (String text in animatedTextListPhaseOne) TypewriterAnimatedText(text.tr, speed: 100.ms, curve: Curves.linear, textStyle: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Colors.white, fontSize: 44)))],
                  ),
                  AnimatedTextKit(
                    pause: const Duration(milliseconds: 800),
                    repeatForever: true,
                    animatedTexts: <AnimatedText>[for (String text in animatedTextListPhaseTwo) TyperAnimatedText(text.tr, speed: 100.ms, curve: Curves.linear, textStyle: GoogleFonts.robotoSerif(textStyle: const TextStyle(color: Color.fromARGB(255, 17, 255, 160), fontSize: 44)))],
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
        ),
      ),
    );
  }
}
