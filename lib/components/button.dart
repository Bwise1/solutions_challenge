import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_agriculture/utils/spacing.dart';

class AppButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color? loaderColor;
  final String text;
  final String? imagePath;
  final bool isSvg, isLoading;
  final Function()? onTap;

  const AppButtons(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.text,
      required this.borderColor,
      this.loaderColor,
      this.imagePath,
      this.isSvg = false,
      required this.onTap,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 18,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              isSvg == true
                  ? SvgPicture.asset(imagePath!)
                  : Image(image: AssetImage(imagePath!))
            ],
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
            if (isLoading) ...[
              addHorizontalSpace(10),
              loaderColor != null
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: loaderColor,
                      ),
                    )
                  : const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                      ),
                    )
            ],
          ],
        ),
      ),
    );
  }
}
