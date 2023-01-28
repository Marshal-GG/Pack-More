import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../master_components/constants.dart';
import 'package:intl/intl.dart';

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
  static String? _phoneNumber;

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }

  Future<void> _loadPhoneNumber() async {
    //  *****This chunk of Code not working*****
    // final DocumentSnapshot phoneNumberSnapshot = await phoneNumberRef.get();
    // setState(() {
    //   _phoneNumber = phoneNumberSnapshot.data() as String?;
    // });

    //To get data from firestore
    var collection = FirebaseFirestore.instance.collection('Users');
    var docSnapshot = await collection.doc(currentUser?.uid).get();
    Map<String, dynamic> data = docSnapshot.data()!;
    _phoneNumber = data['PhoneNumber'];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: [
          buildSubHeading(),
          buildTimer(),
          const SizedBox(height: kDefaultPaddin),
          buildImageSVG(),
          const SizedBox(height: kDefaultPaddin),
        ],
      ),
    );
  }

  Column buildSubHeading() {
    return Column(
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
      ],
    );
  }

  Row buildImageSVG() {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 8,
          child: SvgPicture.asset("assets/icons/signup.svg"),
        ),
        const Spacer(),
      ],
    );
  }

  Row buildTimer() {
    final formatter = NumberFormat("00", Intl.defaultLocale);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "This code will expire in ",
          textAlign: TextAlign.center,
          style: TextStyle(color: kTextColor),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 300.0, end: 0.00),
          duration: const Duration(minutes: 5),
          builder: (BuildContext context, value, child) => Text(
            // "${value.toStringAsFixed(2)}s",
            "${formatter.format((value / 60).floor())}:${formatter.format((value % 60).floor())} min",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
