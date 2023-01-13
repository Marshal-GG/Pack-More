import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:packmore/screens/login_setup/signup/otp/components/opt_screen_top_image.dart';
import 'package:packmore/screens/login_setup/signup/otp/components/verify_phone_and_otp.dart';
import 'package:packmore/screens/login_setup/welcome/welcome_screen.dart';
import '../../../../../master_components/constants.dart';
import '../../../../../master_components/size_config.dart';
import '../../../../bottom_navigation_bar/body.dart';
import '../../../../home_screen_details/components/body.dart';
import '../../../../main_home_screen/components/categories.dart';
import '../../../../main_home_screen/home_screen.dart';

final currentUser = FirebaseAuth.instance.currentUser;
final DocumentReference phoneNumberRef =
    FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid);


class OtpFormScreen extends StatefulWidget {
  const OtpFormScreen({Key? key}) : super(key: key);

  @override
  State<OtpFormScreen> createState() => _OtpFormScreenState();
}

class _OtpFormScreenState extends State<OtpFormScreen> {
  static String? _phoneNumber;
  String verificationReceivedID = "";
  String countryDial = "+91";

  final _otpController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }
   Future<void> _loadPhoneNumber() async {
     var collection = FirebaseFirestore.instance.collection('Users');
    var docSnapshot = await collection.doc(currentUser?.uid).get();
    Map<String, dynamic> data = docSnapshot.data()!;
    _phoneNumber = data['PhoneNumber'];
  }
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
// ElevatedButton buildSubmitButton() {
//     return ElevatedButton(
//         onPressed: () async {
//             if (_formKey.currentState!.validate()) {
//                 final User? currentUser = _auth.currentUser;
//                 String enteredOTP = _otpController.text;
//                 try {
//                     AuthCredential credential = PhoneAuthProvider.credential(
//                         verificationId: verificationReceivedID,
//                         smsCode: enteredOTP,
//                     );
//                     await currentUser?.linkWithCredential(credential);
//                     // OTP verification successful, navigate to home screen
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomeScreen(),
//                         ),
//                     );
//                 } on FirebaseAuthException catch (error) {
//                     Fluttertoast.showToast(
//                         msg: error.message.toString(),
//                         gravity: ToastGravity.TOP,
//                     );
//                 }
//             }
//         },
//         child: Text(
//             "Submit".toUpperCase(),
//             style: const TextStyle(
//                 fontWeight: FontWeight.normal, color: kPrimaryLightColor),
//         ),
//     );
// }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton( 
      onPressed: () async {
    final User? currentUser = _auth.currentUser;
    String enteredOTP = _otpController.text;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationReceivedID,
        smsCode: enteredOTP,
      );
      await currentUser?.linkWithCredential(credential);
      // OTP verification successful, navigate to home screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
          msg: error.message.toString(),
          gravity: ToastGravity.TOP,
        );
      }
},
       child: Text(
        "Submit".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: kPrimaryLightColor),
      ),
    );
  }

  // void _onButtonPressed() {
  //   setState(() {
      
  //   });
  // }

  TextFormField buildOTPFormField(BuildContext context) {
    return TextFormField(
       controller: _otpController,
      validator: (value) {
        if (value != verificationReceivedID) {
          return 'Invalid OTP';
        }
        return null;
      },
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
          FocusScope.of(context).nextFocus();
        }
      },
      onSaved: (pin) {
        //setup to store value
      },
    );
  }
  void verifyNumber() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _auth.verifyPhoneNumber(
            phoneNumber: countryDial + _phoneNumber.toString(),
            verificationCompleted: (PhoneAuthCredential credential) async {
              _auth.signInWithCredential(credential).then(
                    (value) => Fluttertoast.showToast(msg: "Login Successful"),
                  );
            },
            verificationFailed: (FirebaseAuthException exception) {
              Fluttertoast.showToast(
                msg: exception.message.toString(),
                gravity: ToastGravity.TOP,
              );
            },
            codeSent: (String verificationID, int? resendToken) {
              verificationReceivedID = verificationID;
              setState(() {});
            },
            codeAutoRetrievalTimeout: (String verificationID) {});
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
          msg: error.message.toString(),
          gravity: ToastGravity.TOP,
        );
      }
    }
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

