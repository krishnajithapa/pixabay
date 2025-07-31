import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/favorite/presentation/bloc/add_favorite_bloc.dart';
import 'package:pixabay/shared/widgets/image_card.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageEntity> images;
  final ScrollController? controller;
  final List<String> favoriteIds;
  const ImageGrid({
    super.key,
    required this.images,
    this.controller,
    required this.favoriteIds,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ImageCard(
          image: image,
          favoriteIds: favoriteIds,
          isFavorite: favoriteIds.contains(image.id),
          onTap:
              () => context.read<AddFavoriteBloc>().add(
                AddFavorite(
                  id: image.id,
                  previewUrl: image.previewUrl,
                  fullImageUrl: image.fullImageUrl,
                  imageSize: image.imageSize,
                  user: image.user,
                ),
              ),
        );
      },
    );
  }
}
