import 'package:pyd_eber/all-exports.dart';

class PyDTextShadow extends StatefulWidget {
  PyDTextShadow({
    @required this.text,
    this.textColor = Colors.black,
    this.shadowColor = Colors.white,
    this.xShadow = 2,
    this.yShadow = 2,
    this.scale = 2,
  });

  String text;
  Color textColor;
  Color shadowColor;
  double xShadow;
  double yShadow;
  double scale;

  @override
  _PyDTextShadowState createState() => _PyDTextShadowState();
}

class _PyDTextShadowState extends State<PyDTextShadow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: widget.xShadow,
          left: widget.yShadow,
          child: Container(
            width: Responsive.anchoItemCatSubCat * .95,
            child: Text(
              ' ' + widget.text,
              textScaleFactor: widget.scale,
              softWrap: true,
              style: TextStyle(
                color: widget.shadowColor,
                fontFamily: 'Angelina',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: Responsive.anchoItemCatSubCat * .95,
          child: Text(
            ' ' + widget.text,
            textScaleFactor: widget.scale,
            softWrap: true,
            style: TextStyle(
              color: widget.textColor,
              fontFamily: 'Angelina',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
