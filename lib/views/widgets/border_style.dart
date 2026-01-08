import 'package:flutter/material.dart';

class AppTextStyles {
  // ... (الخصائص السابقة للنصوص) ...
  static const Color primaryTextColor = Color(0xFF1A1C1E);
  static const Color secondaryTextColor = Color(0xFF757575);

  static const TextStyle headerStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryTextColor,
    fontFamily: 'Tajawal',
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: primaryTextColor,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: secondaryTextColor,
  );

  static const TextStyle alertStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.redAccent,
  );

  // أنماط الحدود (BorderStyle)

  // حدود افتراضية للبطاقات
  static final BorderStyle cardBorder =
      Border.all(
            color: Colors.grey.shade300, // لون رمادي فاتح
            width: 1.0, // عرض رقيق للحدود
            style: BorderStyle.solid,
          )
          as BorderStyle;

  // حدود لبطاقات الحالة المكتملة (أخضر)
  static final BorderStyle completedBorder =
      Border.all(
            color: Colors.green.shade400, // لون أخضر
            width: 1.5, // حدود أسمك قليلاً
            style: BorderStyle.solid,
          )
          as BorderStyle;

  // حدود لبطاقات الحالة المتأخرة (أحمر)
  static final BorderStyle overdueBorder =
      Border.all(
            color: Colors.red.shade400, // لون أحمر
            width: 1.5,
            style: BorderStyle.solid,
          )
          as BorderStyle;

  // حدود لبطاقات الحالة المعلقة أو القادمة (برتقالي/أزرق)
  static final BorderStyle pendingBorder =
      Border.all(
            color: Colors.orange.shade400, // لون برتقالي
            width: 1.5,
            style: BorderStyle.solid,
          )
          as BorderStyle;

  // حدود لحقول الإدخال (مثلاً حقل البحث أو الدردشة)
  static final BorderStyle inputFieldBorder =
      Border.all(
            color: Colors.blueGrey.shade200,
            width: 1.0,
            style: BorderStyle.solid,
          )
          as BorderStyle;

  // يمكن إضافة ألوان أخرى للحدود كما في شاشة Schedule
  static final BorderSide mathCourseBorder = BorderSide(
    color: Colors.blue.shade700,
    width: 4.0,
  );
  static final BorderSide programmingCourseBorder = BorderSide(
    color: Colors.green.shade700,
    width: 4.0,
  );
  // ... وهكذا لباقي المواد
}
