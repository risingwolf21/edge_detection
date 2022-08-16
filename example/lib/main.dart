import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import 'package:image_edge_detection/functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edge detection Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const origImagePath = "valve_original.png";
  final Image _origImage = Image.asset(origImagePath);
  Image? _sobelImage;

  @override
  void initState() {
    super.initState();

    _load();
  }

  _load() async {
    var origBytes = await rootBundle.load(origImagePath);

    print("orig size: ${origBytes.lengthInBytes}");

    var imgImage = img.decodeImage(origBytes.buffer.asUint8List());

    var sobelImage = await applySobelOnImage(imgImage!);

    var sobelPng = img.encodePng(sobelImage);

    _sobelImage = Image.memory(Uint8List.fromList(sobelPng));

    setState(() {
      _sobelImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("original: "),
              _origImage,
              const Text("sobel: "),
              if (_sobelImage != null) _sobelImage!,
            ],
          ),
        ),
      ),
    );
  }
}
