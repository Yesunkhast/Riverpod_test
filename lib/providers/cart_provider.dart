import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // @override
  // List<Product> build() {
  //   return const [
  //     Product(
  //       id: '8',
  //       title: 'Electric Guitar',
  //       price: 79,
  //       image: 'assets/products/guitar.png',
  //     ),
  //   ];
  // }

  // initial value

  // @override
  // List<Product> build() {
  //   return const [];
  // }

  @override
  Set<Product> build() {
    return const {};
  }

  // methods to update state
  // void addProduct(Product product) {
  //   if (!state.contains(product)) {
  //     state = [...state, product];
  //   }
  // }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  // void removeProduct(Product product) {
  //   if (state.contains(product)) {
  //     state = state.where((p) => p.id != product.id).toList();
  //   }
  // }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toSet();
  }
}

// final cartNotifierProvider = NotifierProvider<CardNotifier, Set<Product>>(() {
//   return CardNotifier();
// });

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
}
