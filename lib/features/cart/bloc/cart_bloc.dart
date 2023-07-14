import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/data/cart_items.dart';
import 'package:meta/meta.dart';

import '../../home/models/product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    print("Remove Product Clicked!");
    cartItems.remove(event.clickedProduct);
    emit(CartSuccessState(cartItems));
  }
}
