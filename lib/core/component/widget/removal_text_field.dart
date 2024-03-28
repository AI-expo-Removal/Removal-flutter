import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/removal.dart';

enum RemovalTextFieldType {
  none,
  password,
}

class RemovalTextField extends StatefulWidget {
  final RemovalTextFieldType type;
  final TextInputType textInputType;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;
  final int maxLength;

  final Function? onChanged;
  final Widget? suffix;
  final String? widgetTitle;

  const RemovalTextField({
    super.key,
    this.type = RemovalTextFieldType.none,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.widgetTitle,
    this.onChanged,
    required this.controller,
    required this.focusNode,
    required this.title,
    required this.maxLength,
  });

  @override
  State<RemovalTextField> createState() => _RemovalTextFieldState();
}

class _RemovalTextFieldState extends State<RemovalTextField> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: RemovalTextStyle.label1(
            color: RemovalColor.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: RemovalColor.gray80,
            borderRadius: BorderRadius.circular(4),
            border: widget.focusNode.hasFocus
                ? Border.all(
                    color: RemovalColor.main50,
                    width: 1,
                  )
                : null,
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            cursorColor: RemovalColor.main50,
            style: RemovalTextStyle.caption2(
              color: RemovalColor.white,
            ),
            maxLength: widget.maxLength,
            onChanged: (value) => widget.onChanged,
            keyboardType: widget.textInputType,
            obscureText:
                !_isClicked && widget.type == RemovalTextFieldType.password,
            obscuringCharacter: "⦁",
            decoration: InputDecoration(
              hintText: widget.widgetTitle ?? widget.title,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintStyle: RemovalTextStyle.caption2(
                color: RemovalColor.gray40,
              ),
              counterText: "",
              suffix: widget.suffix,
              suffixIcon: widget.type == RemovalTextFieldType.password
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _isClicked ? _isClicked = false : _isClicked = true;
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          _isClicked
                              ? "assets/images/icon/core/eyes_open_icon.svg"
                              : "assets/images/icon/core/eyes_close_icon.svg",
                        ),
                      ),
                    )
                  : null,
            ),
            onTap: () {
              FocusScope.of(context).hasFocus
                  ? FocusScope.of(context).unfocus()
                  : FocusScope.of(context).hasFocus;
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
