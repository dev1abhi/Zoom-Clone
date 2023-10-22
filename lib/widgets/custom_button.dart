import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class custombutton extends StatelessWidget {
  final String text;
  final Function() onpressed;
  const custombutton({super.key
    , required this.text
    , required this.onpressed

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onpressed,
          child: Text(text,
          style: TextStyle(
            fontSize: 17,
          ),
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(
            double.infinity,  //infinite width
            50
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: buttonColor),
          ),
        ),
      ),
    );
  }
}


