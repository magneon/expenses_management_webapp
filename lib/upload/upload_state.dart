import 'package:expenses_management_webapp/upload/file_upload.dart';

class UploadState {
  bool started;
  bool finished;
  FileUpload file;

  UploadState({this.started = false, this.finished = false, this.file});

  @override
  String toString() {
    return "Upload Start > $started, Upload Finished > $finished";
  }
}