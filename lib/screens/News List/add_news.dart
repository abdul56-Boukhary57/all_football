
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/News/News_item.dart';

class NewNews extends StatefulWidget {
  const NewNews({super.key});

  @override
  _NewNewsState createState() => _NewNewsState();
}

class _NewNewsState extends State {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  var _enteredDesc = '';
  String imageUrl = '';
  XFile? _selectedImage;

  Future<void> _pickImage() async {


      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if(image == null)return;
      setState(() {
        _selectedImage = image;
      });




  }
  void _saveNews() async {
    var uuid1 = Uuid();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();



      // Create a new NewsItem
      final newNewsItem = NewsItem(
        id: uuid1.v4(),
        title: _enteredTitle,
        descr: _enteredDesc,
        imageUrl: _selectedImage!.path, // Use the actual image URL from Firebase
      );


      // Return to the previous screen
      Navigator.of(context).pop(newNewsItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add new News",
          style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  onSaved: (newValue) {
                    _enteredTitle = newValue!;
                  },
                  decoration: const InputDecoration(labelText: "Title"),
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Error';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 200,
                  onSaved: (newValue) {
                    _enteredDesc = newValue!;
                  },
                  decoration: const InputDecoration(labelText: "Description"),
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 1000) {
                      return 'Error';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text(
                        'Select Image',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveNews,
                        child: const Text(
                          'Add News',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Center(
                  child: _selectedImage != null
                      ? Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Image.file(
                            File(_selectedImage!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: const Center(
                            child: Text('No Image Selected'),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
