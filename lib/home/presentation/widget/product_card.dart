import 'package:ecommerce_app/core/provider/image_future.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductCardWidget extends HookConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
  });
  final String imageUrl;
  final String title;
  final String price;
  final double rating;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 193,
      // width: 130,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 210, 210, 210),
              blurRadius: 5.0,
              spreadRadius: 1,
              offset: Offset(3, 6),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 223, 222, 222))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ref.watch(networkImageProvider(imageUrl)).when(
                        data: (d) {
                          return d;
                        },
                        error: (a, aa) {
                          return const SizedBox();
                        },
                        loading: () => const SizedBox()),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title,
              overflow: TextOverflow.ellipsis, style: const TextStyle()),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$$price',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 29, 17, 187),
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
