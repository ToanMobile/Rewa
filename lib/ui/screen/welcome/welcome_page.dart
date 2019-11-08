import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rewa/common/constant.dart';
import 'package:rewa/config/router_manger.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/ui/widget/filled_round_button.dart';
import 'package:rewa/ui/screen/login/widget/login_bg_widget.dart';
import 'package:rewa/utils/assets_utils.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/log_utils.dart';
import 'package:rewa/utils/screen_utils.dart';
import 'package:rewa/utils/sizebox_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';

enum Login { FACEBOOK, GOOGLE }

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomeState();
}

class WelcomeState extends State<WelcomePage> {
  var firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsUtils.pale,
      body: Stack(
        children: <Widget>[
          BackgroundLogin(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildIconWerry(widthScreen, heightScreen),
                buildButtonLogin(context, heightScreen),
                buildLoginSocial(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildIconWerry(double widthScreen, double heightScreen) => Container(
        width: widthScreen,
        padding: EdgeInsets.only(top: heightScreen / 6),
        child: SvgPicture.asset(AssetsUtils.iconWerry),
      );

  Widget buildTextTitleWerry() => Text(S.of(context).appName, style: TextStylesUtils.styleAvenir14WhiteW600);

  Widget buildButtonLogin(BuildContext context, double heightScreen) => Container(
      width: DimensUtils.size300,
      height: heightScreen / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildContainerSignup(context),
          SizeBoxUtils.hGap30,
          buildContainerRegister(context),
        ],
      ));

  Container buildContainerSignup(BuildContext context) => Container(
        width: DimensUtils.size300,
        height: DimensUtils.size50,
        child: FilledRoundButton.withGradient(
          radius: DimensUtils.size10,
          gradientColor: Constant.gradient_WaterMelon_Melon,
          text: Text(
            S.of(context).signIn,
            style: TextStylesUtils.styleAvenir14WhiteW600,
          ),
          cb: () {
            Navigator.pushNamed(context, RouteName.login);
          },
        ),
      );

  Container buildContainerRegister(BuildContext context) => Container(
        width: DimensUtils.size300,
        height: DimensUtils.size50,
        child: FilledRoundButton.withColor(
          radius: DimensUtils.size10,
          pureColor: ColorsUtils.white,
          text: Text(
            S.of(context).signUp,
            style: TextStylesUtils.styleAvenir14MelonW600,
          ),
          cb: () {
            Navigator.pushNamed(context, RouteName.register);
          },
        ),
      );

  Widget buildLoginSocial() => Container(
        width: DimensUtils.size300,
        height: DimensUtils.size100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(S.of(context).orLoginWith, style: TextStylesUtils.styleAvenir14VeryLightW500),
            ),
            Expanded(
              flex: 0,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _handleSignIn(Login.FACEBOOK);
                    },
                    child: SvgPicture.asset(AssetsUtils.iconFacebook, height: DimensUtils.size70),
                  ),
                  InkWell(
                    onTap: () {
                      _handleSignIn(Login.GOOGLE);
                    },
                    child: SvgPicture.asset(AssetsUtils.iconGoogle, height: DimensUtils.size70),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Future<int> _handleSignIn(Login type) async {
    switch (type) {
      case Login.FACEBOOK:
        FacebookLoginResult facebookLoginResult = await _handleFBSignIn();
        final accessToken = facebookLoginResult.accessToken.token;
        if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
          final facebookAuthCred = FacebookAuthProvider.getCredential(accessToken: accessToken);
          final user = await firebaseAuth.signInWithCredential(facebookAuthCred);
          print("User : " + user.user.displayName);
          return 1;
        } else
          return 0;
        break;
      case Login.GOOGLE:
        try {
          GoogleSignInAccount googleSignInAccount = await _handleGoogleSignIn();
          final googleAuth = await googleSignInAccount.authentication;
          final googleAuthCred = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
          final user = await firebaseAuth.signInWithCredential(googleAuthCred);
          print("User : " + user.user.displayName);
          return 1;
        } catch (error) {
          return 0;
        }
    }
    return 0;
  }

  Future<FacebookLoginResult> _handleFBSignIn() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginResult = await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("Cancelled");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
        print("Logged In");
        break;
    }
    return facebookLoginResult;
  }

  Future<GoogleSignInAccount> _handleGoogleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    return googleSignInAccount;
  }
}
