import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCacheManager {
  static const key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 20),
      maxNrOfCacheObjects: 2200,
      repo: JsonCacheInfoRepository(databaseName: key),
      // fileSystem: IOFileSystem(key),
      fileService: HttpFileService(),
    ),
  );
}

final networkImageProvider =
    FutureProvider.autoDispose.family<Widget, String>((ref, imageId) async {
  return CachedNetworkImage(
    cacheManager: CustomCacheManager.instance,
    imageUrl: imageId,
    httpHeaders: const {
      "accept": 'application/json',
    },
    placeholder: (context, url) => const Skeleton(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
});

final circularImage =
    FutureProvider.autoDispose.family<Widget, String>((ref, imageId) async {
  return CachedNetworkImage(
    cacheManager: CustomCacheManager.instance,
    imageUrl: imageId,
    fit: BoxFit.contain,
    httpHeaders: const {
      "accept": 'application/json',
    },
    imageBuilder: (context, imageProvider) {
      return Container(
        
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
    placeholder: (context, url) => const Skeleton(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
});

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, this.layer = 1})
      : super(key: key);

  final double? height, width;
  final int layer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04 * layer),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
    );
  }
}
