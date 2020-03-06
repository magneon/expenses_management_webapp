import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:expenses_management_webapp/upload/upload_helper.dart';
import 'package:expenses_management_webapp/upload/upload_state.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  StreamSubscription<UploadState> subscription;

  UploadHelper uploadHelper = UploadHelper();

  Uint8List photo;
  bool showProgress = false;

  @override
  void initState() {
    super.initState();

    subscription = uploadHelper.stream.listen((UploadState state) {
      _setUploadState(state);
    });
  }

  _setUploadState(UploadState state) {
    setState(() {
      if (state.started) {
        showProgress = true;
      } else if (state.finished) {
        showProgress = false;
        photo = base64Decode(state.file.base64);
      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: RaisedButton(
                    child: Text("Upload"),
                    onPressed: () {
                      uploadHelper.upload();
                    },
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 120, maxWidth: 500, minHeight: 120, maxHeight: 500),
                    child: Container(
                      child: 
                        photo == null || showProgress 
                          ? showProgress 
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                              : Icon(Icons.image)
                          : Column(
                            children: <Widget>[
                              Image.memory(photo),
                              //Text(url)
                            ],
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),      
    );
  }
}