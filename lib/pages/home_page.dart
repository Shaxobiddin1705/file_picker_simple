import 'package:file_picker_simple/pages/multiple_file.dart';
import 'package:file_picker_simple/pages/multiple_files_extension_filter.dart';
import 'package:file_picker_simple/pages/single_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('There you can pick file'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.teal,
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const SingleFilePickerPage())),
              child: Text('Take single file', style: textStyle,),
            ),
            const SizedBox(height: 15,),
            MaterialButton(
              color: Colors.teal,
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const MultipleFilePickerPage())),
              child: Text('Take multiple file', style: textStyle,),
            ),
            const SizedBox(height: 15,),
            MaterialButton(
              color: Colors.teal,
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const MultipleFileFiltered())),
              child: Text('Take multiple file with extension filter', style: textStyle,),
            ),
            const SizedBox(height: 15,),
            MaterialButton(
              color: Colors.teal,
              onPressed: (){},
              child: Text('Take single file', style: textStyle,),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
