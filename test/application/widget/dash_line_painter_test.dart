import 'package:demo_fitpage/application/widget/dashed_line_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DashedLinePainter', () {
    test('paint() draws dashed line with correct color and stroke width', () {
      final painter = DashedLinePainter();
      final canvas = MockCanvas();
      const size = Size(100, 10);
      painter.paint(canvas, size);

      // Define the expected Paint properties
      final expectedColor = Colors.grey[300]!;
      const expectedStrokeWidth = 1.0;
      const expectedStyle = PaintingStyle.stroke;

      expect(canvas.drawLineCalls.length, greaterThan(0));
      for (final call in canvas.drawLineCalls) {
        expect(call.paint.color, expectedColor);
        expect(call.paint.strokeWidth, expectedStrokeWidth);
        expect(call.paint.style, expectedStyle);
      }
    });

    test('shouldRepaint() returns false', () {
      final painter = DashedLinePainter();
      expect(painter.shouldRepaint(painter), false);
    });
  });
}

class MockCanvas implements Canvas {
  final List<DrawLineCall> drawLineCalls = [];

  @override
  void drawLine(Offset p1, Offset p2, Paint paint) {
    drawLineCalls.add(DrawLineCall(p1, p2, paint));
  }

  // Implement other required methods, returning default values if needed
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DrawLineCall {
  final Offset p1;
  final Offset p2;
  final Paint paint;

  DrawLineCall(this.p1, this.p2, this.paint);
}
