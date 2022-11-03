class GalleryModel {
  String? status;
  GalleryDataModel? data;

  GalleryModel.fromJson(Map<String, dynamic>? json) {
    status = json!['states'];
    data = GalleryDataModel.fromJson(json['data']);
  }
}

class GalleryDataModel {
  List<String>? images = [];

  GalleryDataModel.fromJson(Map<String, dynamic>? json)
  {
    json!['images'].forEach((element)    {
      images!.add(element);
    });

  }

}
class ImagesModel
{
  ImagesModel.fromJson(Map<String, dynamic>? json)
  {

  }
}

