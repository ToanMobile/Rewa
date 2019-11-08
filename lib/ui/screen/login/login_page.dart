import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rewa/common/constant.dart';
import 'package:rewa/config/router_manger.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/provider/provider_widget.dart';
import 'package:rewa/ui/screen/login/widget/login_bg_widget.dart';
import 'package:rewa/ui/screen/login/widget/signup_widget.dart';
import 'package:rewa/ui/widget/app_bar.dart';
import 'package:rewa/ui/widget/button_progress_indicator.dart';
import 'package:rewa/ui/widget/filled_round_button.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/sizebox_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';
import 'package:rewa/viewmodel/login_model.dart';
import 'widget/login_field_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pwdFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'tranminh1236@gmail.com';
    _passwordController.text = 'soluuhuong1236';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsUtils.pale,
      appBar: AppBarIcon.back().build(context),
      body: Stack(
        children: <Widget>[
          BackgroundLogin(),
          ProviderWidget<LoginModel>(
            model: LoginModel(),
            onModelReady: (model) {
              //_nameController.text = model.getLogin().toString();
            },
            builder: (context, model, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(DimensUtils.size40),
                child: Form(
                  key: _formKey,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                    buildTextTitleLogin(),
                    SizeBoxUtils.hGap10,
                    SingUpWidget(_nameController),
                    SizeBoxUtils.hGap40,
                    buildTextUserName(),
                    SizeBoxUtils.hGap10,
                    LoginTextField(
                      label: S.of(context).login_username,
                      icon: Icons.person,
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) {
                        FocusScope.of(context).requestFocus(_pwdFocus);
                      },
                    ),
                    SizeBoxUtils.hGap30,
                    buildTextPassword(),
                    SizeBoxUtils.hGap10,
                    LoginTextField(
                      controller: _passwordController,
                      label: S.of(context).login_password,
                      icon: Icons.vpn_key,
                      obscureText: true,
                      focusNode: _pwdFocus,
                      textInputAction: TextInputAction.done,
                    ),
                    SizeBoxUtils.hGap30,
                    LoginButton(_formKey, _nameController, _passwordController)
                  ]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextTitleLogin() => Text(S.of(context).signIn, style: TextStylesUtils.styleAvenir20CoalGreyW600);

  Widget buildTextUserName() => Text(S.of(context).login_username, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextPassword() => Text(S.of(context).login_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);
}

class LoginButton extends StatelessWidget {
  final nameController;
  final passwordController;
  final _formKey;

  LoginButton(this._formKey, this.nameController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginModel>(context);
    Widget child = model.busy
        ? Container(
            height: DimensUtils.size50,
            child: Center(
              child: ButtonProgressIndicator(),
            ),
          )
        : Container(
            height: DimensUtils.size50,
            child: Center(
              child: Text(
                S.of(context).signIn,
                style: TextStylesUtils.styleAvenir14WhiteW600,
              ),
            ),
          );
    return FilledRoundButton.withGradient(
        radius: DimensUtils.size10,
        gradientColor: Constant.gradient_WaterMelon_Melon,
        child: child,
        cb: () {
          //var formState = Form.of(context);
          if (_formKey.currentState.validate()) {
            model.login(nameController.text, passwordController.text).then((value) {
              if (value) {
                Navigator.pushNamed(context, RouteName.home);
              } else {
                model.showErrorMessage(context);
              }
            });
          }
        });
  }
}
