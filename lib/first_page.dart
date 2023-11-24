// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/landscape/home.dart' as home_l;
import 'package:portfolio/portrait/home.dart' as home_p;
import 'package:portfolio/resume.dart';

class Navior extends StatefulWidget {
  const Navior({super.key});

  @override
  State<Navior> createState() => _NaviorState();
}

class _NaviorState extends State<Navior> with TickerProviderStateMixin {
  late final AnimationController _menuController;
  final List<bool> _menu = <bool>[false, false, false];
  final List<Widget> _screensMinimized = const <Widget>[home_p.Home(), Resume(), Contact()];
  final List<Widget> _screensMaximized = const <Widget>[home_l.Home(), Resume(), Contact()];
  final PageController _pageController = PageController();
  bool _en = true;
  @override
  void dispose() {
    _menuController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _menuController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          if (boxConstraints.maxWidth <= 950) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: <Widget>[
                  PageView(controller: _pageController, physics: const NeverScrollableScrollPhysics(), children: _screensMinimized),
                  Padding(
                    padding: const EdgeInsets.all(64),
                    child: Row(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Hafedh", style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.blueGrey, fontSize: 18))),
                            const Text(" "),
                            Text("Gunichi", style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.white70, fontSize: 18))),
                          ],
                        ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true, period: const Duration(seconds: 2))).shimmer(colors: <Color>[Colors.white, Colors.grey]),
                        const SizedBox(width: 20),
                        StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setS) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setS(() => _en = true);
                                  Get.updateLocale(const Locale("en", "US"));
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  width: 40,
                                  height: 30,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(color: _en ? const Color.fromARGB(255, 17, 255, 160) : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("EN", style: GoogleFonts.actor(textStyle: TextStyle(color: _en ? Colors.black : Colors.white70, fontSize: 18)))),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setS(() => _en = false);
                                  Get.updateLocale(const Locale("fr", "FR"));
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  width: 40,
                                  height: 30,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(color: !_en ? const Color.fromARGB(255, 17, 255, 160) : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("FR", style: GoogleFonts.actor(textStyle: TextStyle(color: !_en ? Colors.black : Colors.white70, fontSize: 18)))),
                                ),
                              ),
                            ],
                          );
                        }),
                        const Spacer(),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_menuController.status.index == 0) {
                              _menuController.forward();
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      backgroundColor: const Color.fromARGB(255, 17, 255, 160).withOpacity(.1),
                                      content: SizedBox(
                                        width: MediaQuery.of(context).size.width * .6,
                                        height: MediaQuery.of(context).size.height * .8,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () {
                                                html.window.history.pushState(null, '', '/home');
                                                Navigator.pop(context);
                                                _pageController.animateToPage(0, duration: 700.ms, curve: Curves.linear);
                                              },
                                              child: Column(children: <Widget>[Text("Home".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade100, fontSize: 20))), Container(height: 2, width: "Home".length * 15, color: Colors.green)]),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () {
                                                html.window.history.pushState(null, '', '/resume');
                                                Navigator.pop(context);
                                                _pageController.animateToPage(1, duration: 700.ms, curve: Curves.linear);
                                              },
                                              child: Column(children: <Widget>[Text("Resume".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade100, fontSize: 20))), Container(height: 2, width: "Resume".length * 12, color: Colors.green)]),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () {
                                                html.window.history.pushState(null, '', '/contact');
                                                Navigator.pop(context);
                                                _pageController.animateToPage(2, duration: 700.ms, curve: Curves.linear);
                                              },
                                              child: Column(children: <Widget>[Text("Contact".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade100, fontSize: 20))), Container(height: 2, width: "Contact".length * 11, color: Colors.green)]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((dynamic value) => _menuController.reverse());
                            } else {
                              _menuController.reverse();
                            }
                          },
                          child: AnimatedIcon(icon: AnimatedIcons.menu_close, color: Colors.white, size: 30, progress: _menuController),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  PageView(physics: const NeverScrollableScrollPhysics(), controller: _pageController, children: _screensMaximized),
                  Padding(
                    padding: const EdgeInsets.all(64),
                    child: Row(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Hafedh", style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.blueGrey, fontSize: 18))),
                            const Text(" "),
                            Text("Gunichi", style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.white70, fontSize: 18))),
                          ],
                        ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true, period: const Duration(seconds: 2))).shimmer(colors: <Color>[Colors.white, Colors.grey]),
                        const SizedBox(width: 20),
                        StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setS) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 17, 255, 160)),
                                child: const Center(child: Icon(FontAwesomeIcons.language, size: 15, color: Colors.black)),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () async {
                                  setS(() => _en = true);
                                  await Get.updateLocale(const Locale("en", "US"));
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  width: 40,
                                  height: 30,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(color: _en ? const Color.fromARGB(255, 17, 255, 160) : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("EN", style: GoogleFonts.actor(textStyle: TextStyle(color: _en ? Colors.black : Colors.white70, fontSize: 18)))),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () async {
                                  setS(() => _en = false);
                                  await Get.updateLocale(const Locale("fr", "FR"));
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  width: 40,
                                  height: 30,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(color: !_en ? const Color.fromARGB(255, 17, 255, 160) : Colors.transparent, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("FR", style: GoogleFonts.actor(textStyle: TextStyle(color: !_en ? Colors.black : Colors.white70, fontSize: 18)))),
                                ),
                              ),
                            ],
                          );
                        }),
                        const Spacer(),
                        StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) setS) {
                            return InkWell(
                              onHover: (bool value) => setS(() => _menu[0] = !_menu[0]),
                              onTap: () {
                                html.window.history.pushState(null, '', '/home');
                                _pageController.animateToPage(0, duration: 700.ms, curve: Curves.linear);
                              },
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                color: Colors.transparent,
                                width: 80,
                                height: 40,
                                child: Column(children: <Widget>[Text("Home".tr, style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.white70, fontSize: 18))), if (_menu[0]) Container(height: 5, width: 60, color: Colors.lightGreenAccent)]).animate(),
                              ),
                            );
                          },
                        ),
                        StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) setS) {
                            return InkWell(
                              onHover: (bool value) => setS(() => _menu[1] = !_menu[1]),
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                html.window.history.pushState(null, '', '/resume');
                                _pageController.animateToPage(1, duration: 700.ms, curve: Curves.linear);
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: 80,
                                height: 40,
                                child: Column(children: <Widget>[Text("Resume".tr, style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.white70, fontSize: 18))), if (_menu[1]) Container(height: 5, width: 60, color: Colors.lightGreenAccent)]).animate(),
                              ),
                            );
                          },
                        ),
                        StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setS) {
                          return InkWell(
                            onHover: (bool value) => setS(() => _menu[2] = !_menu[2]),
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              html.window.history.pushState(null, '', '/contact');
                              _pageController.animateToPage(2, duration: 700.ms, curve: Curves.linear);
                            },
                            child: Container(
                              width: 80,
                              height: 40,
                              color: Colors.transparent,
                              child: Column(children: <Widget>[Text("Contact".tr, style: GoogleFonts.actor(textStyle: const TextStyle(color: Colors.white70, fontSize: 18))), if (_menu[2]) Container(height: 5, width: 60, color: Colors.lightGreenAccent)]).animate(),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
