import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_style.dart';
import 'package:imc_calculator/core/app_color.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //HOMBRE
      Expanded(
        child: GestureDetector(
          onTap:() {
            setState(() {
              selectedGender = "Hombre";
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 8),
            child: Container(
              decoration: BoxDecoration(
                color: selectedGender == "Hombre"
                ? AppColor.backgroundComponentSelected
                : AppColor.backgroundComponent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/male.png",
                      height: 100,
                    ),
                    Text("Hombre".toUpperCase(), style: TextStyles.bodytext),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //MUJER
      Expanded(
        child: GestureDetector(
          onTap:() {
            setState(() {
              selectedGender = "Mujer";
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 8, bottom: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: selectedGender == "Mujer"
                ? AppColor.backgroundComponentSelected
                : AppColor.backgroundComponent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/female.png",
                      height: 100,
                    ),
                    Text("Mujer".toUpperCase(), style: TextStyles.bodytext),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
