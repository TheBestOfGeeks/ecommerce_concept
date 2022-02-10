import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/product_details/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BestSeller extends StatelessWidget {
  final List<BestSellerEntity> bestseller;

  BestSeller(this.bestseller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                AppLocalizations.of(context)!.best_seller,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {},
                  child:  Text(
                    AppLocalizations.of(context)!.see_more,
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                  )),
            ],
          ),
          SizedBox(
            height: 500,
            child: GridView.count(
              physics:
                  const BouncingScrollPhysics(parent: const NeverScrollableScrollPhysics()),
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              padding: const EdgeInsets.all(5),
              childAspectRatio: 0.8,
              children: bestseller.map((product) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: bestSaleItem(product, context),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bestSaleItem(BestSellerEntity itemProduct, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (itemProduct.id == 3333) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetailsScreen(),
          ),
        );
      }
    },
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image(
                  image: Image.memory(itemProduct.localPicture).image,
                  height: 150),
              itemProduct.isFavorite
                  ? Container(
                      child:  const Image(
                        image: AssetImage(
                            Constants.IS_FAVORITE),
                        height: 15,
                      ),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ))
                  : Container(
                      child: const Image(
                        image: AssetImage(
                            Constants.IS_FAVORITE_EMPTY),
                        height: 15,
                      ),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('\$${itemProduct.price_without_discount}  ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                  Text(
                    '\$${itemProduct.discount_price}  ',
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemProduct.title,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
