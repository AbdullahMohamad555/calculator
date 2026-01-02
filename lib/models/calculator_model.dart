class CalculatorModel {
  String? number1;
  String? number2;
  String? operation;
  String? result;
  String? error;

  CalculatorModel({
    this.number1,
    this.number2,
    this.operation,
    this.result,
    this.error,
  });

  CalculatorModel copyWith({
    String? number1,
    String? number2,
    String? operation,
    String? result,
    String? error,
  }) {
    return CalculatorModel(
      number1: number1 ?? this.number1,
      number2: number2 ?? this.number2,
      operation: operation ?? this.operation,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }
}
