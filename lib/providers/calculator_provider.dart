import 'package:flutter/foundation.dart';
import '../models/calculator_model.dart';
import '../controllers/calculator_controller.dart';

class CalculatorProvider extends ChangeNotifier {
  final CalculatorController _controller = CalculatorController();
  CalculatorModel _model = CalculatorModel();

  CalculatorModel get model => _model;

  // تحديث الرقم الأول
  void updateNumber1(String value) {
    _model = _model.copyWith(number1: value);
    notifyListeners();
  }

  // تحديث الرقم الثاني
  void updateNumber2(String value) {
    _model = _model.copyWith(number2: value);
    notifyListeners();
  }

  // تعيين العملية الحسابية
  void setOperation(String operation) {
    _model = _controller.setOperation(_model, operation);
    notifyListeners();
  }

  // تنفيذ العملية الحسابية
  void calculate() {
    _model = _controller.calculate(_model);
    notifyListeners();
  }

  // مسح جميع الحقول
  void clearAll() {
    _model = _controller.clearAll(_model);
    notifyListeners();
  }
}
