import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:togumogu/src/bloc/authentication/authentication_bloc.dart';
import 'package:togumogu/src/bloc/form/my_form_bloc.dart';
import 'package:formz/formz.dart';
// import 'package:togumogu/src/bloc/login/login_bloc.dart';

import 'package:togumogu/src/repository/authentication_repository.dart';
import 'package:togumogu/src/routes/router.gr.dart';
import 'package:togumogu/src/screens/login/login.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

import 'home/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isLoading = false;

  // TextEditingController _emailController;
  // TextEditingController _passwordController;
  // TextEditingController _phoneController;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _rememberMe = false;

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(PasswordUnfocused());
      }
    });
    super.initState();
  }

  setRememberMe(bool val) {
    setState(() {
      _rememberMe = val;
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
// This goes to the build method

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;
    var textStyle = TextStyle(fontSize: 20, color: Colors.white);
    return SingleChildScrollView(
      child: Container(
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
              child: Text("Please Login to continue using our app."),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .09,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            //   child: RadioListTile(
            //     contentPadding: EdgeInsets.symmetric(horizontal: 30),
            //     value: 1,
            //     groupValue: selectedRadioTile,
            //     title: Text("Signup using your email."),
            //     // subtitle: Text("Radio 1 Subtitle"),
            //     onChanged: (val) {
            //       print("Radio Tile pressed $val");
            //       setSelectedRadioTile(val);
            //     },
            //   ),
            // ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Username(
                focusNode: _emailFocusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: PasswordInput(
                focusNode: _passwordFocusNode,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            //   child: TextField(
            //       decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     hintText: "Confirm Password",
            //     labelText: "Confirm Password",
            //     labelStyle: TextStyle(color: Colors.black87),
            //     focusedBorder:
            //         OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //   )),
            // ),
            Container(
                width: w,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (val) {
                                print(" Remember me is $val");
                                setRememberMe(val);
                              },
                            ),
                            Text("Remember me"),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: TextButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushReplacementNamed(Routes.signUpScreen);
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.black54),
                              )),
                        )),
                  ],
                )),

            SubmitButton(),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don'\t have any account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.signUpScreen);
                      },
                      child: Text('Sign Up'))
                ],
              ),
            ),
            SizedBox(
              height: h * .05,
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
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: w,
                      height: SizeConfig.safeBlockVertical * .07,
                      child: TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          "assets/g.png",
                        ),
                      ),
                    ),
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

// class LoginButton extends StatelessWidget {
//   const LoginButton({
//     Key key,
//     @required this.w,
//   }) : super(key: key);

//   final double w;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.green, borderRadius: BorderRadius.circular(10)),
//       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
//       width: w,
//       height: SizeConfig.safeBlockVertical * .07,
//       child: TextButton(
//         onPressed: () {
//           Navigator.pushNamedAndRemoveUntil(context, Routes.myHomePage,
//               ModalRoute.withName(Routes.myHomePage));
//         },
//         child: Text(
//           "Login",
//           style: TextStyle(
//               fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
//         ),
//       ),
//     );
//   }
// }

// class EmailInput extends StatelessWidget {
//   const EmailInput({
//     Key key,
//     this.controller,
//   }) : super(key: key);
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         hintText: "Phone Number",
//         labelText: "Phone Number",
//         labelStyle: TextStyle(color: Colors.black87),
//         focusedBorder:
//             OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     );
//   }
// }

// class PassWordInput extends StatelessWidget {
//   const PassWordInput({
//     Key key,
//     this.controller,
//   }) : super(key: key);
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: true,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         hintText: "Password",
//         labelText: "Password",
//         labelStyle: TextStyle(color: Colors.black87),
//         focusedBorder:
//             OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     );
//   }
// }

class Username extends StatelessWidget {
  const Username({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    print("Log in page");
    return BlocBuilder<MyFormBloc, MyFormState>(
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
            context.read<MyFormBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
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
            context.read<MyFormBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  // AppRepository appRepository = AppRepository();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
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
                          context.read<MyFormBloc>().add(FormSubmitted());
                          try {
                            await Provider.of<AuthenticationRepository>(context,
                                    listen: false)
                                .logIn(
                                    username: state.email.value,
                                    password: state.password.value,
                                    devicename: "devic_name")
                                .then((val) => val
                                    ? Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                        ModalRoute.withName(Routes.myHomePage))
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
                    'Login',
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
