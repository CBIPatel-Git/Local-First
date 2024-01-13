import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_first/Utility/utility_export.dart';

Color? borderColor;

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: borderColor ?? colorLightGrey, width: 1),
  borderRadius: BorderRadius.circular(8),
);
// _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
//   currentFocus.unfocus();
//   FocusScope.of(context).requestFocus(nextFocus);
// }

Widget commonTextField(
    {String? fieldTitleText,
    required String hintText,
    String? labelText,
    String? initialText,
    bool isPassword = false,
    bool isShowEye = true,
    double borderRadius = 8,
    required TextEditingController? textEditingController,
    Function? validationFunction,
    Function? onSavedFunction,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    double? borderOpacity,
    Function? onFieldSubmit,
    TextInputType? keyboardType,
    Function? onEditingComplete,
    Function? onTapFunction,
    Function? prefixIconTap,
    Function? onChangedFunction,
    TextAlign? align,
    TextInputAction? inputAction,
    List<TextInputFormatter>? inputFormatter,
    bool? isEnabled,
    int? errorMaxLines,
    int? maxLine,
    FocusNode? textFocusNode,
    GlobalKey<FormFieldState>? key,
    bool isReadOnly = false,
    Widget? suffixIcon,
    ExactAssetImage? preFixIcon,
    Widget? preFixWidget,
    Color? filledColor = white,
    RxBool? showPassword,
    int? maxLength,
    EdgeInsetsGeometry? contentPadding,
    ScrollController? scrollController,
    TextStyle? style,
    TextStyle? hintStyle}) {
  bool passwordVisible = isPassword;
  return StatefulBuilder(builder: (context, newSetState) {
    borderColor = colorLightGrey;
    if (initialText != null && initialText.isNotEmpty) {
      textEditingController?.text = initialText;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // if (fieldTitleText != null && fieldTitleText.isNotEmpty) fieldTitle(fieldTitleText),
        if (fieldTitleText != null && fieldTitleText.isNotEmpty)
          const SizedBox(
            height: 10.0,
          ),
        labelText == null || labelText.isEmpty
            ? const SizedBox()
            : Text(labelText, style: AppFontStyle.blackOpenSans14W500),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          maxLength: maxLength ?? 10000,
          scrollController: scrollController,
          // for scroll extra while keyboard open
          // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
          enabled: isEnabled != null && !isEnabled ? false : true,
          textAlign: align ?? TextAlign.start,
          showCursor: !isReadOnly,
          readOnly: isReadOnly,

          onTap: () {
            if (onTapFunction != null) {
              onTapFunction();
            }
          },
          key: key,
          focusNode: textFocusNode,
          onChanged: (value) {
            if (onChangedFunction != null) {
              onChangedFunction(value);
            }
          },
          onEditingComplete: () {
            if (onEditingComplete != null) {
              onEditingComplete();
            }
          },
          validator: (value) {
            return validationFunction != null ? validationFunction(value) : null;
          },
          // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
          onSaved: (value) {
            // ignore: void_checks
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            return onSavedFunction != null ? onSavedFunction(value) : null;
          },
          onFieldSubmitted: (value) {
            // ignore: void_checks
            // FocusScope.of(context).nextFocus();
            // FocusScope.of(context).requestFocus(FocusNode());
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            return onFieldSubmit != null ? onFieldSubmit(value) : null;
          },
          maxLines: maxLine ?? 1,
          keyboardType: keyboardType,
          controller: textEditingController,
          // initialValue: initialText ?? '',
          cursorColor: colorPrimary,
          obscureText: passwordVisible,
          textInputAction: inputAction ?? TextInputAction.done,

          style: style ?? AppFontStyle.blackOpenSans14W500,
          inputFormatters: inputFormatter,
          decoration: InputDecoration(
            counterText: '',
            errorMaxLines: errorMaxLines ?? 1,
            filled: true,
            fillColor: filledColor,
            contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: colorLightGrey, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? colorLightGrey, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? colorLightGrey, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? colorLightGrey, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? colorLightGrey, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            hintText: hintText,
            prefixIcon: preFixIcon != null
                ? InkWell(
                    onTap: () {
                      if (prefixIconTap != null) {
                        prefixIconTap();
                      }
                    },
                    child: Image(
                      image: preFixIcon,
                      height: 15,
                      // color: color_8D8D8D,
                    ),
                  )
                : preFixWidget,
            suffixIcon: isPassword && isShowEye
                ? InkWell(
                    onTap: () {
                      newSetState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    child: passwordVisible
                        ? const Icon(
                            CupertinoIcons.eye,
                            color: colorGrey,
                          )
                        : const Icon(
                            CupertinoIcons.eye_slash,
                            color: colorGrey,
                          ))
                : suffixIcon ??
                    const SizedBox(
                      height: 0,
                      width: 0,
                    ),
            hintStyle: hintStyle ?? AppFontStyle.greyOpenSans14W500,
          ),
        ),
      ],
    );
  });
}
