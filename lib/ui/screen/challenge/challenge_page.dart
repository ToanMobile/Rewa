import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/utils/assets_utils.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/sizebox_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';

class ChallengePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChallengeState();
}

class ChallengeState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: DimensUtils.size16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTextChallenge(),
            SizeBoxUtils.hGap10,
            buildTextContent(),
            SizeBoxUtils.hGap20,
            buildLayoutTitleChallenge(),
            SizeBoxUtils.hGap20,
            buildTextTitleChallenge(),
            SizeBoxUtils.hGap20,
            buildListChallengeNow(),
            SizeBoxUtils.hGap20,
            buildTextTitleListChallenge(),
            buildListChallenge(),
          ],
        ),
      ),
    );
  }

  Widget buildTextChallenge() => Container(
    alignment: Alignment.bottomLeft,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.1,
    child: Text(S.of(context).tab_challenge, style: TextStylesUtils.styleAvenir20CoalGreyW600),
  );

  Widget buildTextContent() => Text(S.of(context).challenge_content, style: TextStylesUtils.styleAvenir14CoalGreyW400);

  Widget buildTextTitleChallenge() => Text(S.of(context).challenge_run, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir15BlackW600);

  Widget buildTextTitleListChallenge() =>
      Text(S.of(context).challenge_list, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir15BlackW600);

  Widget buildLayoutTitleChallenge() => Container(
        child: Row(
          children: <Widget>[
            Text(S.of(context).challenge_now, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir20CoalGreyW600),
            SizeBoxUtils.wGap60,
            Text(S.of(context).challenge_before, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir20VeryLightPinkThreeW600)
          ],
        ),
      );

  Widget buildListChallengeNow() {
    final titles = ['iPhone XR', 'Samsung Galaxy Note 10', 'Oppo', 'iPhone XR', 'Samsung Galaxy Note 10', 'Oppo'];
    return Container(
      height: DimensUtils.size140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
              width: DimensUtils.size300,
              height: DimensUtils.size140,
              margin: EdgeInsets.only(right: DimensUtils.size16),
              padding: EdgeInsets.symmetric(vertical: DimensUtils.size8, horizontal: DimensUtils.size8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(DimensUtils.size8),
                boxShadow: [BoxShadow(color: Color(0x1e000000), offset: Offset(0, 11), blurRadius: 36, spreadRadius: 0)],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        AssetsUtils.imagePercent,
                        width: DimensUtils.size80,
                        height: DimensUtils.size80,
                      ),
                      SizeBoxUtils.wGap8,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Challenge: Jugglenaut Basic', style: TextStylesUtils.styleAvenir12BlackW600),
                            Text('What sets successful people apart from the pack? Is it luck, money, good luck and/or…',
                                style: TextStylesUtils.styleAvenir9BrownGreyTwoW400),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizeBoxUtils.hGap10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizeBoxUtils.wGap8,
                      SvgPicture.asset(AssetsUtils.iconChallengeClock),
                      SizeBoxUtils.wGap8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(S.of(context).challenge_time_left, style: TextStylesUtils.styleAvenir9DarkW600),
                          Text('30 days', style: TextStylesUtils.styleAvenir9BrownGreyTwoW400)
                        ],
                      ),
                      SizeBoxUtils.wGap60,
                      SvgPicture.asset(AssetsUtils.iconChallengeRewards),
                      SizeBoxUtils.wGap8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(S.of(context).challenge_rewards_left, style: TextStylesUtils.styleAvenir9DarkW600),
                          Text('1249', style: TextStylesUtils.styleAvenir9BrownGreyTwoW400),
                        ],
                      )
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget buildListChallenge() {
    final titles = ['iPhone XR', 'Samsung Galaxy Note 10', 'Oppo', 'iPhone XR', 'Samsung Galaxy Note 10', 'Oppo', 'Oppo', 'Oppo'];
    return Container(
      height: DimensUtils.size350,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            height: DimensUtils.size120,
            margin: EdgeInsets.only(bottom: DimensUtils.size16, right: DimensUtils.size16),
            padding: EdgeInsets.symmetric(vertical: DimensUtils.size8, horizontal: DimensUtils.size8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DimensUtils.size8),
              boxShadow: [BoxShadow(color: Color(0x1e000000), offset: Offset(0, 11), blurRadius: 36, spreadRadius: 0)],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AssetsUtils.imageChallenge2,
                    width: DimensUtils.size120,
                    height: DimensUtils.size100,
                    fit: BoxFit.fill,
                  ),
                ),
                SizeBoxUtils.wGap8,
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Refer a friend', style: TextStylesUtils.styleAvenir12BlackW600),
                      SizeBoxUtils.hGap8,
                      Text('What sets successful people apart from the pack? Is it luck, money, g…',
                          style: TextStylesUtils.styleAvenir9BrownGreyTwoW400),
                      SizeBoxUtils.hGap20,
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(AssetsUtils.iconChallengeRewards),
                          SizeBoxUtils.wGap8,
                          Text('+1,000 Token', style: TextStylesUtils.styleAvenir9BrownGreyTwoW400),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
