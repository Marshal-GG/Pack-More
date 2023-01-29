import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../../../master_components/constants.dart';
import '../../../../main_home_screen/home_screen.dart';
import '../../../../../master_components/size_config.dart';
import '../../../components/already_have_an_account_check.dart';
import '../../otp/otp_screen.dart';

class SignupDetailsForm extends StatefulWidget {
  const SignupDetailsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupDetailsForm> createState() => _SignupDetailsFormState();
}

class _SignupDetailsFormState extends State<SignupDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  String verificationReceivedID = "";
  String countryDial = "+91";

  final List<String?> errors = [];
  String? fullName;
  String? phoneNumber;
  String? dob;
  String? address;

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

  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(), //Full Name
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildPhoneNumberFormField(), //Phone Number
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildDOBFormField(), //DOB
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildAddressFormField(),
          // FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildSignUpButton(context), //Button
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          // Add Code Here

          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }

  ElevatedButton buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final User? currentUser = auth.currentUser;
        String uid = auth.currentUser!.uid.toString();
        verifyNumber();
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          try {
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(currentUser?.uid)
                .update({
              'Name': fullName,
            });
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(currentUser?.uid)
                .collection("Details")
                .doc("Basic Info")
                .set({
              'PhoneNumber': phoneNumber,
              'DOB': dob, //Timestamp.fromDate(DateTime.parse(dob!)),
              'Address': address,
              'uid': uid
            }, SetOptions(merge: true));
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OtpScreen()),
            );
          } on FirebaseAuthException catch (error) {
            Fluttertoast.showToast(
              backgroundColor: kPrimaryColor,
              msg: error.message.toString(),
              gravity: ToastGravity.TOP,
            );
          }

          //go to otp screen
        }
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const HomeScreen();
        //     },
        //   ),
        // );
      },
      child: Text("Sign Up".toUpperCase()),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        // ignore: avoid_returning_null_for_void
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return kAddressNullError;
        }
        return null;
      },
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => address = newValue,
      decoration: const InputDecoration(
        hintText: "Your Address",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.location_city),
        ),
      ),
    );
  }

  DateTimeField buildDOBFormField() {
    return DateTimeField(
      onChanged: (value) {
        if (value != null) {
          setState(() {
            dob = format.format(value);
          });
          return removeError(error: kDOBNullError);
        }

        return;
      },
      validator: (value) {
        if (value != null) {
          return null;
        } else {
          addError(error: kDOBNullError);
          return kDOBNullError;
        }
      },
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      onSaved: (dob) {},
      decoration: const InputDecoration(
        hintText: "Date of Birth",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.event),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: null,
        ),
      ),
      format: format,
      onShowPicker: (context, picker) async {
        final date = showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          builder: (context, picker) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: kPrimaryColor,
                  onPrimary: Colors.white,
                  surface: kPrimaryColor,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: kPrimaryLightColor,
              ),
              child: picker!,
            );
          },
        );
        return date;
      },
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        // ignore: avoid_returning_null_for_void
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return kPhoneNumberNullError;
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: phoneController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      // ignore: avoid_types_as_parameter_names
      onSaved: (newValue) => phoneNumber = newValue,
      decoration: const InputDecoration(
        hintText: "Phone Number",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.call),
        ),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        // ignore: avoid_returning_null_for_void
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return kNameNullError;
        }
        return null;
      },
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => fullName = newValue,
      decoration: const InputDecoration(
        hintText: "Full Name",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  void verifyNumber() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await auth.verifyPhoneNumber(
            phoneNumber: countryDial + phoneController.text,
            verificationCompleted: (PhoneAuthCredential credential) async {
              auth.signInWithCredential(credential).then(
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
