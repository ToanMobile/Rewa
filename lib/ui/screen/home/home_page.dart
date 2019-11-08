import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/ui/widget/text_input_search.dart';
import 'package:rewa/utils/assets_utils.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/sizebox_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';

enum View { TOP, BOTTOM }

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizeBoxUtils.hGap20,
            buildTextUserName(),
            SizeBoxUtils.hGap10,
            buildTextSearch(),
            SizeBoxUtils.hGap20,
            buildSearchView(),
            buildListSuggest(),
            SizeBoxUtils.hGap20,
            buildCarouselSlider(),
            SizeBoxUtils.hGap20,
            buildTextMenu(),
            SizeBoxUtils.hGap20,
            buildMenu(),
          ],
        ),
      ),
    );
  }

  Widget buildTextUserName() => Container(
        width: MediaQuery.of(context).size.width,
        child: Text(S.of(context).login_username, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir20CoalGreyW600),
      );

  Widget buildTextSearch() => Container(
        width: MediaQuery.of(context).size.width,
        child: Text(S.of(context).home_search, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir14CoalGreyW400),
      );

  Widget buildTextMenu() => Padding(
        padding: EdgeInsets.only(left: DimensUtils.size16),
        child: Text(S.of(context).home_favourite, style: TextStylesUtils.styleAvenir15BlackW600),
      );

  Widget buildTextMenuItem(String textName) => Text(textName, style: TextStylesUtils.styleAvenir12BlackW400);

  Widget buildSearchView() => TextInputSearch(
        validateErrMsg: "",
      );

  Widget buildListSuggest() {
    final titles = ['iPhone XR', 'Samsung Galaxy Note 10', 'Oppo','iPhone XR', 'Samsung Galaxy Note 10', 'Oppo'];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DimensUtils.size16),
      height: DimensUtils.size30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: DimensUtils.size4),
            padding: const EdgeInsets.all(DimensUtils.size8),
            child: Text(titles[index], textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir12CoralW400,),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: ColorsUtils.coral),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          );
        },
      ),
    );
  }

  Widget buildCarouselSlider() => CarouselSlider(
        height: DimensUtils.size180,
        viewportFraction: 1.0,
        items: [Image.asset(AssetsUtils.imageCarousel), Image.asset(AssetsUtils.bgLogin)].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: i,
              );
            },
          );
        }).toList(),
      );

  Widget buildMenu() => Container(
        child: Column(
          children: <Widget>[
            buildSubMenuRow(View.TOP),
            SizeBoxUtils.hGap30,
            buildSubMenuRow(View.BOTTOM),
            SizeBoxUtils.hGap30,
          ],
        ),
      );

  Widget buildSubMenu(String iconPath, String textName) => Expanded(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(iconPath),
            SizeBoxUtils.hGap10,
            buildTextMenuItem(textName),
          ],
        ),
      );

  Widget buildSubMenuRow(View view) {
    if (view == View.TOP) {
      return Row(children: [
        buildSubMenu(AssetsUtils.iconHomeMarket, S.of(context).home_menu_electronic),
        buildSubMenu(AssetsUtils.iconHomeFashion, S.of(context).home_menu_fashion),
        buildSubMenu(AssetsUtils.iconHomeHotel, S.of(context).home_menu_hotel),
      ]);
    } else {
      return Row(children: [
        buildSubMenu(AssetsUtils.iconHomeTickets, S.of(context).home_menu_air_ticket),
        buildSubMenu(AssetsUtils.iconHomeBeautify, S.of(context).home_menu_makeup),
        buildSubMenu(AssetsUtils.iconHomeTechnology, S.of(context).home_menu_technology),
      ]);
    }
  }
}
