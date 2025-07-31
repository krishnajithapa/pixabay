import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/home/presentation/bloc/home_bloc.dart';
import 'package:pixabay/shared/widgets/image_card.dart';

class HomeImageGrid extends StatelessWidget {
  final List<ImageEntity> images;
  final List<String> favoriteIds;
  const HomeImageGrid({
    super.key,
    required this.images,
    required this.favoriteIds,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ImageCard(
          image: image,
          showDetail: true,
          favoriteIds: favoriteIds,
          isFavorite: favoriteIds.contains(image.id),
          onTap: () => buildDialog(context, context.read<HomeBloc>(), image),
        );
      },
    );
  }

  buildDialog(BuildContext context, HomeBloc bloc, ImageEntity image) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Add to Favorites"),
          content: Text(
            "Do you want to remove this image from your favorites?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                bloc.add(RemoveFavoriteImage(image.id));
              },
              child: Text("Remove"),
            ),
          ],
        );
      },
    );
  }
}
