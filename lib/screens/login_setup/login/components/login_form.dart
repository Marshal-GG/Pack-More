import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:packmore/screens/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '../../../../core/constants.dart';
import '../../../main_home_screen/home_screen.dart';
import '../../../../core/size_config.dart';
import '../../components/already_have_an_account_check.dart';
import '../../forgot_password/forgot_password.dart';
import '../../signup/email_pass/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? email, password;
  final _auth = FirebaseAuth.instance;

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          Hero(
            tag: "login_btn",
            child: buildLoginButton(),
          ),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin / 2)),
          buildForgotPassword(),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin / 2)),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignupScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  InkResponse buildForgotPassword() {
    return InkResponse(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPassword()),
        );
      },
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ElevatedButton buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        signin(emailController.text, passwordController.text);
      },
      child: Text("Login".toUpperCase()),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: passwordController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        setState(() {
          password = value.trim();
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return kPassNullError;
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return kShortPassError;
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      obscureText: true,
      cursorColor: kPrimaryColor,
      decoration: const InputDecoration(
        hintText: "Password",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      controller: emailController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        setState(() {
          email = value.trim();
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return kInvalidEmailError;
        }
        return null;
      },
      onSaved: (newValue) {
        emailController.text = newValue!;
      },
      decoration: const InputDecoration(
        hintText: "Email Address",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  void signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then(
              (uid) => {
                Fluttertoast.showToast(msg: "LoginSuccessful"),
                Navigator.pushNamed(context, '/widget-tree'),
              },
            );
      } on FirebaseAuthException catch (error) {
        // print(error.message);
        Fluttertoast.showToast(
          msg: error.message.toString(),
          gravity: ToastGravity.TOP,
        );
      }
      // catch (_error_msg) {
      //   print(_error_msg);
      // }
      //   .catchError((e) {
      // Fluttertoast.showToast(msg: e!.msg);
      // },
      // );
    }
  }
}
