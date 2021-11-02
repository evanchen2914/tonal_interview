import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tonal_interview/utils/styles.dart';

class MetricsBubble extends StatelessWidget {
  final String? label;
  final int? weight;

  /// I defined additional variables in case we want to use different styling in the future
  final String? unit;
  final Color? backgroundColor;

  const MetricsBubble(
      {Key? key,
      required this.label,
      required this.weight,
      this.unit,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Use a stack widget for background image, and to fix padding issues with weight text
    return Container(
      height: Styles.bubbleDiameter,
      width: Styles.bubbleDiameter,
      decoration:
          Styles.bubbleBoxDecoration.copyWith(color: this.backgroundColor),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -25,
            child: SvgPicture.asset(
              'assets/graph.svg',
              semanticsLabel: 'graph',
            ),
          ),
          Positioned(
            top: 40,
            child: Text(
              label ?? '',
              maxLines: 1,
              style: Styles.labelTextStyle,
            ),
          ),
          Text(
            weight == null ? '' : weight.toString(),
            maxLines: 1,
            style: Styles.weightTextStyle,
          ),
          Positioned(
            bottom: 30,
            child: Text(
              unit ?? 'lbs',
              maxLines: 1,
              style: Styles.unitTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
