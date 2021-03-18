import 'dart:typed_data';
import 'package:image_edge_detection/rgba.dart';

/// Returns the luminance (grayscale) value of the color.
int getLuminanceRgb(int r, int g, int b) =>
    (0.299 * r + 0.587 * g + 0.114 * b).round();

/// Get the color with the given [r], [g], [b], and [a] components.
///
/// The channel order of a uint32 encoded color is RGBA.
int getColor(int r, int g, int b, [int a = 255]) =>
    (clamp255(a) << 24) |
    (clamp255(b) << 16) |
    (clamp255(g) << 8) |
    (clamp255(r));

/// Clamp [x] to [a] [b]
int clamp(int x, int a, int b) => x.clamp(a, b).toInt();

/// Clamp [x] to [0, 255]
int clamp255(int x) => x.clamp(0, 255).toInt();

RGBA extractChannel(int p) => new RGBA(
      b: p & 255,
      g: (p >> 8) & 255,
      r: (p >> 16) & 255,
      a: (p >> 24) & 255,
    );

grayscale(Uint32List image) {
  return image
      .map(extractChannel)
      .map((e) => getLuminanceRgb(e.r, e.g, e.b))
      .toList();
}

int getPixel(List<int> bytes, int x, int y, int width) {
  return bytes[(y + x * width)];
}