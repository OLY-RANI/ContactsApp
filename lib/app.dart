import 'package:flutter/material.dart';
import 'package:prac/main.dart';

import 'contact_list_screen.dart';

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ContactListScreen(),
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(double.maxFinite),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              )
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          ),
        )

    );
  }
}