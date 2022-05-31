import 'dart:io';
import 'package:atauni_son/menu_page.dart';
import 'package:atauni_son/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

 void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Color.fromARGB(255, 3, 2, 59),
          elevation: 0,
          
        )
      
      ),
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
    
  }
}
class MyHttpOverrides extends HttpOverrides{            //handshake exception ı düzelttim.
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



