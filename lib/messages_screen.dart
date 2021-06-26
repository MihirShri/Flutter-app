import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kat_mi/messages.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List messages = List.empty(growable: true);
  Timer? _timer;
  int i = 0;

  void loadMessage() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timer!.tick == intervals[i]) {
        if (i < intervals.length - 1)
          i++;
        else
          _timer!.cancel();
        if (messages.length < messagesData.length) {
          messages.insert(0, messagesData[i]);
          setState(() {});
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    messages.insert(0, messagesData[0]);
    setState(() {});
    loadMessage();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Happy birthday Katyayani',
            style: TextStyle(fontFamily: 'acme'),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.home,
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              transform: GradientRotation(1.5708),
              colors: [
                Color(0xffffdde1),
                Color(0xffee9ca7),
              ],
            ),
          ),
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) => Card(
              child: Container(
                width: double.infinity,
                color: Colors.pink.withOpacity(0.1),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Center(
                  child: Text(
                    messages[index],
                    style: TextStyle(
                      fontFamily: 'acme',
                      fontSize: 20,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
