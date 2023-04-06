import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/core/provider/image_future.dart';
import 'package:ecommerce_app/home/domain/products_model.dart';
import 'package:ecommerce_app/home/presentation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProductDetailsPage extends HookConsumerWidget {
  const ProductDetailsPage(
      this.imageUrl, this.title, this.desc, this.price, this.type,
      {super.key});
  final String imageUrl;
  final String title;
  final String desc;
  final String price;
  final String type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: ref.watch(networkImageProvider(imageUrl)).when(
                        data: (d) {
                          return d;
                        },
                        error: (a, aa) {
                          return const SizedBox();
                        },
                        loading: () => const SizedBox()),
                  ),
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 240, 240, 240),
                          border: Border.all(
                              color: const Color.fromARGB(255, 220, 220, 220)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.arrow_back_ios, size: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      desc,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CupertinoButton(
                color: Colors.black,
                child: const Text('Add to cart'),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
