import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/data/models/object_box_image_model.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/objectbox.g.dart';

@injectable
class FavoriteLocalDataSource {
  final Store store;

  FavoriteLocalDataSource(this.store);

  late final Box<ObjectBoxImageModel> _box = store.box<ObjectBoxImageModel>();

  Future<void> addFavorite(ImageEntity image) async {
    final objectBoxModel = ObjectBoxImageModel.fromEntity(image);
    _box.put(objectBoxModel); // Insert or update
    log(_box.count().toString());
  }

  Future<List<ImageEntity>> getFavorites() async {
    final items = _box.getAll();
    return items.map((e) => e.toEntity()).toList();
  }

  Future<void> removeFavoriteById(String id) async {
    final query = _box.query(ObjectBoxImageModel_.id.equals(id)).build();
    final match = query.findFirst();
    if (match != null) {
      _box.remove(match.obxId);
    }
    query.close();
  }

  Future<bool> isFavorite(String id) async {
    final query = _box.query(ObjectBoxImageModel_.id.equals(id)).build();
    final exists = query.findFirst() != null;
    query.close();
    return exists;
  }
}
