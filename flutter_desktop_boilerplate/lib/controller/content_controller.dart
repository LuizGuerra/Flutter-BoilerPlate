import '../model/entity/content.dart';
import '../model/network/content_model.dart';

class ContentController {
  void Function(List<Content>)? onReceive;
  final ContentModel model = ContentModel();

  ContentController({this.onReceive}) {
    getNewContent();
  }

  List<Content> getContent() {
    return model.getContent();
  }

  Future<List<Content>> getNewContent() async {
    await model.updateContent();
    if (onReceive != null) {
      onReceive!(model.getContent());
    }
    return model.getContent();
  }
}