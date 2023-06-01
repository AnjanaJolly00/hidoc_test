import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hidoc/data/models/articles_api_models.dart';
import 'package:hidoc/utils/app_utils.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_widget.dart';

class TrendingHidocBulletinAdapter extends StatelessWidget {
  List<TrandingBulletin> trendingBulletin;
  TrendingHidocBulletinAdapter({required this.trendingBulletin, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: bgBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.muliExtraBoldText(
            text: 'Trending Hidoc Bulletin',
            fontSize: 20,
          ),
          const SizedBox(
            height: 25,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: trendingBulletin.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    launchInBrowser(trendingBulletin[i].redirectLink);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget.muliBoldText(
                          text: trendingBulletin[i].articleTitle,
                          maxLines: 2,
                          fontSize: 16),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget.muliRegularText(
                          text: trendingBulletin[i].articleDescription,
                          maxLines: 3),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget.muliSemiBoldText(
                          text: 'Read more',
                          decoration: TextDecoration.underline,
                          color: themeBlue,
                          fontSize: 14),
                      const SizedBox(
                        height: 20,
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
