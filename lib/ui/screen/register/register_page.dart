import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rewa/common/constant.dart';
import 'package:rewa/config/router_manger.dart';
import 'package:rewa/generated/i18n.dart';
import 'package:rewa/provider/provider_widget.dart';
import 'package:rewa/ui/screen/login/widget/login_bg_widget.dart';
import 'package:rewa/ui/screen/login/widget/login_field_widget.dart';
import 'package:rewa/ui/screen/register/widget/signin_widget.dart';
import 'package:rewa/ui/widget/app_bar.dart';
import 'package:rewa/ui/widget/button_progress_indicator.dart';
import 'package:rewa/ui/widget/filled_round_button.dart';
import 'package:rewa/utils/colors_utils.dart';
import 'package:rewa/utils/dimens_utils.dart';
import 'package:rewa/utils/sizebox_utils.dart';
import 'package:rewa/utils/text_styles_utils.dart';
import 'package:rewa/viewmodel/register_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwdFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsUtils.pale,
      appBar: AppBarIcon.back().build(context),
      body: Stack(
        children: <Widget>[
          BackgroundLogin(),
          ProviderWidget<RegisterModel>(
            model: RegisterModel(),
            onModelReady: (model) {
              //_nameController.text = model.getLogin().toString();
            },
            builder: (context, model, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(DimensUtils.size40),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  buildTextTitleLogin(),
                  SizeBoxUtils.hGap10,
                  SingInWidget(_nameController),
                  SizeBoxUtils.hGap10,
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
                  SizeBoxUtils.hGap10,
                  buildTextPassword(),
                  SizeBoxUtils.hGap10,
                  LoginTextField(
                    controller: _emailController,
                    label: S.of(context).login_password,
                    icon: Icons.vpn_key,
                    obscureText: true,
                    focusNode: _pwdFocus,
                    textInputAction: TextInputAction.done,
                  ),
                  SizeBoxUtils.hGap10,
                  buildTextConfirmPassword(),
                  SizeBoxUtils.hGap10,
                  LoginTextField(
                    controller: _passwordController,
                    label: S.of(context).login_confirm_password,
                    icon: Icons.vpn_key,
                    obscureText: true,
                    focusNode: _pwdFocus,
                    textInputAction: TextInputAction.done,
                  ),
                  SizeBoxUtils.hGap40,
                  RegisterButton(_nameController, _emailController, _passwordController)
                ]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextTitleLogin() => Text(S.of(context).signUp, style: TextStylesUtils.styleAvenir20CoalGreyW600);

  Widget buildTextUserName() => Text(S.of(context).login_username, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextPassword() => Text(S.of(context).login_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextConfirmPassword() => Text(S.of(context).login_confirm_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);
}

class RegisterButton extends StatelessWidget {
  final nameController;
  final passwordController;
  final emailController;

  RegisterButton(this.nameController, this.emailController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<RegisterModel>(context);
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
                S.of(context).signUp,
                style: TextStylesUtils.styleAvenir14WhiteW600,
              ),
            ),
          );
    return FilledRoundButton.withGradient(
      radius: DimensUtils.size10,
      gradientColor: Constant.gradient_WaterMelon_Melon,
      child: child,
      cb: () {
        var formState = Form.of(context);
        if (formState.validate()) {
          model.register(nameController.text, emailController.text, passwordController.text).then((value) {
            if (value) {
              Navigator.pushNamed(context, RouteName.register_success);
            } else {
              model.showErrorMessage(context);
            }
          });
        }
      },
    );
  }
}
