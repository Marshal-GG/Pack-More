import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/size_config.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class OtpFormScreen extends StatefulWidget {
  const OtpFormScreen({Key? key}) : super(key: key);

  @override
  State<OtpFormScreen> createState() => _OtpFormScreenState();
}

class _OtpFormScreenState extends State<OtpFormScreen> {

  String verificationReceivedID = "";
  String countryDial = "+91";

  final _formKey = GlobalKey<FormState>();

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

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildOTPFormField(context),
            SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
            buildSubmitButton(),
          ],
        ));
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Submit".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: kPrimaryLightColor),
      ),
    );
  }

  TextFormField buildOTPFormField(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      decoration: const InputDecoration(
          hintText: "Enter OTP",
          prefixIcon: Padding(
            padding: EdgeInsets.all(kDefaultPaddin),
            child: Icon(Icons.lock),
          )),
      autofocus: false,
      obscureText: false,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        if (value.length == 6) {
          final verificationId = verificationReceivedID;
      final smsOTP = value;
      AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      auth.signInWithCredential(authCreds).catchError((e) {
        Fluttertoast.showToast(msg: e.toString());
      });
          FocusScope.of(context).nextFocus();
        }
      },
      onSaved: (pin) {
        //setup to store value
      },
      validator: (value) {
        if (value!.length != 6) {
          return 'OTP must be 6 digits';
        }
        return null;
      },
    );
  }
}


// class OtpFormScreen extends StatefulWidget {
//   const OtpFormScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<OtpFormScreen> createState() => _OtpFormScreenState();
// }

// class _OtpFormScreenState extends State<OtpFormScreen> {
//   FocusNode? pin1FocusNode;
//   FocusNode? pin2FocusNode;
//   FocusNode? pin3FocusNode;
//   FocusNode? pin4FocusNode;
//   FocusNode? pin5FocusNode;
//   FocusNode? pin6FocusNode;
//   final _formKey = GlobalKey<FormState>();

//   String? pin;

// @override
// void initState() {
//   super.initState();
//   pin1FocusNode = FocusNode();
//   pin2FocusNode = FocusNode();
//   pin3FocusNode = FocusNode();
//   pin4FocusNode = FocusNode();
// }

// @override
// void dispose() {
//   pin1FocusNode?.dispose();
//   pin2FocusNode?.dispose();
//   pin3FocusNode?.dispose();
//   pin4FocusNode?.dispose();
//   super.dispose();
// }

// void nextField({required String value, FocusNode? focusNode}) {
//   if (value.length == 1) {
//     focusNode?.requestFocus();
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               otpField(pin: pin1FocusNode),
//               const Spacer(),
//               otpField(pin: pin2FocusNode),
//               const Spacer(),
//               otpField(pin: pin3FocusNode),
//               const Spacer(),
//               otpField(pin: pin4FocusNode),
//               const Spacer(),
//               otpField(pin: pin5FocusNode),
//               const Spacer(),
//               otpField(pin: pin6FocusNode),
//             ],
//           ),
//           SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
//           buildSubmitButton(),
//         ],
//       ),
//     );
//   }

//   ElevatedButton buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () {},
//       child: Text(
//         "Submit".toUpperCase(),
//         style: const TextStyle(
//             fontWeight: FontWeight.normal, color: kPrimaryLightColor),
//       ),
//     );
//   }

//   SizedBox otpField({FocusNode? pin}) {
//     return SizedBox(
//       width: kDefaultPaddin * 2,
//       height: kDefaultPaddin * 2,
//       child: TextFormField(
//         // decoration: InputDecoration(hintText: "*"),
//         textInputAction: TextInputAction.done,
//         autofocus: true,
//         obscureText: false,
//         keyboardType: TextInputType.number,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//         // style: const TextStyle(fontSize: 13),
//         textAlign: TextAlign.center,
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//         onSaved: (pin) {},
//         //setup to store value
//       ),
//     );
//   }
// }

