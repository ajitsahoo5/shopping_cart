import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/services/api_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  final ApiService _apiService;
  List<Product> _products = [];
  ProductBloc(this._apiService) : super(ProductInitial()){
    on<FetchProductsEvent>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(FetchProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      _products = await _apiService.fetchProducts(); 
      emit(ProductLoaded(products: _products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  
}
