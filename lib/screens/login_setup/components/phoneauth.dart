import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../master_components/constants.dart';
import '../../main_home_screen/home_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationReceivedID = "";
  bool otpCodeVisible = false;
  String countryDial = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Auth"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: "Mobile Number",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(kDefaultPaddin),
                    child: Icon(Icons.phone),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: otpCodeVisible,
              child: TextField(
                controller: otpCodeController,
                decoration: const InputDecoration(hintText: "OTP"),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: ElevatedButton(
                onPressed: () {
                  if (otpCodeVisible) {
                    verifyCode();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  } else {
                    verifyNumber();
                  }
                },
                child: Text(otpCodeVisible ? "Login" : "Verify"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: countryDial + phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          auth
              .signInWithCredential(credential)
              .then((value) => {print("Login Successful")});
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationReceivedID = verificationID;
          otpCodeVisible = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationReceivedID,
        smsCode: otpCodeController.text);
    await auth.signInWithCredential(credential).then(
          (value) =>
              MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
  }
}
