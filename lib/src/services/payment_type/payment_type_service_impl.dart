import '../../models/payment_type_model.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import 'payment_type_service.dart';

class PaymentTypeServiceImpl implements PaymentTypeService {
  final PaymentTypeRepository paymentTypeRepository;

  PaymentTypeServiceImpl(this.paymentTypeRepository);
  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) =>
      paymentTypeRepository.findAll(enabled);

  @override
  Future<PaymentTypeModel> getById(int id) => paymentTypeRepository.getById(id);

  @override
  Future<void> save(PaymentTypeModel model) =>
      paymentTypeRepository.save(model);
}
