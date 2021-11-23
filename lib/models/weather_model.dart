class WeatherModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherData>? list;

  WeatherModel({this.cod, this.message, this.cnt, this.list});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list!.add(WeatherData.fromJson(v));
      });
    }
  }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['cod'] = this.cod;
  //   data['message'] = this.message;
  //   data['cnt'] = this.cnt;
  //   if (this.list != null) {
  //     data['list'] = this.list.map((v) => v.toJson()).toList();
  //   }
  //   if (this.city != null) {
  //     data['city'] = this.city.toJson();
  //   }
  //   return data;
  // }
}

class WeatherData {
  int? dt;
  List<Weather>? weather;
  int? visibility;
  String? pop;
  String? dtTxt;

  WeatherData({
    this.dt,
    this.weather,
    this.visibility,
    this.pop,
    this.dtTxt,
  });

  WeatherData.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    visibility = json['visibility'];
    pop = json['pop'].toString();
    dtTxt = json['dt_txt'];
  }

  // Map<String, dynamic> toJson() {
  //   dt:
  //   'dt';
  //
  //   if (weather != null) {
  //     data['weather'] = weather!.map((v) => v.toJson()).toList();
  //   }
  //   data['visibility'] = visibility;
  //   data['pop'] = pop;
  //
  //   return data;
  // }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather(this.id, this.main, this.description, this.icon);

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  // Map<String, dynamic> toJson(Map<String, dynamic> data) {
  //   data['id'] = id;
  //   data['main'] = main;
  //   data['description'] = description;
  //   data['icon'] = icon;
  //   return data;
  // }
}
