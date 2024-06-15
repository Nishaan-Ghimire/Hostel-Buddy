import 'dart:io';

import 'dart:typed_data';

class MediaModel{

  File? image;
  File? video;
  bool? isVideo;
  Uint8List? thumbnail;
  MediaModel({this.image,this.video,this.isVideo,this.thumbnail});


}