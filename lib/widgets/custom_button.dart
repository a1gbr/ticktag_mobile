import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double maxWidth;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.maxWidth = 400, // Largura máxima padrão
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxWidth,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(text),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
