import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_style.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int age;
  final int weight;
  const ImcResultScreen(
    {super.key, 
    required this.height, 
    required this.age, 
    required this.weight}
  );

  @override
  Widget build(BuildContext context) {
    double heightInMeters = height / 100;
    double ImcResult = weight / (heightInMeters * heightInMeters);

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: toolbarResult(),
      body: bodyResult(ImcResult, context)
    );
  }
}

AppBar toolbarResult(){
  return AppBar(
    backgroundColor: AppColor.primary,
    foregroundColor: Colors.white,
    title: const Text('IMC Resultados'),
  );
}

Padding bodyResult(double imcResult, BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        const Text("Tu resultado es:", style: TextStyle(
          fontSize: 38,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32, left: 16.0, right: 16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.backgroundComponent,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(getTitleByImc(imcResult), 
                      style: TextStyle(
                        fontSize:30, 
                        fontWeight: FontWeight.w600, 
                        color: getColorByImc(imcResult)
                      )
                  ),
                  Text(
                    imcResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      getDecriptionByImc(imcResult),
                      textAlign: TextAlign.center, // Aquí, fuera del style
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                  ) 
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )),
                    backgroundColor: 
                      WidgetStatePropertyAll(AppColor.primary)),
            child: Text("Finalizar", style: TextStyles.bodytext,),
          ),
        ),
      ],
    ),
  );
}

getColorByImc(double imcResult) {
  return switch (imcResult) {
    < 18.5 => Colors.yellow,
    < 24.9 => Colors.green,
    < 29.9 => Colors.orange,
    _ => Colors.red,
  };
}

String getTitleByImc(double imcResult) {
  return switch (imcResult) {
    < 18.5 => "Bajo peso",
    < 24.9 => "Normal",
    < 29.9 => "Sobrepeso",
    _ => "Obesidad",
  };
}
String getDecriptionByImc(double imcResult) {
  return switch (imcResult) {
    < 18.5 => "Tu peso esta por debajo de lo recomnendado",
    < 24.9 => "Tu peso es normal, ¡felicidades!",
    < 29.9 => "Tienes sobrepeso, debes cuidar tu alimentación",
    _ => "Tienes obesidad, es importante que consultes a un especialista",
  };
}