import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../master_components/constants.dart';

final currentUser = FirebaseAuth.instance.currentUser;
final DocumentReference phoneNumberRef =
    FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid);

class OtpScreenTopImage extends StatefulWidget {
  const OtpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpScreenTopImage> createState() => _OtpScreenTopImageState();
}

class _OtpScreenTopImageState extends State<OtpScreenTopImage> {
  Object? _phoneNumber;

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }

  Future<void> _loadPhoneNumber() async {
    final DocumentSnapshot phoneNumberSnapshot = await phoneNumberRef.get();
    setState(() {
      _phoneNumber = phoneNumberSnapshot.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "OTP Verification",
            style: headingStyle,
          ),
          Text(
            "We sent your code to +91 ${_phoneNumber.toString()}",
            textAlign: TextAlign.center,
            style: const TextStyle(color: kTextColor),
          ),
          buildTimer(),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: SvgPicture.asset("assets/icons/signup.svg"),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: kDefaultPaddin),
        ],
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "This code will expire in ",
          textAlign: TextAlign.center,
          style: TextStyle(color: kTextColor),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.00),
          duration: const Duration(seconds: 60),
          builder: (BuildContext context, value, child) => Text(
            "${value}s",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
