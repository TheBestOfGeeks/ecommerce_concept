import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NameAndStars extends StatefulWidget {
  final ProductEntity product;

  NameAndStars({Key? key, required this.product}) : super(key: key);

  @override
  State<NameAndStars> createState() => _NameAndStarsState();
}

class _NameAndStarsState extends State<NameAndStars> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Image(
                    image: isFavorite
                        ? const AssetImage(
                            Constants.ACTIVATED_LIKE_BUTTON)
                        : const AssetImage(
                            Constants.LIKE_BUTTON),
                  ),
                  iconSize: 35),
            ],
          ),
          RatingBar.builder(
              initialRating: widget.product.rating.toDouble(),
              itemSize: 23,
              itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rate) {}),
        ],
      ),
    );
  }
}
