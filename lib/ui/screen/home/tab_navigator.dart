import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/ui/screen/challenge/challenge_page.dart';
import 'package:rewa/ui/screen/more/more_page.dart';
import 'package:rewa/ui/screen/profile/profile_page.dart';
import 'package:rewa/ui/screen/review/review_page.dart';
import 'package:rewa/utils/assets_utils.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';
import 'home_page.dart';

List<Widget> pages = <Widget>[HomePage(), ReviewPage(), ChallengePage(), ProfilePage(), MorePage()];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null || DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(DimensUtils.size16), topLeft: Radius.circular(DimensUtils.size16)),
          boxShadow: [
            BoxShadow(color: ColorsUtils.brownishGrey, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DimensUtils.size16),
            topRight: Radius.circular(DimensUtils.size16),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsUtils.iconTabHome),
                activeIcon: SvgPicture.asset(
                  AssetsUtils.iconTabHome,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_home),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsUtils.iconTabReview),
                activeIcon: SvgPicture.asset(
                  AssetsUtils.iconTabReview,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_review),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsUtils.iconTabChallenge),
                activeIcon: SvgPicture.asset(
                  AssetsUtils.iconTabChallenge,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_challenge),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsUtils.iconTabPerson),
                activeIcon: SvgPicture.asset(
                  AssetsUtils.iconTabPerson,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_personal),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsUtils.iconTabMore),
                activeIcon: SvgPicture.asset(
                  AssetsUtils.iconTabMore,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_more),
              ),
            ],
            currentIndex: _selectedIndex,
            fixedColor: ColorsUtils.watermelon,
            unselectedFontSize: DimensUtils.size12,
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        ),
      ),
    );
  }
}
