import 'package:ecommerce_app/home/presentation/widget/category_widget.dart';
import 'package:ecommerce_app/home/presentation/widget/product_card.dart';
import 'package:ecommerce_app/home/provider/provider_home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<String> category = [
  'men"s clothing',
  "women's clothing",
  'jewellry',
  'electonics'
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Shop',style:TextStyle(color: Color.fromARGB(255, 46, 9, 180),fontWeight: FontWeight.bold)),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 30, bottom: 10),
            child: Row(
              children: const [
                Text(
                  "Our Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(category: category[index]);
                }),
          ),
          const SizedBox(height: 10),
          HookConsumer(builder: (context, ref, child) {
            final products = ref.watch(getProductsProvider);
            return products.when(
                data: (data) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 40.0,
                          childAspectRatio: 130 / 193
                          // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                          ),
                      itemBuilder: (BuildContext context, index) {
                        return ProductCardWidget(
                          imageUrl: data[index].image,
                          title: data[index].title,
                          price: data[index].price.toString(),
                          rating: data[index].rating.rate!.toDouble(),
                        );
                      },
                    ),
                  );
                },
                error: (e, stacktree) {
                  return Text(e.toString());
                },
                loading: () => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 300,
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ));
          }),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
