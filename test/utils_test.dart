import 'package:edge_detection/rgba.dart';
import 'package:edge_detection/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Extract Channels from int", () {
    int numberToTransform = 3516510516816565151;
    RGBA rgba = extractChannel(numberToTransform);
    expect(54175, rgba.b);
    expect(3014, rgba.g);
    expect(10159, rgba.r);
    expect(12493, rgba.a);
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
    int numberToTransform = 9223372036854775807;
    RGBA rgba = extractChannel(numberToTransform);
    expect(65535, rgba.b);
    expect(65535, rgba.g);
    expect(65535, rgba.r);
    expect(32767, rgba.a);
  });
}
