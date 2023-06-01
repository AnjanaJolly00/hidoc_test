import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/utils/app_utils.dart';
import 'package:hidoc/utils/text_widget.dart';

import '../../../models/articles_api_models.dart';

class NewsAdapter extends StatelessWidget {
  List<News> news;
  NewsAdapter({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: TextWidget.muliExtraBoldText(
              text: 'News',
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: news.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    launchInBrowser(news[i].url ?? "");
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextWidget.muliRegularText(
                            text: news[i].title ?? "", maxLines: 2),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.fill,
                        imageUrl: news[i].urlToImage ?? "",
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
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
