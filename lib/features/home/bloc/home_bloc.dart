import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/data/cart_items.dart';
import 'package:demo_bloc/data/grocery_data.dart';
import 'package:demo_bloc/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../models/product_data_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);

    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        product: GroceryData.groceryProducts
            .map((e) => ProductDataModel(e['id'], e['name'], e['description'],
                e['price'], e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print("WishList from Product Clicked!");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("Cart from Product Clicked!");
    cartItems.add(event.clickedProduct);
    emit(HomeProductAddedToCartActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("WishList Navigate Clicked!");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Clicked!");
    emit(HomeNavigateToCartPageActionState());
  }
}
