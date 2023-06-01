import 'package:flutter/material.dart';
import 'package:hidoc/utils/app_utils.dart';

import '../../../models/articles_api_models.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_widget.dart';

class LatestArticleAdapter extends StatelessWidget {
  List<Article> latestArticles;
  LatestArticleAdapter({required this.latestArticles, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: textColor.withOpacity(.5),
        ),
      ),
      child: Column(
        children: [
          TextWidget.muliExtraBoldText(
            text: 'Latest Articles',
            fontSize: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: textColor.withOpacity(.5),
          ),
          const SizedBox(
            height: 5,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: latestArticles.length,
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    launchInBrowser(latestArticles[i].redirectLink);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget.muliRegularText(
                          text: latestArticles[i].articleTitle,
                          color: textColor,
                          maxLines: 2),
                      latestArticles.length - 1 == i
                          ? SizedBox()
                          : Divider(
                              color: textColor.withOpacity(.3),
                            )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
