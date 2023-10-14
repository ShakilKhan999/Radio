import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  CustomRadioButton({
    required this.isSelected,
    required this.onChanged,
  });

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isSelected);
      },
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.isSelected ? Colors.white : Colors.grey,
            width: 2.0,
          ),
        ),
        child: widget.isSelected
            ? Icon(Icons.check, size: 16.0, color: Colors.white)
            : null,
      ),
    );
  }
}
