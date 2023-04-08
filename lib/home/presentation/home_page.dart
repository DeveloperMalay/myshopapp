import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/core/router/router.gr.dart';
import 'package:ecommerce_app/home/presentation/widget/category_widget.dart';
import 'package:ecommerce_app/home/presentation/widget/product_card.dart';
import 'package:ecommerce_app/home/provider/provider_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



@RoutePage()
class HomePage extends HookConsumerWidget  {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final clicked = useState<List<String>>([]);
    final clicked = useState<int>(-1);
    final selectedcategory = useState<String>('all');
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text('My Shop',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(const CartRoute());
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          clicked.value = -1;
          ref.invalidate(getProductsProvider);
          
        },
        child: SingleChildScrollView(
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
            HookConsumer(builder: (context, ref, child) {
              final category = ref.watch(getCategoryProvider);
      
              return category.when(
                  data: (data) {
                    return SizedBox(
                      height: 30,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                clicked.value = index;
                                selectedcategory.value = data[index];
                              },
                              child: CategoryWidget(
                                category: data[index],
                                selected: clicked.value == index ? true : false,
                              ),
                            );
                          }),
                    );
                  },
                  error: (e, stacktree) {
                    return Text(e.toString());
                  },
                  loading: () => Container());
            }),
            const SizedBox(height: 10),
            HookConsumer(builder: (context, ref, child) {
              final products = ref.watch(getProductsProvider);
              final filteredProducts =
                  ref.watch(getfilteredProductsProvider(selectedcategory.value));
              return clicked.value == -1
                  ? products.when(
                      data: (data) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 30, right: 30),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20.0,
                                    crossAxisSpacing: 40.0,
                                    childAspectRatio: 130.w / 193.h
                                    // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                                    ),
                            itemBuilder: (itemcontext, index) {
                              return InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    ProductDetailsRoute(
                                        imageUrl: data[index].image,
                                        title: data[index].title,
                                        price: data[index].price.toString(),
                                        desc: data[index].description,
                                        type: data[index].category),
                                  );
                                },
                                child: ProductCardWidget(
                                  imageUrl: data[index].image,
                                  title: data[index].title,
                                  price: data[index].price.toString(),
                                  rating: data[index].rating.rate!.toDouble(),
                                ),
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
                          ))
                  : filteredProducts.when(
                      data: (data) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 30, right: 30),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20.0,
                                    crossAxisSpacing: 40.0,
                                    childAspectRatio: 130 / 193
                                    // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                                    ),
                            itemBuilder: (itemcontext, index) {
                              return InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    ProductDetailsRoute(
                                        imageUrl: data[index].image,
                                        title: data[index].title,
                                        price: data[index].price.toString(),
                                        desc: data[index].description,
                                        type: data[index].category),
                                  );
                                },
                                child: ProductCardWidget(
                                  imageUrl: data[index].image,
                                  title: data[index].title,
                                  price: data[index].price.toString(),
                                  rating: data[index].rating.rate!.toDouble(),
                                ),
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
      ),
    );
  }
}
