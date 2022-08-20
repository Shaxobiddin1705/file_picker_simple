import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SingleFilePickerPage extends StatefulWidget {
  const SingleFilePickerPage({Key? key}) : super(key: key);

  @override
  State<SingleFilePickerPage> createState() => _SingleFilePickerPageState();
}

class _SingleFilePickerPageState extends State<SingleFilePickerPage> {
  File? file;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick single file'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.teal,
              onPressed: () async{
                result = await FilePicker.platform.pickFiles();
                if(result != null) {
                  file = File(result!.files.single.path!);
                  setState(() {});
                }else {
                  log('Please try again');
                }
              },
              child: const Text('Pick file', style: textStyle,),
            ),
            const SizedBox(height: 20,),

            file != null ? Text(result!.files.single.name) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
