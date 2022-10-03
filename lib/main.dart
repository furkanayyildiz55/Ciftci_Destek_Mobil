import 'dart:io';

import 'package:ciftci_destek_mobil/screen/hal_fiyatlar%C4%B1.dart';
import 'package:ciftci_destek_mobil/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciftci_destek_mobil/screen/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Çiftçi Destek Mobil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.roboto(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: WelcomePage(),
      home: MainPaage(),
    );
  }
}
