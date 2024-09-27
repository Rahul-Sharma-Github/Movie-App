class Movie {
  final double score;
  final Show? show;

  Movie({
    required this.score,
    required this.show,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }
}

class Show {
  final int id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final WebChannel? webChannel;
  final Externals? externals;
  final Images? image;
  final String? summary;
  final int? updated;
  final Links? links;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] ?? 0,
      url: json['url'],
      name: json['name'],
      type: json['type'],
      language: json['language'],
      genres: (json['genres'] as List?)?.map((e) => e as String).toList(),
      status: json['status'],
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered: json['premiered'],
      ended: json['ended'],
      officialSite: json['officialSite'],
      schedule:
          json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      weight: json['weight'],
      network:
          json['network'] != null ? Network.fromJson(json['network']) : null,
      webChannel: json['webChannel'] != null
          ? WebChannel.fromJson(json['webChannel'])
          : null,
      externals: json['externals'] != null
          ? Externals.fromJson(json['externals'])
          : null,
      image: json['image'] != null ? Images.fromJson(json['image']) : null,
      summary: json['summary'],
      updated: json['updated'],
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }
}

class Schedule {
  final String? time;
  final List<String>? days;

  Schedule({required this.time, required this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: (json['days'] as List?)?.map((e) => e as String).toList(),
    );
  }
}

class Rating {
  final double? average;

  Rating({required this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num?)?.toDouble(),
    );
  }
}

class Network {
  final int? id;
  final String? name;
  final Country? country;
  final String? officialSite;

  Network(
      {required this.id,
      required this.name,
      required this.country,
      required this.officialSite});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
      officialSite: json['officialSite'],
    );
  }
}

class Country {
  final String? name;
  final String? code;
  final String? timezone;

  Country({required this.name, required this.code, required this.timezone});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }
}

class WebChannel {
  final int? id;
  final String? name;
  final String? officialSite;

  WebChannel(
      {required this.id, required this.name, required this.officialSite});

  factory WebChannel.fromJson(Map<String, dynamic> json) {
    return WebChannel(
      id: json['id'],
      name: json['name'],
      officialSite: json['officialSite'],
    );
  }
}

class Externals {
  final int? tvrage;
  final int? thetvdb;
  final String? imdb;

  Externals({required this.tvrage, required this.thetvdb, required this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'],
    );
  }
}

class Images {
  final String? medium;
  final String? original;

  Images({required this.medium, required this.original});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      medium: json['medium'],
      original: json['original'],
    );
  }
}

class Links {
  final Link? self;
  final Link? previousepisode;

  Links({required this.self, required this.previousepisode});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] != null ? Link.fromJson(json['self']) : null,
      previousepisode: json['previousepisode'] != null
          ? Link.fromJson(json['previousepisode'])
          : null,
    );
  }
}

class Link {
  final String? href;
  final String? name;

  Link({required this.href, required this.name});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      href: json['href'],
      name: json['name'],
    );
  }
}
