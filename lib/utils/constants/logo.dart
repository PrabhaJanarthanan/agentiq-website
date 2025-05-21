import 'package:agentiqthingswebsite/utils/constants/image_strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget navLogo(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ATImages.atLogo),
            fit: BoxFit.contain,
          ),
        ),
      ),
      const SizedBox(width: 8),
      Semantics(
        child: AutoSizeText(
          'Agentiq-Things',
          maxLines: 1,
          minFontSize: 10,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    ],
  );
}
