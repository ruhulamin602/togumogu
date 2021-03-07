import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';

import 'package:togumogu/src/bloc/signup_form/my_form_bloc.dart';
import 'package:togumogu/src/repository/authentication_repository.dart';

import 'package:togumogu/src/routes/router.gr.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

import 'home/home.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isEmailLogin = false;
  // TextEditingController _emailController;
  // TextEditingController _phoneController;
  // TextEditingController _passwordController;
  // TextEditingController _confPasswordController;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isEmailLogin = false;
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<MySignUpBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MySignUpBloc>().add(PasswordUnfocused());
      }
    });
    _confirmPasswordFocusNode.addListener(() {
      if (!_confirmPasswordFocusNode.hasFocus) {
        context.read<MySignUpBloc>().add(ConfirmPasswordUnfocused());
      }
    });
  }

  setisEmailLogin(bool val) {
    setState(() {
      _isEmailLogin = val;
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

// This goes to the build method

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;
    var textStyle = TextStyle(fontSize: 20, color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/images/togumogu.png"),
              width: SizeConfig.safeBlockHorizontal * .3,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .02,
            ),
            Container(
              child: Text("Please Signup to continue using our app."),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isEmailLogin,

                      // subtitle: Text("Radio 1 Subtitle"),
                      onChanged: (val) {
                        print(" IsEmail is $val");
                        setisEmailLogin(val);
                      },
                    ),
                    Text("Signup using your email."),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: UsernameInput(
                  focusNode: _emailFocusNode,
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: PasswordInputSignup(
                  focusNode: _passwordFocusNode,
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: ConfirmPasswordInput(
                  focusNode: _confirmPasswordFocusNode,
                )),
            SignUpButton(),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed("/my-home-page");
                      },
                      child: Text('Login'))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: w,
              height: h * .12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        width: w,
                        height: SizeConfig.safeBlockVertical * .07,
                        child: TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/g.png",
                            ))),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: w,
                      height: SizeConfig.safeBlockVertical * .07,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "f",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UsernameInput extends StatelessWidget {
  const UsernameInput({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    print("Log in page");
    return BlocBuilder<MySignUpBloc, MySignUpFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // icon:  Icon(Icons.email),
            labelStyle: Theme.of(context).textTheme.bodyText2,
            hintText: "Enter Your Username Here",
            labelText: 'Username',
            helperText: 'A complete, valid email or Phone number',
            errorText: state.email.invalid
                ? 'Please ensure the email or pohone number entered is valid'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<MySignUpBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordInputSignup extends StatelessWidget {
  const PasswordInputSignup({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySignUpBloc, MySignUpFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusColor: Colors.amber,
            // icon:  Icon(Icons.lock),
            labelStyle: Theme.of(context).textTheme.bodyText1,

            hintText: "Enter Your Password Here",
            helperText: '''Password must not be empty.''',
            helperMaxLines: 2,
            labelText: 'Password',
            errorMaxLines: 2,
            errorText: state.password.invalid
                ? '''Password must be at least 8 characters and contain at least one letter and number'''
                : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context.read<MySignUpBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySignUpBloc, MySignUpFormState>(
      builder: (context, state) {
        print(state.confirmPassword.value);
        return TextFormField(
          initialValue: state.confirmPassword.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusColor: Colors.amber,
            // icon:  Icon(Icons.lock),
            labelStyle: Theme.of(context).textTheme.bodyText1,

            hintText: "Enter Same Password Here",
            helperText: '''Must not be empty.''',
            helperMaxLines: 2,
            labelText: 'Confirm Password',
            errorMaxLines: 2,
            errorText: state.confirmPassword.invalid
                ? '''Password Doesn't Match'''
                : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context
                .read<MySignUpBloc>()
                .add(ConfirmPasswordChanged(confirmPassword: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

class SignUpButton extends StatelessWidget {
  // AppRepository appRepository = AppRepository();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySignUpBloc, MySignUpFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        print(state.password.value.toString());
        return Container(
          decoration: BoxDecoration(
              color: state.status.isValidated
                  ? Colors.amber
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          width: MediaQuery.of(context).size.width * .8,
          height: SizeConfig.safeBlockVertical * .07,
          child: !state.status.isSubmissionInProgress
              ? ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: state.status.isValidated
                      ? () async {
                          try {
                            print("email" + state.email.value);
                            print("password" + state.password.value);
                            print("confirmPassword" +
                                state.confirmPassword.value);

                            await Provider.of<AuthenticationRepository>(context,
                                    listen: false)
                                .signup(
                                    name: state.email.value,
                                    username: state.email.value,
                                    password: state.password.value,
                                    confirm_password:
                                        state.confirmPassword.value,
                                    devicename: "devic_name")
                                .then((val) => val
                                    ? Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                        ModalRoute.withName(
                                            Routes.mainHomeScreen))
                                    : Scaffold.of(context).showBottomSheet(
                                        (context) => Text("Error"),
                                      ));
                          } catch (e) {
                            throw e;
                          }
                          // bool isAuth = Provider.of<AuthenticationRepository>(
                          //         context,
                          //         listen: false)
                          //     .isAuth;
                          // print(isAuth);
                        }
                      : null,
                  child: Text(
                    'Signup',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
