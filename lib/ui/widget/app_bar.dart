import 'package:flutter/material.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';

enum IconType { BACK, CLOSE }

class AppBarIcon extends StatelessWidget {
  final IconType icon;
  final String rightTitle;
  final bool isOnlyIcon;
  final Color color;

  AppBarIcon.back({this.rightTitle = '', this.isOnlyIcon = false, this.color = ColorsUtils.pale})
      : this.icon = IconType.BACK;

  AppBarIcon.close({this.rightTitle = '', this.isOnlyIcon = false, this.color = ColorsUtils.pale})
      : this.icon = IconType.CLOSE;

  @override
  Widget build(BuildContext context) {
    if (this.icon == IconType.BACK) {
      if (this.isOnlyIcon) {
        return buildIconButtonBack(context);
      }
      if (this.rightTitle != '') {
        return buildAppBarBackTitle(context, this.rightTitle);
      } else {
        return buildAppBarBack(context);
      }
    }
    if (this.isOnlyIcon) {
      return buildIconButtonClose(context);
    }
    if (this.rightTitle != '') {
      return buildAppBarCloseTitle(context, this.rightTitle);
    } else {
      return buildAppBarClose(context);
    }
  }

  Widget buildIconButtonBack(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.keyboard_backspace,
        color: ColorsUtils.black,
        size: DimensUtils.size30,
      ),
    );
  }

  Widget buildIconButtonClose(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.close,
        color: ColorsUtils.black,
        size: DimensUtils.size30,
      ),
    );
  }

  AppBar buildAppBarBack(BuildContext context) {
    return AppBar(
      leading: buildIconButtonBack(context),
      backgroundColor: this.color,
      elevation: 0.0,
    );
  }

  AppBar buildAppBarBackTitle(BuildContext context, String title) {
    return AppBar(
      leading: buildIconButtonBack(context),
      backgroundColor: this.color,
      elevation: 0.0,
      title: buildAlignAppBar(title),
    );
  }

  AppBar buildAppBarClose(BuildContext context) {
    return AppBar(
      leading: buildIconButtonClose(context),
      backgroundColor: this.color,
      elevation: 0.0,
    );
  }

  AppBar buildAppBarCloseTitle(BuildContext context, String title) {
    return AppBar(
      leading: buildIconButtonClose(context),
      backgroundColor: this.color,
      elevation: 0.0,
      title: buildAlignAppBar(title),
    );
  }

  Align buildAlignAppBar(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(title, style: TextStylesUtils.styleAvenir14WhiteW600),
    );
  }
}
