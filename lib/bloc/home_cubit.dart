import 'package:hidoc/data/api_service.dart';
import 'package:hidoc/bloc/state/home_cubit_state.dart';
import 'package:hidoc/data/models/articles_api_models.dart';

import '../data/models/apiresponse.dart';
import 'main/main_cubit.dart';

class HomeScreenCubit extends MainCubit<HomeScreenState> {
  HomeScreenCubit([
    HomeScreenState? initialState,
  ]) : super(
          initialState ?? HomeScreenInitial(),
        );
  final ApiService _service = ApiService();
  late Article article;
  late List<Bulletin> bulletins;
  late List<TrandingBulletin> trendingBulletin;
  late List<Article> latestArticles;
  late List<TrendingArticle> trendingArticles;
  late List<ExploreArticle> exploreArticles;
  late List<News> news;

  Future getArticles() async {
    emit(HomeScreenLoadingState());
    ApiResponse response =
        await _service.getArticles(sId: '500', userId: '423914');

    if (response.isSuccessful &&
        response.rawResponse!.isNotEmpty &&
        response != null) {
      ArticlesModel model = ArticlesModel.fromJson(response.rawResponse);
      if (model.success == 1) {
        article = model.data!.article!;
        bulletins = model.data!.bulletin ?? [];
        trendingBulletin = model.data!.trandingBulletin ?? [];
        latestArticles = model.data!.latestArticle ?? [];
        trendingArticles = model.data!.trandingArticle ?? [];
        news = model.data!.news ?? [];
        exploreArticles = model.data!.exploreArticle ?? [];
      }
      emit(HomeScreenSuccessState());
    } else {
      emit(HomeScreenFailureState());
    }
  }
}
