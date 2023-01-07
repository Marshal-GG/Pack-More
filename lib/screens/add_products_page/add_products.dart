// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';


// class AddProductPage extends StatefulWidget {
//   const AddProductPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name;
//   String _description;
//   double _price;
//   File _image;
//   bool _isLoading = false;

//   void _selectImage() async {
//   ImagePicker imagePicker = ImagePicker();
//   _image = (await imagePicker.pickImage(source: ImageSource.gallery)) as File;
//   setState(() {});
// }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       setState(() {
//         _isLoading = true;
//       });

//       StorageReference storageReference = FirebaseStorage.instance
//           .ref()
//           .child('products')
//           .child('${DateTime.now()}.jpg');
//       StorageUploadTask uploadTask = storageReference.putFile(_image);
//       await uploadTask.onComplete;
//       String imageUrl = await storageReference.getDownloadURL();

//       DocumentReference documentReference =
//           Firestore.instance.collection('products').document();
//       documentReference.setData({
//         'name': _name,
//         'description': _description,
//         'price': _price,
//         'imageUrl': imageUrl,
//       });

//       setState(() {
//         _isLoading = false;
//       });

//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Product'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Form(
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextFormField(
//                       decoration: const InputDecoration(labelText: 'Name'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _name = value!;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       decoration: const InputDecoration(labelText: 'Description'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a description';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _description = value!;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       decoration: const InputDecoration(labelText: 'Price'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a price';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _price = double.parse(value!);
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     _image == null
//                         ? const SizedBox(
//                             height: 200,
//                             child: Center(
//                               child: Text(
//                                 'No image selected',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                           )
//                         : SizedBox(
//                             height: 200,
//                             child: Image.file(
//                               _image,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: _selectImage,
//                       child: const Text('Select Image'),
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: _submitForm,
//                       child: const Text('Add Product'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
