import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MultipleFileFiltered extends StatefulWidget {
  const MultipleFileFiltered({Key? key}) : super(key: key);

  @override
  State<MultipleFileFiltered> createState() => _MultipleFileFilteredState();
}

class _MultipleFileFilteredState extends State<MultipleFileFiltered> {
  List<File> files = [];
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick multiple files'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.teal,
                  onPressed: () async{
                    result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc', 'svg']);
                    if(result != null) {
                      files = result!.paths.map((path) => File(path!)).toList();;
                      setState(() {});
                    }else {
                      log('Please try again');
                    }
                  },
                  child: const Text('Pick file', style: textStyle,),
                ),
                const SizedBox(height: 20,),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: result?.files.length ?? 0,
                  itemBuilder: (context, index) => Text(result!.files[index].name, textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
