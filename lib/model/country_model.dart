class CountryResponse {
  List<Country>? country;
  String? name;

  CountryResponse({this.country, this.name});

  CountryResponse.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(Country.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}

class Country {
  String? countryId;
  double? probability;

  Country({this.countryId, this.probability});

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['probability'] = probability;
    return data;
  }
}
