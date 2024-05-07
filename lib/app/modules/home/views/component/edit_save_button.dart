import 'package:flutter/material.dart';
class EditSaveButton extends StatelessWidget {
  final Function() onTap;
  final Color? clr;
  final String title;
  const EditSaveButton({super.key,required this.onTap,this.clr=Colors.black,required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: clr!),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: Text(
            title,
            style: TextStyle(fontSize: 10, color: clr),
          ),
        ),
      ),
    );
  }
}
