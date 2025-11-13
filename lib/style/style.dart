import 'package:flutter/material.dart';


const Color primaryColor = Color(0xFF4CAF50); // Vert principal
const Color secondaryColor = Color(0xFF81C784); // Vert clair
const Color darkColor = Color(0xFF1B5E20); // Vert foncé pour fond si besoin
const Color surfaceColor = Color(0xFFFFFFFF); // Blanc pour champs et surfaces


const Color infoColor = Color(0xFF2196F3); // Bleu
const Color infoLightColor = Color(0xFF64B5F6); // Bleu clair
const Color successColor = Color(0xFF388E3C);
const Color warningColor = Color(0xFFFFB300);
const Color dangerColor = Color(0xFFD32F2F);


const LinearGradient buttonGradient = LinearGradient(
  colors: [primaryColor, secondaryColor],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const LinearGradient backgroundGradient = LinearGradient(
  colors: [infoColor, infoLightColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);

final TextStyle subtitleStyle = TextStyle(
  color: Colors.white70,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

final TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

InputDecoration kInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey[700]),
    prefixIcon: Icon(icon, color: Colors.lightBlueAccent),
    filled: true,
    fillColor: surfaceColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: infoLightColor, width: 2),
    ),
  );
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'résolu':
      return successColor;
    case 'en cours':
      return warningColor;
    case 'nouveau':
      return infoColor;
    case 'urgent':
      return dangerColor;
    default:
      return Colors.grey;
  }
}
