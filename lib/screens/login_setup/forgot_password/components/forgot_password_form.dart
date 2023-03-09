import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  String? email;
  final _auth = FirebaseAuth.instance;

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
            buildPasswordResetFormField(context),
            SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
            buildSubmitButton(),
          ],
        ));
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        resetpassword(emailController.text);
      },
      child: Text(
        "Submit".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: kPrimaryLightColor),
      ),
    );
  }

  TextFormField buildPasswordResetFormField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
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
        hintText: "Your Email",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  void resetpassword(String email) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.sendPasswordResetEmail(email: email).then(
              (uid) => Fluttertoast.showToast(msg: "Email Sent"),
            );
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
          msg: error.message.toString(),
          gravity: ToastGravity.TOP,
        );
      }
    }
  }
}
