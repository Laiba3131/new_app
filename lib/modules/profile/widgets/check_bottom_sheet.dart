import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext cont) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                print('Camera');
                Navigator.of(cont).pop(); // Close the dialog
              },
              child: Text('Use Camera'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                print('Upload files');
                Navigator.of(cont).pop();
              },
              child: Text('Upload from files'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                print('Dropbox');
                Navigator.of(cont).pop();
              },
              child: Text('Upload from DropBox'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(cont).pop();
            },
            child:  Text('Cancel', style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.red
            )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Modal'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('Show Dialog'),
          onPressed: () => show(context),
        ),
      ),
    );
  }
}
