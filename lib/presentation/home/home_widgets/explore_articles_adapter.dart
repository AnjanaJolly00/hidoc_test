import 'package:flutter/material.dart';
import 'package:hidoc/data/models/articles_api_models.dart';
import 'package:hidoc/utils/app_utils.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_widget.dart';

class ExploreArticlesAdapter extends StatelessWidget {
  List<ExploreArticle> articles;
  ExploreArticlesAdapter({required this.articles, super.key});

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
              text: 'Explore more in Articles',
              fontSize: 20,
            ),
            const SizedBox(height: 15),
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: articles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (c, i) {
                  return InkWell(
                    onTap: () {
                      launchInBrowser(articles[i].redirectLink);
                    },
                    child: Column(
                      children: [
                        TextWidget.muliRegularText(
                            text: articles[i].articleTitle ?? "", maxLines: 2),
                        articles.length - 1 == i
                            ? SizedBox()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Divider(
                                  color: textColor.withOpacity(.3),
                                  thickness: 1,
                                ),
                              )
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}
