import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixabay/core/constants/app_colors.dart';
import 'package:pixabay/core/theme/app_theme.dart';
import 'package:pixabay/core/utils/app_utils.dart';
import 'package:pixabay/core/utils/ui_helper.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
    required this.favoriteIds,
    required this.isFavorite,
    required this.onTap,
    this.showDetail = false,
  });

  final ImageEntity image;
  final List<String> favoriteIds;
  final bool isFavorite;
  final Function() onTap;
  final bool showDetail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            width: double.infinity,
            imageUrl: image.previewUrl,
            imageBuilder:
                (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      UIHelper.cornerRadiusMedium,
                    ),
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.black.withValues(alpha: 0.2),
                      width: 2.w,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            fit: BoxFit.cover,
            placeholder:
                (context, url) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          showDetail
              ? Positioned(
                bottom: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        image.user,
                        style: darkTheme.textTheme.headlineSmall,
                      ),
                      Text(
                        AppUtils.formatFileSize(image.imageSize),
                        style: darkTheme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              )
              : SizedBox.shrink(),
          isFavorite
              ? Text(
                "V",
                style: darkTheme.textTheme.displayLarge?.copyWith(
                  color: AppColors.lightGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.sp,
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
