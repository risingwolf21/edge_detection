library edge_detection;

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:image_edge_detection/constants.dart';
import 'package:image_edge_detection/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;

///Apply Sobel-Operator on [File]
Future<img.Image> applySobelOperator(File file) =>
    applyFilterOnFile(file, sobelx, sobely);

///Apply Laplace-Operator on [File]
Future<img.Image> applyLaplaceOperator(File file) =>
    applyFilterOnFile(file, laplacex, laplacey);

///Apply Scharr-Operator on [File]
Future<img.Image> applyScharrOperator(File file) =>
    applyFilterOnFile(file, scharrx, scharry);

Future<img.Image> applyFilterOnFile(
    File file, List<List<int>> sx, List<List<int>> sy) async {
  var bytes = file.readAsBytesSync();
  var image = await decodeImageFromList(bytes);
  var width = image.width;
  var height = image.height;
  var data = await image.toByteData();
  var uint32 = data.buffer.asUint32List();

  return applyFilterOnUint32List(uint32, width, height, sx, sy);
}

Future<img.Image> applyFilterOnUint32List(Uint32List image, int width,
    int height, List<List<int>> sx, List<List<int>> sy) async {
  assert(sx.length == sy.length && sx.length != 0);
  assert(sx[0].length == sy[0].length && sx[0].length != 0);

  List<int> bytes = grayscale(image);

  for (int i = 0; i < width - 2; i++) {
    for (int j = 0; j < height - 2; j++) {
      var gx = 0;
      var gy = 0;
      for (int x = 0; x < sx.length; x++) {
        for (int y = 0; y < sx[0].length; y++) {
          var pixel = getPixel(bytes, i + y, j + x, width);
          gx += sx[x][y] * pixel;
          gy += sy[x][y] * pixel;
        }
      }
      try {
        int g = sqrt((gx * gx) + (gy * gy)).floor();
        var color = getColor(g, g, g);
        bytes[(j + i * width)] = color;
      } on UnsupportedError {
        // on unsupported error do not set the value of the current pixel
        // and keep the grayscale
      }
    }
  }
  return img.Image.fromBytes(width, height, bytes,
      format: img.Format.luminance);
}
