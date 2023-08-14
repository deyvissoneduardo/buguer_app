import '../../dtos/order/order_dto.dart';
import '../../models/order/order_model.dart';

abstract class GetOrderByIdService {
  Future<OrderDto> call(OrderModel order);
}
