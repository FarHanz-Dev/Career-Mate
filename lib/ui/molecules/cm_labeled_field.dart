import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_text_field.dart';

/// `.field`: a 12px label (text at 70%) above an input.
class CmLabeledField extends StatelessWidget {
  const CmLabeledField({
    super.key,
    required this.label,
    this.value = '',
    this.onChanged,
    this.hint,
    this.readOnly = false,
    this.minLines,
    this.maxLines = 1,
    this.minHeight = 36,
    this.fontSize = 14,
    this.keyboardType,
  });

  final String label;
  final String value;
  final ValueChanged<String>? onChanged;
  final String? hint;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final double minHeight;
  final double fontSize;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: cm.body(size: 12, color: cm.colors.text.withValues(alpha: 0.7))),
        const SizedBox(height: 5),
        CmTextField(
          value: value,
          onChanged: onChanged,
          hint: hint,
          readOnly: readOnly,
          minLines: minLines,
          maxLines: maxLines,
          minHeight: minHeight,
          fontSize: fontSize,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
