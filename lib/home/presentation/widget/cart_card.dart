import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.amount});
final int amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 213, 236, 255),
          // border: Border.all(color: const Color.fromARGB(255, 231, 244, 255)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 240, 240, 240),
              ),
              color: const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Title',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.r)),
                  SizedBox(height: 4.h),
                  Text('\$1200',
                      style: TextStyle(color: Colors.grey, fontSize: 11.r)),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.add),
                  ),
                   Text(
                    amount.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.delete),
                  )
                ],
              )
            ],
          ),

          // Column(
          //   children: [
          //     SizedBox(height: 25.h),
          //     TextButton(
          //         onPressed: () {},
          //         child: const Text(
          //           'Remove',
          //           style: TextStyle(
          //             color: Colors.black,
          //             decoration: TextDecoration.underline,
          //           ),
          //         )),
          //   ],
          // )
        ],
      ),
    );
  }
}
