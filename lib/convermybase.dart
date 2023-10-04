
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ConverttobaseSixtyFour extends StatefulWidget {
  const ConverttobaseSixtyFour({super.key});

  @override
  State<ConverttobaseSixtyFour> createState() => _ConverttobaseSixtyFourState();
}
String base64Image="";


class _ConverttobaseSixtyFourState extends State<ConverttobaseSixtyFour> {
  Future<String> loadImageAsBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    print(response.statusCode);

    if (response.statusCode == 200) {
      final Uint8List uint8List = response.bodyBytes;
      final base64String = base64Encode(uint8List);
      print(base64String);
      return base64String;
    }
    else  if (response.statusCode == 201) {
      final Uint8List uint8List = response.bodyBytes;
      final base64String = base64Encode(uint8List);
      print(base64String);
      return base64String;
    }else {
      throw Exception('Failed to load image');
    }
  }
  void loadImageAndConvert() async {
    final imageUrl = 'https://firebasestorage.googleapis.com/v0/b/gettingdata-db205.appspot.com/o/images%2Fimage257096.png?alt=media&token=528bcc2e-eb22-427a-a351-49db64eed554'; // Replace with your image URL
    try {
      base64Image = await loadImageAsBase64(imageUrl);
      setState(() {}); // Update the UI to display the base64 image
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Image to Base64'),
        ),
        body: Center(
          child: base64Image != null
              ? Image.memory(
            base64Decode(base64Image),
            width: 200,
            height: 200,
          )
              : Text('Image not loaded yet'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: loadImageAndConvert,
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
