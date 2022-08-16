import 'dart:io';
import './constants.dart';
import './edge_detection.dart';
import 'package:image/image.dart' as img;

///Apply Sobel-Operator on [File]
Future<img.Image> applySobelOnFile(File file) =>
    applyFilterOnFile(file, sobelx, sobely);

///Apply Sobel-Operator on [img.Image]
Future<img.Image> applySobelOnImage(img.Image image) =>
    applyFilterOnImage(image, sobelx, sobely);

///Apply Laplace-Operator on [File]
Future<img.Image> applyLaplaceOnFile(File file) =>
    applyFilterOnFile(file, laplacex, laplacey);

///Apply Laplace-Operator on [img.Image]
Future<img.Image> applyLaplaceOnImage(img.Image image) =>
    applyFilterOnImage(image, laplacex, laplacey);

///Apply Scharr-Operator on [File]
Future<img.Image> applyScharrOnFile(File file) =>
    applyFilterOnFile(file, scharrx, scharry);

///Apply Scharr-Operator on [img.Image]
Future<img.Image> applyScharrOnImage(img.Image image) =>
    applyFilterOnImage(image, scharrx, scharry);
