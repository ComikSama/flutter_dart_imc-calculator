import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_style.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;
  const HeightSelector(
    {super.key, 
    required this.selectedHeight, 
    required this.onHeightChange}
  );

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  //double height = 170; //Altura inicial en cm

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.backgroundComponent,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12 , bottom: 12),
          child: Column(
            children: [
              const Text("ALTURA", style: TextStyles.bodytext),
              Text("${widget.selectedHeight.toStringAsFixed(0)} cm", 
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)
              ),
              Slider(
                value: widget.selectedHeight, 
                onChanged: (newHeight){
                  setState(() {
                    widget.onHeightChange(newHeight);
                  });
                },
                min: 130,
                max: 220,
                divisions: 90,
                label: "${widget.selectedHeight.toStringAsFixed(0)} cm",
                activeColor: AppColor.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}