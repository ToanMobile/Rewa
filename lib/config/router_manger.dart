import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rewa/ui/screen/challenge/challenge_page.dart';
import 'package:rewa/ui/screen/home/home_page.dart';
import 'package:rewa/ui/screen/home/tab_navigator.dart';
import 'package:rewa/ui/screen/login/login_page.dart';
import 'package:rewa/ui/screen/more/more_page.dart';
import 'package:rewa/ui/screen/profile/profile_page.dart';
import 'package:rewa/ui/screen/register/register_page.dart';
import 'package:rewa/ui/screen/register/register_success_page.dart';
import 'package:rewa/ui/screen/review/review_page.dart';
import 'package:rewa/ui/screen/welcome/welcome_page.dart';
import 'package:rewa/ui/widget/page_route_anim.dart';

class RouteName {
  static const String welcome = 'welcome';
  static const String home = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String register_success = 'register_success';
  static const String setting = 'setting';
  static const String tab_home = 'tab_home';
  static const String tab_review = 'tab_review';
  static const String tab_challenge = 'tab_challenge';
  static const String tab_profile = 'tab_profile';
  static const String tab_more = 'tab_more';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcome:
        return NoAnimRouteBuilder(WelcomePage());
      case RouteName.login:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.register:
        return NoAnimRouteBuilder(RegisterPage());
      case RouteName.register_success:
        return NoAnimRouteBuilder(RegisterSuccessPage());
      case RouteName.home:
        return NoAnimRouteBuilder(TabNavigator());
      case RouteName.tab_home:
        return NoAnimRouteBuilder(HomePage());
      case RouteName.tab_review:
        return NoAnimRouteBuilder(ReviewPage());
      case RouteName.tab_challenge:
        return NoAnimRouteBuilder(ChallengePage());
      case RouteName.tab_profile:
        return NoAnimRouteBuilder(ProfilePage());
      case RouteName.tab_more:
        return NoAnimRouteBuilder(MorePage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
