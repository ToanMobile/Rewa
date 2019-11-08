import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewa/utils/assets_utils.dart';

class BackgroundLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        AssetsUtils.bgLogin,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
