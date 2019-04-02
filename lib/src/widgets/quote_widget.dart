import 'package:flutter/material.dart';
import 'dart:math';
import '../lib/quotes_list.dart';

class QuoteWidget extends StatefulWidget {
  createState() {
    return QuoteWidgetState();
  }
}

class QuoteWidgetState extends State<QuoteWidget> {
  String quote = '';
  String author = '';
  final colorList = [
    Color.fromRGBO(26, 188, 156, 1.0),
    Color.fromRGBO(46, 204, 113, 1.0),
    Color.fromRGBO(35, 36, 38, 1),
    Color.fromRGBO(52, 152, 219, 1.0),
    Color.fromRGBO(230, 126, 34, 1.0),
    Color.fromRGBO(155, 89, 182, 1.0),
    Color.fromRGBO(243, 156, 18, 1.0)
  ];
  var _color = Color.fromRGBO(192, 57, 43, 1.0);
  var rng = new Random();

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  void fetchQuote() {
    final quoteModel = QuoteModel.fromJSON(quotes[rng.nextInt(quotes.length)]);
    setState(() {
      quote = quoteModel.quote;
      author = quoteModel.author;
      _color = colorList[rng.nextInt(colorList.length)];
    });
  }

  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: _color,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    quote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(55, 59, 66, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: FlatButton(
              onPressed: fetchQuote,
              child: Text(
                "Inspire me!",
                style: TextStyle(color: Colors.white54),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class QuoteModel {
  String quote;
  String author;

  QuoteModel(this.quote, this.author);

  QuoteModel.fromJSON(Map<String, dynamic> parsedJSON) {
    quote = parsedJSON['quote'];
    author = parsedJSON['author'];
  }
}
