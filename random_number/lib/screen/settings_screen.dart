import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({Key? key, required this.maxNumber}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNum = 1000;
  @override
  void initState() {
    maxNum = widget.maxNumber.toDouble();
    super.initState();
  }

  void onChange(double val) {
    setState(() {
      maxNum = val;
    });
  }

  void onButtonChange() {
    Navigator.of(context).pop(maxNum.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _Body(maxNumber: maxNum),
                _Footer(
                  maxNum: maxNum,
                  onSliderChanged: onChange,
                  onButtonPressed: onButtonChange,
                ),
              ],
            ),
          ),
        ));
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({Key? key, required this.maxNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
          children: maxNumber.toInt().toString().split('').map((e) {
        return Image.asset(
          'asset/img/$e.png',
          width: 50,
          height: 70,
        );
      }).toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNum;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;
  _Footer(
      {Key? key,
      required this.maxNum,
      required this.onSliderChanged,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNum,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
          child: Text(
            '저장',
          ),
        ),
      ],
    );
  }
}
