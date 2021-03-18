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
  
  img.Image edgeDetected = EdgeDetector().applySobelOperator(file);
  file.writeAsBytes(img.encodePng(edgeDetected));
  
  // display the changed Image as Widget:
  // Image.file(file);
}
```
Original Image             |  Applied Sobel-Operator
:-------------------------:|:-------------------------:
![](https://github.com/risingwolf21/edge_detection/blob/6f561d3abdd7a5e8c2dabed705e09839135fcaad/valve_original.png)  |  ![](https://github.com/risingwolf21/edge_detection/blob/f0bde7074d1feec9af4ca4781a4497b9671810ac/valve_sobel.png)
