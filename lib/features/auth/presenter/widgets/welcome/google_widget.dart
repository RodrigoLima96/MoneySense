import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/core.dart';

class GoogleWidget extends StatelessWidget {
  final VoidCallback press;
  const GoogleWidget({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: AppPallete.greyColor,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'or continue with',
                style: TextStyle(color: AppPallete.greyColor,),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppPallete.greyColor,
                thickness: 1,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: press,
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/google-icon.svg',
            ),
          ),
        ),
      ],
    );
  }
}
