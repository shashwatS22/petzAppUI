import 'package:flutter/material.dart';
import 'dart:math' as math;

class RectangularNotch extends NotchedShape {
  const RectangularNotch();

  @override
  Path getOuterPath(Rect host, Rect guest) {
    Offset center = Offset(host.center.dx, host.center.dy - 10);
    Rect rect = Rect.fromCenter(
        center: center, height: guest.height / 2, width: guest.width / 1.2);
    Path guestPath = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(18)));
    Path hostPath = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();

    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);
    Path returnPath =
        Path.combine(PathOperation.difference, hostPath, guestPath);
    return returnPath;

    //..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
    // ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)))
    // ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)

    //..close();
  }
}
