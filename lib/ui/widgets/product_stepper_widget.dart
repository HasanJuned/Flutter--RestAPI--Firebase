import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';

class ProductStepperWidget extends StatefulWidget {
  final Function(int currentValue) onDecrement, onIncrement;
  ProductStepperWidget({Key? key, required this.onDecrement, required this.onIncrement}) : super(key: key);

  @override
  State<ProductStepperWidget> createState() => _ProductStepperWidgetState();
}

class _ProductStepperWidgetState extends State<ProductStepperWidget> {
  int currentValue = 0;
  late TextEditingController stepperController =
      TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: InkWell(
            onTap: () {
              if (currentValue > 1) {
                currentValue--;
                stepperController.text = currentValue.toString();
                widget.onDecrement(currentValue);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.remove),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 25,
          child: TextField(
            controller: stepperController,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: InkWell(
            onTap: () {
              if (currentValue <20) {
                currentValue++;
                stepperController.text = currentValue.toString();
                widget.onIncrement(currentValue);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
