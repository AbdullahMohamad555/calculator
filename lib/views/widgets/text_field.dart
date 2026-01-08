import 'package:flutter/material.dart';
import 'package:one/views/widgets/textStyle.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // تلميح صغير فوق الحقل (اختياري)
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 4.0),
          child: Text(hintText, style: AppTextStyles.subtitleStyle),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: AppTextStyles.cardTitle, // النمط الذي صممناه للنصوص
          decoration: InputDecoration(
            hintText: 'أدخل $hintText...',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Color(0xFF2D62ED))
                : null,
            filled: true,
            fillColor: const Color(0xFFF5F7FA), // لون خلفية هادئ
            // حدود الحالة الطبيعية
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent),
            ),

            // حدود حالة التركيز (عند الكتابة)
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFF2D62ED),
                width: 1.5,
              ),
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
          ),
        ),
      ],
    );
  }
}
