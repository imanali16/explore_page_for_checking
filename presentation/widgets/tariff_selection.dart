import 'package:flutter/material.dart';

class TariffSelection extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;

  const TariffSelection({
    Key? key,
    required this.text, required this.isSelected, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isSelected
              ? Color(0xffFFC45D)
              : Color(0xff1C1C1C).withOpacity(0.3),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14.0, height: 1),
          ),
        ),
      ),
    );
  }
}
