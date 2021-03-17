# Edgedetection with Dart

This package is able to detect edges on an image file.
Currently there are the Soble, Scharr and Laplace-Operator available.
Feel free to open an issue for any problems or new operators or new 
functionality.

## Example

```dart
import 'dart:io';
import 'package:image/image.dart' as img;

void main() async {
  var file = File("temp.png");
  
  img.Image edgeDetected = EdgeDetector.applySobelOperator(file);
  file.writeAsBytes(img.encodePng(image));
  
  // display the changed Image as Widget:
  // Image.file(file);
}
