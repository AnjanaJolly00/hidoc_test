import 'package:flutter/material.dart';
import 'package:hidoc/bloc/home_cubit.dart';
import 'package:hidoc/utils/app_colors.dart';

import '../../utils/text_widget.dart';
import '../trending_article_adapter.dart';
import '../trending_hidoc_bulletin_adapter.dart';
import 'home_widgets/explore_articles_adapter.dart';
import 'home_widgets/home_article_adapter.dart';
import 'home_widgets/home_page_bulletin_builer.dart';
import 'home_widgets/latest_Article_adapter.dart';
import 'home_widgets/news_adapter.dart';

class HomeMobile extends StatelessWidget {
  HomeScreenCubit cubit;
  HomeMobile({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -120,
          left: -120,
          child: ClipOval(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: themeOrange,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -190,
          right: -220,
          child: ClipOval(
            child: Container(
              height: 300,
              width: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: themeLightPeach,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 3, top: 3),
                      decoration: const BoxDecoration(
                          color: bgBlue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: TextWidget.muliBoldText(
                          text: 'hidoc', fontSize: 20, color: backgroundColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextWidget.muliExtraBoldText(
                    text: 'ARTICLES',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                cubit.article != null
                    ? HomeArticleAdapter(article: cubit.article)
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                cubit.bulletins != null
                    ? cubit.bulletins.isNotEmpty
                        ? HidocBulletinBuilder(bulletins: cubit.bulletins)
                        : const SizedBox()
                    : const SizedBox(),
                cubit.trendingBulletin != null
                    ? cubit.trendingBulletin.isNotEmpty
                        ? TrendingHidocBulletinAdapter(
                            trendingBulletin: cubit.trendingBulletin,
                          )
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 25,
                ),
                cubit.latestArticles != null
                    ? cubit.latestArticles.isNotEmpty
                        ? LatestArticleAdapter(
                            latestArticles: cubit.latestArticles)
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                cubit.trendingArticles != null
                    ? cubit.trendingArticles.isNotEmpty
                        ? TrendingArticlesAdapter(
                            trendingArticles: cubit.trendingArticles)
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                cubit.exploreArticles != null
                    ? cubit.exploreArticles.isNotEmpty
                        ? ExploreArticlesAdapter(
                            articles: cubit.exploreArticles)
                        : SizedBox()
                    : SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextWidget.muliExtraBoldText(
                    text: 'What\'s more on Hidoc Dr.',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                cubit.news != null
                    ? cubit.news.isNotEmpty
                        ? NewsAdapter(news: cubit.news)
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor.withOpacity(.5))),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: bgBlue,
                          child: Image.asset(
                            'assets/trophy.png',
                            color: Colors.blue,
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextWidget.muliBoldText(
                            text: 'Quizzes : ', color: textColor, fontSize: 16),
                        Expanded(
                            child: TextWidget.muliRegularText(
                                text: 'Participate and win exciting prizes',
                                fontSize: 14))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: textColor.withOpacity(.3),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: bgBlue,
                          child: Image.asset(
                            'assets/calculator.png',
                            color: Colors.blue,
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextWidget.muliBoldText(
                            text: 'Medical\nCalculators : ',
                            color: textColor,
                            fontSize: 16),
                        Expanded(
                            child: TextWidget.muliRegularText(
                                text:
                                    'Get access to 800+\n Evidence based Calculators',
                                maxLines: 2,
                                fontSize: 14))
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
