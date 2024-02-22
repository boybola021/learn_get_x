import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_get_x/screen/shop_page/shop_controller.dart';

import 'model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int onTapIndex = 0;
  final ShopController controller = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Home page",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: GetBuilder<ShopController>(
        init: ShopController(),
        builder: (_){
          if (controller.listProducts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 3 / 4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.listProducts.length,
                        (context, i) {
                      final item = controller.listProducts[i];
                      return CustomSliverGridView(item: item);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class CustomSliverGridView extends StatelessWidget {
  final Products item;

  const CustomSliverGridView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    item.image,
                    errorBuilder: (context, child, error) {
                      return const Center(child: Icon(Icons.no_photography));
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rate",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            " ${item.rating.rate}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${item.price}",
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        height: 30,
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(198, 124, 78, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
