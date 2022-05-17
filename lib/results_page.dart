import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
      @required this.resultText,
      @required this.bmiResult});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(child: Text('Your Result', style: kTitleText)),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kResultText),
                    Text(bmiResult.toUpperCase(), style: kBMIStyle),
                    Text(interpretation.toUpperCase(),
                        textAlign: TextAlign.center, style: kBodyText),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: bottomButton(text: 'Re-Calculate'),
          )
        ],
      ),
    );
  }
}
