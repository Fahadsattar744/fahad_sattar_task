import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealDialog extends StatelessWidget {
  final Function(String, String) onAddMeal;

  const AddMealDialog({
    Key? key,
    required this.onAddMeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    String calories = '';

    return AlertDialog(
      title: Text('Add Meal'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              name = value;
            },
            decoration: InputDecoration(labelText: 'Meal Name'),
          ),
          TextField(
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              calories = value;
            },
            decoration: InputDecoration(labelText: 'Calories'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (name.isEmpty || calories.isEmpty) {
              // Show error message in snack bar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.black,behavior: SnackBarBehavior.floating,
                  content: Text('Please fill in all fields',style: TextStyle(color: Colors.white),),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              // Call onAddMeal only if both fields are not empty
              onAddMeal(name, calories);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
