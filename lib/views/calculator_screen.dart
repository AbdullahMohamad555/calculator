import 'package:flutter/material.dart';
import 'package:one/views/widgets/operation_button.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الحاسبة المتقدمة'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<CalculatorProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                // حقل الرقم الأول
                _buildNumberField(
                  context: context,
                  label: 'الرقم الأول',
                  value: provider.model.number1 ?? '',
                  onChanged: (value) => provider.updateNumber1(value),
                ),
                SizedBox(height: 20),

                // حقل الرقم الثاني
                _buildNumberField(
                  context: context,
                  label: 'الرقم الثاني',
                  value: provider.model.number2 ?? '',
                  onChanged: (value) => provider.updateNumber2(value),
                ),
                SizedBox(height: 30),

                // عرض العملية المختارة
                if (provider.model.operation != null)
                  Text(
                    'العملية المختارة: ${provider.model.operation}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                SizedBox(height: 10),

                // عرض الخطأ إن وجد
                if (provider.model.error != null)
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            provider.model.error!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),

                // أزرار العمليات
                _buildOperationsGrid(provider),
                SizedBox(height: 30),

                // أزرار التنفيذ والمسح
                Row(
                  children: [
                    Expanded(child: _buildEqualButton(provider)),
                    SizedBox(width: 10),
                    Expanded(child: _buildClearButton(provider)),
                  ],
                ),
                SizedBox(height: 30),

                // عرض النتيجة
                _buildResultDisplay(provider),
              ],
            );
          },
        ),
      ),
    );
  }

  // دالة لبناء حقل الإدخال
  Widget _buildNumberField({
    required BuildContext context,
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.numbers),
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: TextEditingController(text: value)
        ..selection = TextSelection.collapsed(offset: value.length),
      onChanged: onChanged,
    );
  }

  // دالة لبناء شبكة أزرار العمليات
  Widget _buildOperationsGrid(CalculatorProvider provider) {
    final operations = [
      {'symbol': '÷', 'name': 'قسمة'},
      {'symbol': '×', 'name': 'ضرب'},
      {'symbol': '+', 'name': 'جمع'},
      {'symbol': '-', 'name': 'طرح'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemCount: operations.length,
      itemBuilder: (context, index) {
        final operation = operations[index];
        return OperationButton(
          symbol: operation['symbol']!,
          name: operation['name']!,
          onPressed: () => provider.setOperation(operation['symbol']!),
          isSelected: provider.model.operation == operation['symbol'],
        );
      },
    );
  }

  // زر التنفيذ (=)
  Widget _buildEqualButton(CalculatorProvider provider) {
    return ElevatedButton.icon(
      onPressed: provider.calculate,
      icon: Icon(Icons.calculate),
      label: Text('='),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }

  // زر المسح (AC)
  Widget _buildClearButton(CalculatorProvider provider) {
    return ElevatedButton.icon(
      onPressed: provider.clearAll,
      icon: Icon(Icons.clear),
      label: Text('AC'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }

  // عرض النتيجة
  Widget _buildResultDisplay(CalculatorProvider provider) {
    if (provider.model.result == null) return SizedBox();

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Text(
            'النتيجة',
            style: TextStyle(fontSize: 16, color: Colors.green[800]),
          ),
          SizedBox(height: 10),
          Text(
            provider.model.result!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
          ),
        ],
      ),
    );
  }
}
