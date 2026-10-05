import 'package:flutter/material.dart';

import '../../app/theme/cm_theme.dart';

/// `.input`: surface fill, 1px divider border, accent border on focus.
/// [bare] drops the fill and border for fields that sit inside another row
/// (search bar, mail header rows).
///
/// The text is seeded from [value] and only re-synced when [value] changes,
/// so callers can debounce state updates without fighting the caret.
class CmTextField extends StatefulWidget {
  const CmTextField({
    super.key,
    this.value = '',
    this.onChanged,
    this.hint,
    this.bare = false,
    this.readOnly = false,
    this.minHeight = 36,
    this.minLines,
    this.maxLines = 1,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.height = 1.55,
    this.keyboardType,
    this.textInputAction,
    this.padding,
  });

  final String value;
  final ValueChanged<String>? onChanged;
  final String? hint;
  final bool bare;
  final bool readOnly;
  final double minHeight;
  final int? minLines;
  final int? maxLines;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsets? padding;

  @override
  State<CmTextField> createState() => _CmTextFieldState();
}

class _CmTextFieldState extends State<CmTextField> {
  late final TextEditingController _controller = TextEditingController(text: widget.value);
  final FocusNode _focus = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (_focused != _focus.hasFocus) setState(() => _focused = _focus.hasFocus);
    });
  }

  @override
  void didUpdateWidget(CmTextField old) {
    super.didUpdateWidget(old);
    if (widget.value != old.value && widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    final style = cm.body(size: widget.fontSize, weight: widget.fontWeight, height: widget.height);

    final field = TextField(
      controller: _controller,
      focusNode: _focus,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: c.accent,
      cursorWidth: 1.5,
      style: style,
      decoration: InputDecoration.collapsed(
        hintText: widget.hint,
        hintStyle: style.copyWith(color: c.neutral600),
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _focus.requestFocus,
      child: Container(
        constraints: BoxConstraints(minHeight: widget.minHeight),
        padding: widget.padding ??
            (widget.bare ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 10, vertical: 6)),
        alignment: widget.maxLines == 1 ? Alignment.centerLeft : Alignment.topLeft,
        decoration: widget.bare
            ? null
            : BoxDecoration(
                color: c.surface,
                border: Border.all(color: _focused ? c.accent : c.divider),
                borderRadius: cm.radius.mdAll,
              ),
        child: field,
      ),
    );
  }
}
