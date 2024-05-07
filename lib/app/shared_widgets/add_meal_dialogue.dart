import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddMealDialog extends StatelessWidget {
  final Function(String, String) onAddMeal;
  const AddMealDialog({super.key, required this.onAddMeal,});

  @override
  Widget build(BuildContext context) {
    String name = '',calories = '';
    RxBool nameValid=false.obs,calorieValid=false.obs;

    return Obx(() => AlertDialog(
      title: const Text('Add Meal'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              name = value;
              nameValid.value=false;
            },
            decoration: InputDecoration(
                labelText: 'Meal Name',
                errorText: nameValid.isTrue ? "Required":  null,
                labelStyle: const TextStyle(color: Colors.black),
                errorStyle: const TextStyle(color: Colors.red)
            ),
          ),
          TextField(
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              calories = value;
              calorieValid.value=false;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            ],
            decoration: InputDecoration(
                labelText: 'Calories',
                errorText: calorieValid.isTrue ? "Required":  null,
                labelStyle: const TextStyle(color: Colors.black),
                errorStyle: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (name.isEmpty || calories.isEmpty) {
              nameValid.value=name.isEmpty ? true : false;
              calorieValid.value=calories.isEmpty ? true :false;
            } else {
              onAddMeal(name, calories);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    ));
  }
}
