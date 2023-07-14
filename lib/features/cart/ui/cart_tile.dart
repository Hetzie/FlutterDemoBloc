import 'package:demo_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:demo_bloc/features/home/models/product_data_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final cartBloc;

  const CartTile({super.key, required this.productDataModel, this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          Text(productDataModel.name),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${productDataModel.price}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(productDataModel));
                  },
                  icon: Icon(Icons.delete_forever_outlined),
              color: Colors.red,)
            ],
          )
        ],
      ),
    );
  }
}
