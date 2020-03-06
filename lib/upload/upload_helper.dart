import 'dart:async';
import 'dart:html';

import 'package:expenses_management_webapp/upload/file_upload.dart';
import 'package:expenses_management_webapp/upload/upload_state.dart';

class UploadHelper {
  final _controller = StreamController<UploadState>();

  Stream<UploadState> get stream => _controller.stream;

  upload() {
    FileUploadInputElement uploadElement = FileUploadInputElement();

    uploadElement.click();
    uploadElement.onChange.listen((event) {

      List<File> files = uploadElement.files;
      if (files.length > 0) {
        _controller.add(UploadState(started: true));

        File file = files[0];

        FileReader reader = new FileReader();
        reader.onLoadEnd.listen((event) {
          Object result = reader.result;

          String imageFile = result;
          String base64 = imageFile.substring(imageFile.indexOf(",") + 1);

          FileUpload fileUpload = FileUpload(base64);

          _controller.add(UploadState(finished: true, file: fileUpload));
        });
        reader.readAsDataUrl(file);
      }
    });
  }

  dispose() {
    _controller.close();
  }
}