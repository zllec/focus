import 'package:flutter/material.dart';
import 'widgets/quote_widget.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Focus",
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(35, 36, 38, 1),
        body: Container(
          child: QuoteWidget(),
        ),
      ),
    );
  }
}
