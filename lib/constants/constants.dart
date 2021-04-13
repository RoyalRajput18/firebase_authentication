import 'package:firebase_authentication/screens/register.dart';
import 'package:flutter/material.dart';

class BackArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE5ECF4),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
      child: Icon(
        Icons.arrow_back_ios_outlined,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;

  TitleText({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 35,
        fontFamily: 'Satisfy',
        color: Colors.blue[600],
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  InputTextField({@required this.hintText, this.obscure, this.controller});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[50],
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  Button({@required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class BottomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/b.png'), fit: BoxFit.fill),
      ),
    );
  }
}

class SmallTextUnderButton extends StatefulWidget {
  final String leftSideText;
  final String rightSideText;
  SmallTextUnderButton({
    this.leftSideText,
    this.rightSideText,
  });

  @override
  _SmallTextUnderButtonState createState() => _SmallTextUnderButtonState();
}

class _SmallTextUnderButtonState extends State<SmallTextUnderButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(widget.leftSideText),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ),
            );
          },
          child: Text(
            widget.rightSideText,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.indigo[900],
            ),
          ),
        ),
      ],
    );
  }
}
