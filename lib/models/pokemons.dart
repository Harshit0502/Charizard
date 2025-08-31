// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

class Pokemons {
  List<Pokemon>? pokemon;

  Pokemons({this.pokemon});

  Pokemons.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  dynamic id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  String? egg;
  dynamic spawnChance;
  dynamic avgSpawns;
  String? spawnTime;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;
  List<PrevEvolution>? prevEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'];
    avgSpawns = json['avg_spawns'];
    spawnTime = json['spawn_time'];
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(NextEvolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolution>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['weaknesses'] = this.weaknesses;
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution!.map((v) => v.toJson()).toList();
    }
    if (this.prevEvolution != null) {
      data['prev_evolution'] =
          this.prevEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, num: $num, name: $name, img: $img, type: $type, height: $height, weight: $weight, candy: $candy, egg: $egg, spawnChance: $spawnChance, avgSpawns: $avgSpawns, spawnTime: $spawnTime, weaknesses: $weaknesses, nextEvolution: $nextEvolution, prevEvolution: $prevEvolution)';
  }

  bool isEqual(Pokemon other) {
    return this.toString() == other.toString();
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': num,
      'name': name,
    };
  }

  factory NextEvolution.fromMap(Map<String, dynamic> map) {
    return NextEvolution(
      num: map['num'] != null ? map['num'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}

class PrevEvolution {
  String? num;
  String? name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': num,
      'name': name,
    };
  }

  factory PrevEvolution.fromMap(Map<String, dynamic> map) {
    return PrevEvolution(
      num: map['num'] != null ? map['num'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}
