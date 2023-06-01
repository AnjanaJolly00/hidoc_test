class ArticlesModel {
  int? success;
  String? message;
  Data? data;
  String? timestamp;

  ArticlesModel({this.success, this.message, this.data, this.timestamp});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  List<News>? news;
  List<TrandingBulletin>? trandingBulletin;
  String? specialityName;
  List<Article>? latestArticle;
  List<ExploreArticle>? exploreArticle;
  List<TrendingArticle>? trandingArticle;
  Article? article;
  List<Bulletin>? bulletin;
  int? sId;

  Data({
    this.news,
    this.trandingBulletin,
    this.specialityName,
    this.latestArticle,
    this.exploreArticle,
    this.trandingArticle,
    this.article,
    this.bulletin,
    this.sId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    if (json['trandingBulletin'] != null) {
      trandingBulletin = <TrandingBulletin>[];
      json['trandingBulletin'].forEach((v) {
        trandingBulletin!.add(TrandingBulletin.fromJson(v));
      });
    }
    specialityName = json['specialityName'];
    if (json['latestArticle'] != null) {
      latestArticle = <Article>[];
      json['latestArticle'].forEach((v) {
        latestArticle!.add(Article.fromJson(v));
      });
    }
    if (json['exploreArticle'] != null) {
      exploreArticle = <ExploreArticle>[];
      json['exploreArticle'].forEach((v) {
        exploreArticle!.add(ExploreArticle.fromJson(v));
      });
    }
    if (json['trandingArticle'] != null) {
      trandingArticle = <TrendingArticle>[];
      json['trandingArticle'].forEach((v) {
        trandingArticle!.add(TrendingArticle.fromJson(v));
      });
    }
    article =
        json['article'] != null ? Article.fromJson(json['article']) : null;
    if (json['bulletin'] != null) {
      bulletin = <Bulletin>[];
      json['bulletin'].forEach((v) {
        bulletin!.add(Bulletin.fromJson(v));
      });
    }
    sId = json['sId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    if (this.trandingBulletin != null) {
      data['trandingBulletin'] =
          this.trandingBulletin!.map((v) => v.toJson()).toList();
    }
    data['specialityName'] = this.specialityName;
    if (this.latestArticle != null) {
      data['latestArticle'] =
          this.latestArticle!.map((v) => v!.toJson()).toList();
    }
    if (this.exploreArticle != null) {
      data['exploreArticle'] =
          this.exploreArticle!.map((v) => v.toJson()).toList();
    }
    if (this.trandingArticle != null) {
      data['trandingArticle'] =
          this.trandingArticle!.map((v) => v.toJson()).toList();
    }
    if (this.article != null) {
      data['article'] = this.article!.toJson();
    }
    if (this.bulletin != null) {
      data['bulletin'] = this.bulletin!.map((v) => v.toJson()).toList();
    }
    data['sId'] = this.sId;
    return data;
  }
}

class News {
  int? id;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? speciality;
  String? newsUniqueId;
  int? trendingLatest;
  String? publishedAt;

  News({
    this.id,
    this.title,
    this.url,
    this.urlToImage,
    this.description,
    this.speciality,
    this.newsUniqueId,
    this.trendingLatest,
    this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      description: json['description'],
      speciality: json['speciality'],
      newsUniqueId: json['newsUniqueId'],
      trendingLatest: json['trendingLatest'],
      publishedAt: json['publishedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'description': description,
      'speciality': speciality,
      'newsUniqueId': newsUniqueId,
      'trendingLatest': trendingLatest,
      'publishedAt': publishedAt,
    };
  }
}

class TrandingBulletin {
  int id;
  String articleTitle;
  String redirectLink;
  String articleImg;
  String articleDescription;
  dynamic specialityId;
  int rewardPoints;
  dynamic keywordsList;
  dynamic articleUniqueId;
  int articleType;
  dynamic createdAt;

  TrandingBulletin({
    required this.id,
    required this.articleTitle,
    required this.redirectLink,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    required this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  factory TrandingBulletin.fromJson(Map<String, dynamic> json) {
    return TrandingBulletin(
      id: json['id'],
      articleTitle: json['articleTitle'],
      redirectLink: json['redirectLink'],
      articleImg: json['articleImg'],
      articleDescription: json['articleDescription'],
      specialityId: json['specialityId'],
      rewardPoints: json['rewardPoints'],
      keywordsList: json['keywordsList'],
      articleUniqueId: json['articleUniqueId'],
      articleType: json['articleType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'articleTitle': articleTitle,
      'redirectLink': redirectLink,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'rewardPoints': rewardPoints,
      'articleType': articleType,
    };

    if (specialityId != null) {
      data['specialityId'] = specialityId;
    }

    if (keywordsList != null) {
      data['keywordsList'] = keywordsList;
    }

    if (articleUniqueId != null) {
      data['articleUniqueId'] = articleUniqueId;
    }

    if (createdAt != null) {
      data['createdAt'] = createdAt;
    }

    return data;
  }
}

class ExploreArticle {
  final int id;
  final String articleTitle;
  final String redirectLink;
  final String articleImg;
  final String articleDescription;
  final String? specialityId;
  final int rewardPoints;
  final String? keywordsList;
  final String? articleUniqueId;
  final int articleType;
  final String createdAt;

  ExploreArticle({
    required this.id,
    required this.articleTitle,
    required this.redirectLink,
    required this.articleImg,
    required this.articleDescription,
    this.specialityId,
    required this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  factory ExploreArticle.fromJson(Map<String, dynamic> json) {
    return ExploreArticle(
      id: json['id'],
      articleTitle: json['articleTitle'],
      redirectLink: json['redirectLink'],
      articleImg: json['articleImg'],
      articleDescription: json['articleDescription'],
      specialityId: json['specialityId'],
      rewardPoints: json['rewardPoints'],
      keywordsList: json['keywordsList'],
      articleUniqueId: json['articleUniqueId'],
      articleType: json['articleType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'redirectLink': redirectLink,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}

class TrendingArticle {
  final int id;
  final String articleTitle;
  final String redirectLink;
  final String articleImg;
  final String articleDescription;
  final String? specialityId;
  final int rewardPoints;
  final String? keywordsList;
  final String? articleUniqueId;
  final int articleType;
  final String createdAt;

  TrendingArticle({
    required this.id,
    required this.articleTitle,
    required this.redirectLink,
    required this.articleImg,
    required this.articleDescription,
    this.specialityId,
    required this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  factory TrendingArticle.fromJson(Map<String, dynamic> json) {
    return TrendingArticle(
      id: json['id'],
      articleTitle: json['articleTitle'],
      redirectLink: json['redirectLink'],
      articleImg: json['articleImg'],
      articleDescription: json['articleDescription'],
      specialityId: json['specialityId'],
      rewardPoints: json['rewardPoints'],
      keywordsList: json['keywordsList'],
      articleUniqueId: json['articleUniqueId'],
      articleType: json['articleType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'redirectLink': redirectLink,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}

class Article {
  final int id;
  final String articleTitle;
  final String redirectLink;
  final String articleImg;
  final String articleDescription;
  final String specialityId;
  final int rewardPoints;
  final String keywordsList;
  final String? articleUniqueId;
  final int articleType;
  final String createdAt;

  Article({
    required this.id,
    required this.articleTitle,
    required this.redirectLink,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      articleTitle: json['articleTitle'],
      redirectLink: json['redirectLink'],
      articleImg: json['articleImg'],
      articleDescription: json['articleDescription'],
      specialityId: json['specialityId'],
      rewardPoints: json['rewardPoints'],
      keywordsList: json['keywordsList'],
      articleUniqueId: json['articleUniqueId'],
      articleType: json['articleType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'redirectLink': redirectLink,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}

class Bulletin {
  final int id;
  final String articleTitle;
  final String redirectLink;
  final String articleImg;
  final String articleDescription;
  final String? specialityId;
  final int rewardPoints;
  final String? keywordsList;
  final String? articleUniqueId;
  final int articleType;
  final String? createdAt;

  Bulletin({
    required this.id,
    required this.articleTitle,
    required this.redirectLink,
    required this.articleImg,
    required this.articleDescription,
    this.specialityId,
    required this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    required this.articleType,
    this.createdAt,
  });

  factory Bulletin.fromJson(Map<String, dynamic> json) {
    return Bulletin(
      id: json['id'],
      articleTitle: json['articleTitle'],
      redirectLink: json['redirectLink'],
      articleImg: json['articleImg'],
      articleDescription: json['articleDescription'],
      specialityId: json['specialityId'],
      rewardPoints: json['rewardPoints'],
      keywordsList: json['keywordsList'],
      articleUniqueId: json['articleUniqueId'],
      articleType: json['articleType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'redirectLink': redirectLink,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}
