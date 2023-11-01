part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.success(ProductsResponseModel data) = _Success;
  const factory ProductsState.error(String message) = _Error;
}
