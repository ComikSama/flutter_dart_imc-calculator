import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_style.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 50;
  double selectedHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(selectedHeight: selectedHeight, onHeightChange: (newHeight) {
          setState(() {
            selectedHeight = newHeight;
          });
        }),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16 ),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "PESO (kg)", 
                  value: selectedWeight, 
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                )
              ),
              const SizedBox(width: 16),
              Expanded(child: NumberSelector(
                title: "EDAD (años)",
                value: selectedAge,
                onIncrement: () {
                  setState(() {
                    selectedAge++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    selectedAge--;
                  });
                },
              )),  
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImcResultScreen(
                    height: selectedHeight,
                    age: selectedAge,
                    weight: selectedWeight,
                  ))
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )),
                  backgroundColor: 
                    WidgetStatePropertyAll(AppColor.primary)),
              child: const Text("CALCULAR IMC", style: TextStyles.bodytext,),
            ),
          ),
        ),
      ]
    );
  }
}