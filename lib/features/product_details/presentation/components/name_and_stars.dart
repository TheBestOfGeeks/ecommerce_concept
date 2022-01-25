import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NameAndStars extends StatelessWidget {
  ProductEntity product;

  NameAndStars({required this.product});



  @override
  Widget build(BuildContext context) {

    bool isFavorite = product.isFavorites;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: 500,
      decoration: BoxDecoration(
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
            children: [
              Text(product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              IconButton(
                  onPressed: () {
                  },
                  icon: Image(
                    image: isFavorite ? AssetImage('assets/icons/product_details_page/activated_like_button.png'): AssetImage('assets/icons/product_details_page/like_button.png'),
                  ),
                  iconSize: 30),
            ],
          ),
          Container(
            child: RatingBar.builder(
              initialRating: product.rating.toDouble(),
              itemSize: 20,
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (rate) {}),
          ),
        ],
      ),
    );
  }
}
