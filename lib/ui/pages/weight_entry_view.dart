import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal_interview/ui/widgets/metrics_bubble.dart';
import 'package:tonal_interview/utils/styles.dart';

class WeightEntryView extends StatefulWidget {
  const WeightEntryView({Key? key}) : super(key: key);

  @override
  _WeightEntryViewState createState() => _WeightEntryViewState();
}

class _WeightEntryViewState extends State<WeightEntryView> {
  final _labelController = TextEditingController();
  final _weightController = TextEditingController();

  /// By default, these values are null. This should result in a blank widget
  String? _label;
  int? _weight;

  /// Used to reduce duplicate code
  final _textFieldDecoration = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Styles.primaryColor,
      ),
    ),
  );

  /// Used to reduce duplicate code
  final _textFieldCloseIcon = Icon(
    Icons.close,
    color: Styles.primaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Calculator'),
        backgroundColor: Styles.primaryColor,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.center,
              child: MetricsBubble(
                label: _label,
                weight: _weight,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: _textFieldDecoration.copyWith(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _labelController.clear();

                          setState(() {
                            _label = null;
                          });
                        },
                        icon: _textFieldCloseIcon,
                      ),
                    ),
                    controller: _labelController,

                    /// Limit length to prevent overflow
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(14),
                    ],
                    onChanged: (input) {
                      setState(() {
                        _label = input;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: _textFieldDecoration.copyWith(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _weightController.clear();

                          setState(() {
                            _weight = null;
                          });
                        },
                        icon: _textFieldCloseIcon,
                      ),
                    ),
                    controller: _weightController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (input) {
                      int? weight = int.tryParse(input);

                      if (weight != null && weight >= 0 && weight <= 350) {
                        setState(() {
                          _weight = weight;
                        });
                      } else {
                        setState(() {
                          _weight = null;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        _labelController.clear();
                        _weightController.clear();

                        setState(() {
                          _label = null;
                          _weight = null;
                        });
                      },
                      child: Text(
                        'Clear'.toUpperCase(),
                        style: TextStyle(
                          color: Styles.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
