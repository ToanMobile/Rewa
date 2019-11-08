import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/utils/assets_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/sizebox_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';

class RegisterSuccessPage extends StatefulWidget {
  @override
  _RegisterSuccessPageState createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[buildBGRegister(), buildContent()],
      ),
    );
  }

  Widget buildContent() => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          buildIconWerry(),
          SizeBoxUtils.hGap12,
          buildTextTitleRegister(),
          buildTextContentRegister(),
        ]),
      );

  Widget buildIconWerry() => SvgPicture.asset(
        AssetsUtils.iconLoginApproval,
        width: DimensUtils.size100,
        height: DimensUtils.size100,
      );

  Widget buildTextTitleRegister() => Text(S.of(context).register_complete, style: TextStylesUtils.styleAvenir20WhiteW600);

  Widget buildTextContentRegister() => Container(
        padding: EdgeInsets.only(top: DimensUtils.size10, left: DimensUtils.size30, right: DimensUtils.size30),
        child: Text(
          S.of(context).register_content,
          style: TextStylesUtils.styleAvenir12WhiteW400,
          textAlign: TextAlign.center,
        ),
      );

  Widget buildBGRegister() => Image.asset(
        AssetsUtils.bgLoginSusscess,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      );
}
