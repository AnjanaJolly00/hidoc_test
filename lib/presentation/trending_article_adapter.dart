import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hidoc/models/articles_api_models.dart';
import 'package:hidoc/utils/app_utils.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_widget.dart';

class TrendingArticlesAdapter extends StatelessWidget {
  List<TrendingArticle> trendingArticles;
  TrendingArticlesAdapter({required this.trendingArticles, super.key});

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
      child: Column(children: [
        TextWidget.muliExtraBoldText(
          text: 'Trending Articles',
          fontSize: 20,
        ),
        const SizedBox(height: 15),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: trendingArticles.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) {
              return InkWell(
                onTap: () {
                  launchInBrowser(trendingArticles[i].redirectLink);
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.fill,
                      imageUrl: trendingArticles[i].articleImg ?? "",
                      errorWidget: (context, url, error) {
                        return const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.file_copy_outlined,
                            color: Colors.grey,
                            size: 70,
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.download,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget.muliRegularText(
                        text: trendingArticles[i].articleTitle ?? "",
                        maxLines: 2),
                    const SizedBox(
                      height: 10,
                    ),
                    i == trendingArticles.length - 1
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Divider(
                              thickness: 1,
                              color: textColor.withOpacity(.3),
                            ),
                          ),
                  ],
                ),
              );
            })
      ]),
    );
  }
}
