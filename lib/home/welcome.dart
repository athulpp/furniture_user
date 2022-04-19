// import 'package:flutter/material.dart';

// class GradientBorderContainer extends StatelessWidget {
//   GradientBorderContainer({
//     required gradient,
//     required this.child,
//     required this.onPressed,
//     this.strokeWidth = 4,
//     this.borderRadius = 64,
//     this.padding = 16,
//     splashColor
//   }) :
//   this.painter = GradientPainter(
//     gradient: gradient, strokeWidth: strokeWidth, borderRadius: borderRadius
//   ),
//   this.splashColor = splashColor ?? gradient.colors.first;

//   final GradientPainter painter;
//   final Widget child;
//   final VoidCallback onPressed;
//   final double strokeWidth;
//   final double borderRadius;
//   final double padding;
//   final Color splashColor;

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: painter,
//         child: InkWell(
//           highlightColor: Colors.transparent,
//           splashColor: splashColor,
//           borderRadius: BorderRadius.circular(borderRadius),
//           onTap: onPressed,
//           child: Container(
//             padding: EdgeInsets.all(padding + strokeWidth),
//               child: child
//           ),
//         ),
//     );
//   }
// }