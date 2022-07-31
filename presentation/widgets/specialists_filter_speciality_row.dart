import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialistsFilterSpecialityRow extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const SpecialistsFilterSpecialityRow({
    Key? key,
    required this.text, required this.onTap, required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            isSelected ? SvgPicture.asset('assets/images/confirm_icon.svg') : const SizedBox(height: 12, width: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Text(
                text,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
