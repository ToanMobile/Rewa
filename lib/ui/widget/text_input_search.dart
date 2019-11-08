import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewa/common/constant.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';

typedef ValidateFunc = bool Function(String);
typedef GetTextCb = void Function(String);

class TextInputSearch extends StatefulWidget {
  final TextEditingController controller;

  final bool isInputValid;
  final String validateErrMsg;

  TextInputSearch({this.validateErrMsg, this.controller, this.isInputValid = false});

  @override
  _TextInputSearchState createState() => _TextInputSearchState();
}

class _TextInputSearchState extends State<TextInputSearch> {
  @override
  Widget build(BuildContext context) {
    if (widget.isInputValid) {
      return _buildTextField();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextField(),
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            widget.validateErrMsg,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DimensUtils.size16),
      height: DimensUtils.size55,
      child: CupertinoTextField(
        controller: widget.controller,
        padding: EdgeInsets.symmetric(horizontal: DimensUtils.size16, vertical: DimensUtils.size16),
        clearButtonMode: OverlayVisibilityMode.editing,
        placeholder: S.of(context).home_keyword,
        suffix: Container(
          margin: EdgeInsets.symmetric(horizontal: DimensUtils.size8, vertical: DimensUtils.size8),
          width: DimensUtils.size40,
          height: DimensUtils.size40,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print('');
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: Constant.gradient_WaterMelon_Melon,
            boxShadow: [BoxShadow(color: Color(0x42ff8258), offset: Offset(0, 7), blurRadius: 14, spreadRadius: 0)],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DimensUtils.size10),
          boxShadow: [BoxShadow(color: ColorsUtils.buttonShadow, offset: Offset(0, 11), blurRadius: DimensUtils.size14, spreadRadius: 0)],
        ),
      ),
    );
  }
}
