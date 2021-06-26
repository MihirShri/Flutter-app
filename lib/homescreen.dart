import 'package:flutter/material.dart';
import 'package:kat_mi/messages_screen.dart';
import 'package:kat_mi/photosscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessagesScreen(),
                  ));
                },
                child: Text('Click here for a surprise!'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  primary: Colors.pink,
                  side: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                  textStyle: TextStyle(
                      fontFamily: 'acme',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 24)),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhotosScreen(),
                  ));
                },
                child: Text('Click here for a surprise!'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  primary: Colors.pink,
                  side: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                  textStyle: TextStyle(
                      fontFamily: 'acme',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
