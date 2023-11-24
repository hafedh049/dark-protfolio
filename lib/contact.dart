import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(child: Text("Contact".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade100, fontSize: 50)))),
          ),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("About Me".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Icon(Icons.phone, size: 40, color: Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text("Phone".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 22))),
                  const SizedBox(height: 20),
                  Text("(+216) 23 566 502".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 30, color: Colors.white.withOpacity(.5))),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Icon(Icons.alternate_email_outlined, size: 40, color: Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text("E-mail".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 22))),
                  const SizedBox(height: 20),
                  Text("hafedhgunichi@gmail.com".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 30, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Icon(Icons.flag_circle_outlined, size: 40, color: Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text("Address".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 22))),
                  const SizedBox(height: 20),
                  Text("9110 Jelma Sidi-Bouzid".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 30, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Icon(Icons.attach_money_outlined, size: 40, color: Color.fromARGB(255, 17, 255, 160)),
                  const SizedBox(height: 20),
                  Text("Freelance Available".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 22))),
                  const SizedBox(height: 20),
                  Text("I'.m available for freelance hiring".tr, style: GoogleFonts.anybody(textStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Container(width: 1, height: 80, color: Colors.white.withOpacity(.5))),
          const SizedBox(height: 10),
          Align(alignment: AlignmentDirectional.centerStart, child: Text("Contact Form".tr, style: GoogleFonts.anybody(textStyle: const TextStyle(color: Colors.white, fontSize: 25)))),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey.shade100, width: .5)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      cursorColor: const Color.fromARGB(255, 17, 255, 160),
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z ]"))],
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "name is required";
                        } else if (!value.contains(RegExp(r"^[a-zA-Z][\w ]+$"))) {
                          return "this is not a valid name";
                        }
                        return null;
                      },
                      style: GoogleFonts.actor(color: Colors.white, fontSize: 18),
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: GoogleFonts.actor(color: Colors.blueGrey.shade200, fontSize: 20),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 17, 255, 160), width: 2)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 17, 255, 160), width: 2)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      cursorColor: const Color.fromARGB(255, 17, 255, 160),
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r"[\w\@\.]"))],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        } else if (!value.contains(RegExp(r"^[a-zA-Z]\w+\@[a-zA-Z]+\.[a-zA-Z]{2,3}$"))) {
                          return "this is not a valid email";
                        }
                        return null;
                      },
                      style: GoogleFonts.actor(color: Colors.white, fontSize: 18),
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: GoogleFonts.actor(color: Colors.blueGrey.shade200, fontSize: 20),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 17, 255, 160), width: 2)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 17, 255, 160), width: 2)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      cursorColor: const Color.fromARGB(255, 17, 255, 160),
                      maxLength: 1000,
                      maxLines: 7,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "message is required";
                        } else if (value.contains(RegExp(r"^\s+$"))) {
                          return "message can't contain only whitespaces.";
                        }
                        return null;
                      },
                      style: GoogleFonts.actor(color: Colors.white, fontSize: 18),
                      controller: _messageController,
                      decoration: InputDecoration(
                        labelText: "Message",
                        labelStyle: GoogleFonts.actor(color: Colors.blueGrey.shade200, fontSize: 20),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 17, 255, 160), width: 2)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 17, 255, 160), width: 2)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    AnimatedButton(
                      text: "Send Message",
                      selectedBackgroundColor: const Color.fromARGB(255, 17, 255, 160),
                      selectedTextColor: Colors.black,
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final http.Response response = await http.post(
                              Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
                              headers: const <String, String>{'Content-Type': 'application/json'},
                              body: json.encode(
                                <String, dynamic>{
                                  'service_id': 'service_l3saemi',
                                  'user_id': '806yxLLJN5s4YX-et',
                                  'template_id': 'template_if571r6',
                                  'template_params': <String, String>{
                                    'user_name': _nameController.text.trim(),
                                    'user_email': _emailController.text.trim(),
                                    'user_message': _messageController.text.trim(),
                                  },
                                },
                              ),
                            );
                            if (response.statusCode == 200) {
                              Fluttertoast.showToast(msg: "E-mail Sent Successfully", fontSize: 30, webBgColor: "rgb(17, 255, 160)", webPosition: "center", textColor: Colors.black, toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 3, webShowClose: true);
                              _nameController.clear();
                              _emailController.clear();
                              _messageController.clear();
                            } else {
                              Fluttertoast.showToast(msg: response.reasonPhrase!, fontSize: 30, webBgColor: "rgb(17, 255, 160)", webPosition: "center", textColor: Colors.black, toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 3, webShowClose: true);
                            }
                          } catch (e) {
                            Fluttertoast.showToast(msg: e.toString(), fontSize: 30, webBgColor: "rgb(17, 255, 160)", webPosition: "center", textColor: Colors.black, toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 3, webShowClose: true);
                          }
                        }
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
