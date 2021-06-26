import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kat_mi/messages.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<String> images = List.empty(growable: true);
  List<String> messages = List.empty(growable: true);
  Timer? _timer;
  int i = 1;

  void loadPhotos() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      i++;
      if (i < 6) {
        images.insert(0, 'image/kat$i.jpg');
        messages.insert(0, photosMessage[i - 1]);
        setState(() {});
      } else
        _timer!.cancel();
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    images.insert(0, 'image/kat1.jpg');
    messages.insert(0, photosMessage[0]);
    setState(() {});
    loadPhotos();
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
              itemCount: images.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      child: Text(
                        messages[index],
                        style: TextStyle(
                            fontFamily: 'acme',
                            fontSize: 18,
                            color: Colors.pink),
                      ),
                      padding: EdgeInsets.all(16),
                      color: Colors.pink.withOpacity(0.2),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    color: Colors.pink.withOpacity(0.1),
                    child: Image.asset(
                      images[index],
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
