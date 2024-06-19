import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

class GoogleWidget extends StatelessWidget {
  final VoidCallback press;
  final bool welcomePage;
  const GoogleWidget(
      {super.key, required this.press, required this.welcomePage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: welcomePage ? 0 : 25),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Divider(
                  color: AppPallete.greyColor,
                  thickness: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'or continue with',
                  style: TextStyle(
                    color: AppPallete.greyColor,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: AppPallete.greyColor,
                  thickness: 0.5,
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
      ),
    );
  }
}
