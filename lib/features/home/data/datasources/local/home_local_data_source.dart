import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:pixabay/features/favorite/data/models/object_box_image_model.dart';
import 'package:pixabay/objectbox.g.dart';

@lazySingleton
class HomeLocalDataSource {
  final Store store;
  late final Box<ObjectBoxImageModel> _box;

  HomeLocalDataSource(this.store) {
    _box = store.box<ObjectBoxImageModel>();
  }

  List<ObjectBoxImageModel> getSavedImages() {
    return _box.getAll();
  }
}
