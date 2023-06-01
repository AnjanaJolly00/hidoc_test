import 'package:flutter/material.dart';
import 'package:hidoc/bloc/home_cubit.dart';
import 'package:hidoc/presentation/trending_article_adapter.dart';
import 'package:hidoc/presentation/trending_hidoc_bulletin_adapter.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_widget.dart';
import 'home_widgets/explore_articles_adapter.dart';
import 'home_widgets/home_article_adapter.dart';
import 'home_widgets/home_page_bulletin_builer.dart';
import 'home_widgets/latest_Article_adapter.dart';
import 'home_widgets/news_adapter.dart';

class HOmeWeb extends StatelessWidget {
  HomeScreenCubit cubit;
  HOmeWeb({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30, left: 100, right: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cubit.bulletins != null
                    ? cubit.bulletins.isNotEmpty
                        ? Expanded(
                            child: HidocBulletinBuilder(
                                bulletins: cubit.bulletins))
                        : const SizedBox()
                    : const SizedBox(),
                cubit.trendingBulletin != null
                    ? cubit.trendingBulletin.isNotEmpty
                        ? Expanded(
                            child: TrendingHidocBulletinAdapter(
                              trendingBulletin: cubit.trendingBulletin,
                            ),
                          )
                        : const SizedBox()
                    : const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cubit.latestArticles != null
                    ? cubit.latestArticles.isNotEmpty
                        ? Expanded(
                            child: LatestArticleAdapter(
                                latestArticles: cubit.latestArticles),
                          )
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  width: 10,
                ),
                cubit.trendingArticles != null
                    ? cubit.trendingArticles.isNotEmpty
                        ? Expanded(
                            child: TrendingArticlesAdapter(
                                trendingArticles: cubit.trendingArticles),
                          )
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                cubit.exploreArticles != null
                    ? cubit.exploreArticles.isNotEmpty
                        ? Expanded(
                            child: ExploreArticlesAdapter(
                                articles: cubit.exploreArticles),
                          )
                        : SizedBox()
                    : SizedBox(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: TextWidget.muliExtraBoldText(
                text: 'What\'s more on Hidoc Dr.',
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cubit.news != null
                    ? cubit.news.isNotEmpty
                        ? Expanded(child: NewsAdapter(news: cubit.news))
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
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
                              text: 'Quizzes : ',
                              color: textColor,
                              fontSize: 16),
                          TextWidget.muliRegularText(
                              text: 'Participate and win exciting prizes',
                              fontSize: 14)
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
                          TextWidget.muliRegularText(
                              text:
                                  'Get access to 800+\n Evidence based Calculators',
                              maxLines: 2,
                              fontSize: 14)
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
