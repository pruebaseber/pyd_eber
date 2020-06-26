import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:pyd_eber/all-exports.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path_provider/path_provider.dart';


class UIEditorImagenes extends StatefulWidget {
  static const String ruta = '/Editor';

  @override
  _UIEditorImagenesState createState() => _UIEditorImagenesState();
}

class _UIEditorImagenesState extends State<UIEditorImagenes> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File _imageFile;




  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(sourcePath: _imageFile.path,
    /*aspectRatio: CropAspectRatio(
        ratioY: 1.0,
        ratioX: 1.0),*/
      compressFormat: ImageCompressFormat.jpg,
      maxHeight: 300,
      maxWidth: 300,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
       // CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
       // CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.square,
      //  CropAspectRatioPreset.ratio7x5,
       // CropAspectRatioPreset.ratio16x9
      ],
      compressQuality: 85,

    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });

  }


  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }


  void _clear() {
    setState(() => _imageFile = null);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                )
              ],
            ),
            Uploader(file: _imageFile,)
          ]
        ],
      ),
    );
  }
}


class Uploader extends StatefulWidget {
  final File file;

  Uploader ({Key key, this.file}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
  FirebaseStorage(storageBucket: 'gs://proyecto-pyd-eber.appspot.com');
  StorageUploadTask _uploadTask;

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.jpg';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount : 0;

            return Column(
              children: [
                if (_uploadTask.isComplete)
                  Text('Tarea Completada'),
                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),
                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),
                LinearProgressIndicator(value: progressPercent,),
                Text('${(progressPercent * 100).toStringAsFixed(2)}%'),
              ],
            );
          });
    }
    else {
      return FlatButton.icon(
        label: Text('Upload to Firebase'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}

