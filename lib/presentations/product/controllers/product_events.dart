
abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {
  final int id;
  GetProductEvent(this.id);
}

class GetProductRatesEvent extends ProductEvent {
  final int id;
  GetProductRatesEvent(this.id);
}
