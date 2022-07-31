import 'package:flutter/material.dart';

class SpecialistsSearchVerticalScreen extends StatelessWidget {
  const SpecialistsSearchVerticalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xffF4E9D7),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 7.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Кого/что для мероприятия Вы искали?',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14.0,
                      color: Color(0xff1C1C1C),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  color: Color(0xff1C1C1C),
                  fontSize: 14.0,
                  fontFamily: 'Lato',
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE5E5E5), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 16.0,
                  ),
                  hintMaxLines: 1,
                  hintText: 'Ведущие/ артисты/ ресторан/ декорации...',
                  hintStyle: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xff1c1c1c).withOpacity(0.5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(
                        0xff7CCDD1,
                      ),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0, bottom: 18.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ранее вы искали',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1c1c1c),
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
