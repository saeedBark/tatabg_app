import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('تطابق صورة'),
        backgroundColor: Colors.indigo[800],
      ),
      body: const ImagePage(),
    ),
  ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 6;
  int rightImageNumber = 4;
  void changeImage() {
    leftImageNumber = Random().nextInt(8) + 1;
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber
              ? 'لقد نجحت مبرروك'
              : 'حاول مرة أخرى',
          style: const TextStyle(fontSize: 42, color: Colors.white),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeImage();
                  });
                },
                child: Image.asset('images/image-$leftImageNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeImage();
                  });
                },
                child: Image.asset('images/image-$rightImageNumber.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
