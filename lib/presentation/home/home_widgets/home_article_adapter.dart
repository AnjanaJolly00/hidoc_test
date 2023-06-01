import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/models/articles_api_models.dart';
import 'package:hidoc/utils/app_utils.dart';
import 'package:hidoc/widgets/responsive_layout.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_widget.dart';

class HomeArticleAdapter extends StatelessWidget {
  final Article article;
  const HomeArticleAdapter({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchInBrowser(article.redirectLink!);
      },
      child: ResponsiveLayout(
        desktopBody: Container(
          child: Row(children: [
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: article.articleImg ?? "",
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
                          size: 70,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                        color: themeBlue,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15)),
                      ),
                      child: Column(children: [
                        TextWidget.muliRegularText(
                          text: 'Points',
                          color: backgroundColor,
                        ),
                        TextWidget.muliBoldText(
                            text: '2', color: backgroundColor, fontSize: 25),
                      ]),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.muliBoldText(
                      text: article.articleTitle ?? "", fontSize: 16),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget.muliRegularText(
                      text:
                          removeAllHtmlTags(article.articleDescription ?? "")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget.muliSemiBoldText(
                      text: 'Read full article to earn points',
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      color: themeBlue),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget.muliRegularText(
                      fontSize: 12,
                      text:
                          'Published Date : ${formatDate(DateTime.parse(article.createdAt))}')
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
        ),
        mobileBody: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 3, offset: Offset(0.0, 0.75)),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.grey.withOpacity(.3),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: article.articleImg ?? "",
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
                        size: 70,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.muliBoldText(
                      text: article.articleTitle ?? "", fontSize: 16),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget.muliRegularText(
                      text:
                          removeAllHtmlTags(article.articleDescription ?? "")),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                TextWidget.muliSemiBoldText(
                    text: 'Read full article to earn points',
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    color: themeBlue),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: const BoxDecoration(
                    color: themeBlue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15)),
                  ),
                  child: Column(children: [
                    TextWidget.muliRegularText(
                      text: 'Points',
                      color: backgroundColor,
                    ),
                    TextWidget.muliBoldText(
                        text: '2', color: backgroundColor, fontSize: 25),
                  ]),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
