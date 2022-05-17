import 'package:flutter/material.dart';

// K for constant
// because C is used for a lot of other things.
const kTextProp = TextStyle(fontSize: 18, color: Color(0xff8d8e98));
const kNumberText = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
const kBottomContainerStyle = TextStyle(
    fontSize: 22, fontFamily: 'Palatino', fontWeight: FontWeight.bold);
const kTitleText = TextStyle(
    fontSize: 50, fontFamily: 'Palatino', fontWeight: FontWeight.bold);
const kResultText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff24D876));
const kBMIStyle = TextStyle(fontSize: 100, fontWeight: FontWeight.bold);
const kBodyText = TextStyle(fontSize: 22);
const double kBottomContainerHeight = 65.0;
const Color kActiveCardColor = Color(0xFF1D1E33);
const Color kInactiveCardColor = Color(0xFF111328);
const Color kBottomContainerColor = Color(0xFFEB1555);
const Color kFooterColor = Color(0xffEB1555);
const Color kActiveSliderColor = Color(0xFFEB1555);
const Color kInactiveSliderColor = Color(0xFF8D8E98);
const Color kFloatingBtnsColor = Color(0x8a646788);

const double kMin = 120;
const double kMax = 220;

class bottomButton extends StatelessWidget {
  bottomButton({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(text, style: kBottomContainerStyle)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kFooterColor,
      ),
      width: double.infinity,
      height: kBottomContainerHeight,
      margin: EdgeInsets.only(top: 10),
    );
  }
}
