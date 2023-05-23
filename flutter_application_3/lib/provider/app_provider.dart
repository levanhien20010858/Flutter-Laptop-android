import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/Models/product_model/product_model.dart';

class AppProvider with ChangeNotifier {
  final List<ProductModel> cartProductList = [];
  final List<ProductModel> favouriteProductList = [];
  final List<ProductModel> buyProductList = [];
  //cart
  void addCartProduct(ProductModel productModel) {
    cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => cartProductList;
  void updateQty(ProductModel productModel, int qty) {
    int index = cartProductList.indexOf(productModel);
    cartProductList[index].qty = qty;
    notifyListeners();
  }

  //favourite
  List<ProductModel> favouriteList = [];
  void addFavouriteProduct(ProductModel productModel) {
    favouriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productModel) {
    favouriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getfavouriteProductList => favouriteProductList;

  //order
  void addBuyProduct(ProductModel productModel) {
    buyProductList.add(productModel);
    notifyListeners();
  }

  List<ProductModel> get getBuyProductList => buyProductList;
}
