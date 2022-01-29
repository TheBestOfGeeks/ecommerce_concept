import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_event.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_state.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_event.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPropsAndCartButton extends StatelessWidget {
  ProductEntity product;

  SelectPropsAndCartButton({required this.product});

  int? activeColorPicked;
  String? selectedCapacity;

  @override
  Widget build(BuildContext context) {
    List<String> productColors = product.color;
    List<String> productCapacity = product.capacity;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Select color and capacity',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
                return Container(
                  height: 50,
                  width: 170,
                  child: GridView.builder(
                      itemCount: productColors.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return IconButton(
                          onPressed: () {
                            context.read<ColorBloc>().add(
                                ChoseColorEvent(color: productColors[index]));
                          },
                          icon: Container(
                            padding: EdgeInsets.all(8),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(
                                colorDecode(productColors[index]),
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: state.color == productColors[index]
                                ? const Image(
                                    image: AssetImage(
                                        'assets/icons/product_details_page/check_mark.png'),
                                  )
                                : Container(),
                          ),
                        );
                      }),
                );
              }),
              BlocBuilder<CapacityBloc, CapacityState>(
                  builder: (context, state) {
                return Container(
                  height: 50,
                  width: 150,
                  child: GridView.builder(
                      itemCount: productCapacity.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2.5),
                      itemBuilder: (context, index) {
                        return MaterialButton(
                          onPressed: () {
                            context.read<CapacityBloc>().add(ChoseCapacityEvent(
                                capacity: productCapacity[index]));
                          },
                          color: state.capacity == productCapacity[index]
                              ? Colors.deepOrangeAccent
                              : Color.fromRGBO(229, 229, 229, 1.0),
                          child: Text('${productCapacity[index]}',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      state.capacity == productCapacity[index]
                                          ? Colors.white
                                          : Colors.grey)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        );
                      }),
                );
              })
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            onPressed: () {},
            color: Colors.deepOrangeAccent,
            child: Text('Add to Cart   \$${product.price.toDouble()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}

//Метод обрабатывает код цвета формата #772d03 в формат 0xFF772d03
int colorDecode(String colorCode) {
  int decode = int.parse('0xFF${colorCode.substring(1)}');
  return decode;
}
