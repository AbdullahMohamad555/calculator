// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppTextStyles {
  // لون أساسي للنصوص
  static const Color primaryTextColor = Color(0xFF1A1C1E);
  static const Color secondaryTextColor = Color(0xFF757575);

  // نمط العناوين الرئيسية (مثل: Home Screen, Assignments)
  static const TextStyle headerStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryTextColor,
    fontFamily: 'Tajawal', // يفضل استخدام خط عربي مثل Tajawal
  );

  // نمط عناوين الأقسام (مثل: المحاضرات القادمة)
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: primaryTextColor,
  );

  // نمط محتوى البطاقات (اسم المادة أو الواجب)
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );

  // نمط الملاحظات الفرعية أو الوقت
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: secondaryTextColor,
  );

  // نمط خاص بالحالة (مثل: ينتهي اليوم! باللون الأحمر)
  static const TextStyle alertStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.redAccent,
  );
}
