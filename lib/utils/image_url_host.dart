class ImageUrlHost {
  static const String _host =
      'https://tortee-image-upload.s3.ap-southeast-1.amazonaws.com';

  static String getHost() {
    return _host;
  }

  static String getImageUrl(String path) {
    return '$_host/$path';
  }
}
