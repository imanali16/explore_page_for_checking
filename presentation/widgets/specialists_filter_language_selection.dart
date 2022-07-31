import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialistsFilterLanguageSelection extends StatelessWidget {
  final String name;
  final bool isSelected;
  final void Function()? onTap;

  const SpecialistsFilterLanguageSelection({
    Key? key,
    required this.name, required this.isSelected, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lato',
            color: Color(0xff1C1C1C),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            width: 20,
            height: 20,
            duration: const Duration(microseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.transparent,
              border: Border.all(
                width: 3,
                color: Color(0xff1C1C1C),
              ),
            ),
            child: isSelected
                ? SvgPicture.asset('assets/images/check_icon.svg')
                : null,
          ),
        ),
      ],
    );
  }
}
