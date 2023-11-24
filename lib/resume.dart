import 'dart:math';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final String _desc = "Hello!, I'm Hafedh Gunichi. A Flutter Developer from Tunisia, Sidi-Bouzid. I have rich experience in Mobile,Web,Desktop Applications Development. I have also more than 3 years experience in Python.";
  final List<Map<String, String>> _aboutMe = const <Map<String, String>>[
    <String, String>{"key": "Age", "value": "21"},
    <String, String>{"key": "Residence", "value": "Tunisia - Sidi Bouzid"},
    <String, String>{"key": "Freelance", "value": "Available"},
    <String, String>{"key": "Phone", "value": "+216 23 566 502"},
    <String, String>{"key": "E-mail", "value": "hafedhgunichi@gmail.com"},
  ];
  final List<Map<String, dynamic>> _services = const <Map<String, dynamic>>[
    <String, dynamic>{"key": "Web Development", "value": "Modern websites that will help you reach all of your marketing.", 'icon': Icons.code_outlined},
    <String, dynamic>{"key": "Game Development", "value": "Developing memorable and unique mobile android, ios and video games.", 'icon': Icons.games_outlined},
    <String, dynamic>{"key": "Mobile Applications", "value": "Games, playing music, handle network transactions, interacting content etc.", 'icon': Icons.android_outlined},
    <String, dynamic>{"key": "Desktop Applications", "value": "Desktop applications for anyone.", 'icon': Icons.desktop_mac_outlined},
  ];
  final List<Map<String, dynamic>> _languages = const <Map<String, dynamic>>[
    <String, dynamic>{"key": "English", "value": 80},
    <String, dynamic>{"key": "French", "value": 60},
  ];
  final List<Map<String, dynamic>> _coding = const <Map<String, dynamic>>[
    <String, dynamic>{"key": "Python", "value": 90, 'icon': FontAwesomeIcons.python},
    <String, dynamic>{"key": "Dart / Flutter", "value": 90, 'icon': FontAwesomeIcons.codiepie},
    <String, dynamic>{"key": "C / C++", "value": 90, 'icon': FontAwesomeIcons.c},
    <String, dynamic>{"key": "JS / TS", "value": 75, 'icon': FontAwesomeIcons.js},
    <String, dynamic>{"key": "SQL", "value": 75, 'icon': FontAwesomeIcons.database},
    <String, dynamic>{"key": "JAVA", "value": 80, 'icon': FontAwesomeIcons.java},
    <String, dynamic>{"key": "PHP", "value": 65, 'icon': FontAwesomeIcons.php},
    <String, dynamic>{"key": "HTML / CSS", "value": 75, 'icon': FontAwesomeIcons.html5},
    <String, dynamic>{"key": "Qt", "value": 80, 'icon': FontAwesomeIcons.phoenixFramework},
  ];
  final List<String> _education = const <String>["2019 - 2020", "Lycée Mixte - Sidi Bouzid", "Bachelor's Degree in Computer Science"];
  final List<String> _knowledge = const <String>["Website Hosting", "Cloud, IOT, Cyber-Security", "Machine Learning / Deep Learning"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Center(child: Text("Resume".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade100, fontSize: 50))))),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 200, height: 400, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/${Random().nextInt(3) + 1}.jpg")))),
                  const SizedBox(height: 20),
                  Center(child: Text(_desc.tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade100, fontSize: 18)), textAlign: TextAlign.center)),
                  const SizedBox(height: 20),
                  for (Map<String, String> pair in _aboutMe) ...<Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(pair["key"]!.tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Color.fromARGB(255, 17, 255, 160), fontSize: 18))),
                        const SizedBox(width: 10),
                        Text("-->", style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.lightBlueAccent, fontSize: 18))),
                        const SizedBox(width: 10),
                        Text(pair["value"]!.tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 18))),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                  AnimatedButton(
                    text: "Download CV".tr,
                    selectedBackgroundColor: const Color.fromARGB(255, 17, 255, 160),
                    selectedTextColor: Colors.black,
                    onPress: () async {
                      final bytes = await rootBundle.load('assets/cv.pdf');
                      final uint8List = bytes.buffer.asUint8List();
                      await FileSaver.instance.saveFile('CV.pdf', uint8List, "pdf", mimeType: MimeType.PDF);
                      Fluttertoast.showToast(msg: "CV Downloaded".tr, fontSize: 30, webBgColor: "rgb(17, 255, 160)", webPosition: "center", textColor: Colors.black, toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 3, webShowClose: true);
                    },
                    transitionType: TransitionType.CENTER_ROUNDER,
                    textStyle: GoogleFonts.anybody(textStyle: const TextStyle(color: Color.fromARGB(255, 17, 255, 160), fontSize: 18)),
                    backgroundColor: Colors.transparent,
                    height: 60,
                    width: 200,
                    borderColor: const Color.fromARGB(255, 17, 255, 160),
                    borderWidth: 1,
                    borderRadius: 0,
                    animatedOn: AnimatedOn.onHover,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(child: Container(width: 1, height: 60, color: Colors.white.withOpacity(.5))),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Services".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          for (Map<String, dynamic> pair in _services) ...<Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Icon(pair['icon']!, size: 40, color: const Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text((pair["key"] as String).tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 20)), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Text((pair["value"] as String).tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18)), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(child: Container(width: 1, height: 30, color: Colors.white.withOpacity(.5))),
            const SizedBox(height: 10),
          ],
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Education".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  for (String pair in _education) ...<Widget>[
                    Text(
                      pair.tr,
                      style: GoogleFonts.anybody(
                        textStyle: TextStyle(
                          color: pair.tr == "2019 - 2020".tr
                              ? const Color.fromARGB(255, 17, 255, 160)
                              : pair.tr == "Lycée Mixte - Sidi Bouzid".tr
                                  ? Colors.white
                                  : Colors.blueGrey.shade200,
                          fontSize: pair.tr == "Lycée Mixte - Sidi Bouzid".tr ? 22 : 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 60, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Languages Skills".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (Map<String, dynamic> pair in _languages) ...<Widget>[
                    Text((pair["key"]! as String).tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 18))),
                    const SizedBox(height: 10),
                    FAProgressBar(
                      currentValue: pair["value"]!,
                      size: 5,
                      animatedDuration: const Duration(milliseconds: 1500),
                      borderRadius: BorderRadius.circular(0),
                      backgroundColor: Colors.transparent,
                      progressColor: const Color.fromARGB(255, 17, 255, 160),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 60, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Coding Skills".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: <Widget>[
                  for (Map<String, dynamic> pair in _coding)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            backgroundColor: Colors.transparent,
                            foregroundColor: const Color.fromARGB(255, 17, 255, 160),
                            progress: pair["value"]!,
                            maxProgress: 100,
                            startAngle: 0,
                            sweepAngle: 360,
                            foregroundStrokeWidth: 2,
                            backgroundStrokeWidth: 2,
                            animation: true,
                            animationDuration: 1500.ms,
                            child: Center(child: Icon(pair["icon"], color: const Color.fromARGB(255, 17, 255, 160), size: 50)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text((pair["key"] as String).tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 18))),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 60, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Knowledge".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (String item in _knowledge) ...<Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20, color: Color.fromARGB(255, 17, 255, 160)),
                        const SizedBox(width: 10),
                        Flexible(child: Text(item.tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 18)))),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 60, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Interests".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(FontAwesomeIcons.book, size: 40, color: Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text("Reading".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 22))),
                  const SizedBox(height: 20),
                  Text("Reading Scientific Books".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 30, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(FontAwesomeIcons.chess, size: 40, color: Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text("Chess".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 22))),
                  const SizedBox(height: 20),
                  Text("I Always Play CHESS".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
