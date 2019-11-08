import 'package:flutter/material.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';

class MorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoreState();
}

class MoreState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('MorePage', style: TextStylesUtils.styleAvenir20CoalGreyW600,),
          )
        ],
      ),
    );
  }
}
