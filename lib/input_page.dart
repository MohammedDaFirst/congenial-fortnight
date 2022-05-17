import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

CalculatorBrain calculatorBrain;

enum userGender { male, female }

enum clickedButton { plus, minus }

userGender SelectedGender;

int height = 180;
int weight = 60;
int Age = 19;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          SelectedGender = userGender.male;
                        });
                      },
                      color: SelectedGender == userGender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardContent(
                          text: 'Male', genderedIcon: FontAwesomeIcons.mars)),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          SelectedGender = userGender.female;
                        });
                      },
                      color: SelectedGender == userGender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardContent(
                          text: 'Female',
                          genderedIcon: FontAwesomeIcons.venus)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kTextProp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('$height', style: kNumberText),
                            Text('cm', style: kTextProp)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kActiveSliderColor,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kInactiveSliderColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30,
                            ),
                            overlayColor: Color(0x1fEB1555),
                            trackHeight: 1.5,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kMin,
                            max: kMax,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kTextProp),
                        Text(
                          weight.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kTextProp),
                        Text(
                          Age.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (Age > 5) {
                                    Age--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (Age < 110) {
                                    Age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
                age: Age,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: calc.CalculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretations(),
                        )),
              );
            },
            child: bottomButton(text: 'Calculate'),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  Function onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6,
      disabledElevation: 6,
      shape: CircleBorder(),
      fillColor: kFloatingBtnsColor,
      child: Icon(icon),
    );
  }
}
