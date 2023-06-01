import 'package:flutter/material.dart';
import 'package:hidoc/models/articles_api_models.dart';
import 'package:hidoc/utils/app_utils.dart';
import 'package:hidoc/utils/text_widget.dart';

import '../../../utils/app_colors.dart';

class HidocBulletinBuilder extends StatelessWidget {
  List<Bulletin> bulletins;
  HidocBulletinBuilder({required this.bulletins, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.muliExtraBoldText(text: 'Hidoc Bulletin ', fontSize: 20),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          width: 150,
          child: Divider(
            thickness: 5,
            color: themeBlue,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: bulletins.length,
            itemBuilder: (c, i) {
              return InkWell(
                onTap: () {
                  launchInBrowser(bulletins[i].redirectLink);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.muliBoldText(
                        text: bulletins[i].articleTitle ?? "",
                        maxLines: 2,
                        fontSize: 16),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget.muliRegularText(
                        text: bulletins[i].articleDescription, maxLines: 3),
                    const SizedBox(
                      height: 8,
                    ),
                    TextWidget.muliSemiBoldText(
                        text: 'Read more',
                        decoration: TextDecoration.underline,
                        color: themeBlue,
                        fontSize: 14),
                    const SizedBox(
                      height: 15,
                    ),
                    i == bulletins.length - 1
                        ? SizedBox()
                        : const SizedBox(
                            width: 150,
                            child: Divider(
                              thickness: 5,
                              color: themeBlue,
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
