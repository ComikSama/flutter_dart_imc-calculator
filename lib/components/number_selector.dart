import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_style.dart';
import 'package:imc_calculator/core/app_color.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;

  const NumberSelector(
    {super.key, 
    required this.title, 
    required this.onIncrement, 
    required this.value, 
    required this.onDecrement}
  );

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundComponent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(widget.title, style: TextStyles.bodytext),
            Text(widget.value.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (){
                    widget.onDecrement();
                  }, 
                  shape: CircleBorder(), 
                  backgroundColor: AppColor.primary,
                  child: Icon(
                    Icons.remove, 
                    color: Colors.white
                  ),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (){
                    widget.onIncrement();
                  }, 
                  shape: CircleBorder(), 
                  backgroundColor: AppColor.primary,
                  child: Icon(
                    Icons.add, 
                    color: Colors.white
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}