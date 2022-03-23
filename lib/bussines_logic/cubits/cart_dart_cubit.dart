import 'package:bloc/bloc.dart';
import 'package:funduk_app/data/models/cart.dart';

part 'cart_dart_state.dart';

class CartDartCubit extends Cubit<CartDartInitial> {
  CartDartCubit() : super(CartDartInitial(list: []));

  void addList(Cart cart) {
    // state.list.where((element) => element.title!=cart.title)!=null?{}:  // Barcha element qo'shilgandan kiyn  yoqamiz
    state.list.add(cart);
    emit(CartDartInitial(list: state.list));
  }

  void incrementCart(int count, String id) {
    print(id);
    print(count);
    print(state.list[state.list.indexWhere((element) => element.id == id)].count);
    state.list[state.list.indexWhere((element) => element.id == id)].count = count + 1;
    print(state.list[state.list.indexWhere((element) => element.id == id)].count);

    emit(CartDartInitial(list: state.list));
  }

  void decrementCart(int count, String id) {

    count > 0
        ? state.list.where((element) => element.id == id).first.count =
            (count - 1)
        : state.list.removeWhere((element) => element.id == id);
    emit(CartDartInitial(list: state.list));
  }
}
