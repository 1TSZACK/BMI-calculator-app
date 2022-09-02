// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, camel_case_types, library_private_types_in_public_api, sort_child_properties_last, constant_identifier_names

// import 'dart:ui';

import 'package:bmi/bottom_button.dart';
import 'package:bmi/calculator_brain.dart';
import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';

import 'icon_content.dart';
import 'resusable_card.dart';

const bottomContainerHeight = 80.0;
const Color active_card_colour = Color(0xFF1D1E33);
const Color inactive_card_colour = Color(0xFF111328);
const Color inactive_icon_color = Color.fromARGB(255, 255, 255, 255);
const Color active_icon_male = Color.fromARGB(255, 4, 165, 240);
const Color active_icon_female = Color.fromARGB(255, 238, 16, 127);

enum Gender { male, female, non }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.non;

  Color maleCardColor = inactive_card_colour;
  Color femaleCardColor = inactive_card_colour;
  Color maleIcon = inactive_icon_color;
  Color femaleIcon = inactive_icon_color;

  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          // Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: resuable_card(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                        maleIcon = active_icon_male;
                        femaleIcon = inactive_icon_color;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? active_card_colour
                        : inactive_card_colour,
                    cardChild: IconContent(
                        icon: Icons.male, label: 'MALE', iconColor: maleIcon),
                  ),
                ),
                Expanded(
                  child: resuable_card(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                        femaleIcon = active_icon_female;
                        maleIcon = inactive_icon_color;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? active_card_colour
                        : inactive_card_colour,
                    cardChild: IconContent(
                        icon: Icons.female,
                        label: 'FEMALE',
                        iconColor: femaleIcon),
                  ),
                ),
              ],
            ),
          ),
          // Slider
          Expanded(
            child: resuable_card(
              onPress: () {
                null;
              },
              colour: active_card_colour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        min: 120,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          // Weight and Age
          Expanded(
            child: Row(
              children: [
                // Weight
                Expanded(
                  child: resuable_card(
                    onPress: () {
                      null;
                    },
                    colour: active_card_colour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xFF8D8E98)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Age
                Expanded(
                  child: resuable_card(
                    onPress: () {
                      null;
                    },
                    colour: active_card_colour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'yrs',
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xFF8D8E98)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
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
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiText: calc.calculateBMI(),
                  bmiresult: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
      ),
      elevation: 0.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: () {
        onPress();
      },
    );
  }
}
