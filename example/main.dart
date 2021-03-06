import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:image_edge_detection/functions.dart' as det;

void main() async {

  // Read an image from file
  final image = File("test.png");

  //Transfrom the Image and get the Result
  final result = await det.applySobelOnFile(image);

  //Write result back to the original File
  image.writeAsBytes(img.encodePng(result));
}