import 'package:edge_detection/rgba.dart';
import 'package:edge_detection/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Extract Channels from int", () {
    int numberToTransform = 2316511318;
    RGBA rgba = extractChannel(numberToTransform);
    expect(86, rgba.b);
    expect(40, rgba.g);
    expect(19, rgba.r);
    expect(138, rgba.a);
  });
  test("Extract Channels for 0", () {
    int numberToTransform = 0;
    RGBA rgba = extractChannel(numberToTransform);
    expect(0, rgba.b);
    expect(0, rgba.g);
    expect(0, rgba.r);
    expect(0, rgba.a);
  });
  test("Extract Channels for max int", () {
    int numberToTransform = 4294967295;
    RGBA rgba = extractChannel(numberToTransform);
    expect(255, rgba.b);
    expect(255, rgba.g);
    expect(255, rgba.r);
    expect(255, rgba.a);
  });
}
