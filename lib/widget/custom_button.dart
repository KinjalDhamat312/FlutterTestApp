import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/text_styles.dart';

class CustomButton extends StatefulWidget {
  final double height;
  final double width;
  final String buttonTitle;
  final Function buttonAction;
  final bool isLoading;
  final TextStyle textStyle;
  final Color color;
  final Color borderColor;

  CustomButton(
      {this.height,
      this.width,
      this.buttonTitle,
      this.buttonAction,
      this.isLoading = false,
      this.textStyle,
      this.borderColor,
      this.color});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? buttonHeight,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: RaisedButton(
        padding: EdgeInsets.all(spacingTiny),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: widget.borderColor ?? Colors.transparent, width: 1),
        ),
        color: widget.color ?? colorYellow,
        disabledColor: Colors.grey,
        child: widget.isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: getProgressBar(color: colorBlack, width: 3),
              )
            : FittedBox(
                child: Text(
                  widget.buttonTitle,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: widget.textStyle ??
                      textStylePoppinsMedium(
                        fontSize: fontMedium3,
                        color: Colors.white,
                      ),
                ),
              ),
        onPressed: widget.buttonAction == null
            ? null
            : () {
                setState(() {
                  widget.buttonAction();
                });
              },
      ),
    );
  }

  Widget getProgressBar({Color color, double width}) =>
      CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? colorYellow),
        strokeWidth: width ?? 3,
      );
}
