import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/home/presentation/widget/cart_card.dart';
import 'package:ecommerce_app/home/provider/provider_home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CartPage extends HookConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text('My Cart',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: HookConsumer(builder: (context, ref, child) {
        final cartdata = ref.watch(getcartdataprovider);
        return cartdata.when(
            data: (data) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return FadeInLeft(
                              child: CartCard(
                                amount: data[0].products[0].quantity!,
                              ),
                            );
                          }),
                    ],
                  ),
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
    );
  }
}
