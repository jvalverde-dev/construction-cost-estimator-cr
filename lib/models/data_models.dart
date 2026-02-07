import 'dart:convert';

class Typology {
  final String id;
  final double costPerSqm;

  const Typology({required this.id, required this.costPerSqm});

  Map<String, dynamic> toMap() {
    return {'id': id, 'costPerSqm': costPerSqm};
  }

  factory Typology.fromMap(Map<String, dynamic> map) {
    return Typology(
      id: map['id'] ?? '',
      costPerSqm: map['costPerSqm']?.toDouble() ?? 0.0,
    );
  }
}

class ConstructionMaterial {
  final String name;
  final List<Typology> typologies;

  const ConstructionMaterial({required this.name, required this.typologies});
}

class AposentoType {
  final String name;
  final String imagePath;

  const AposentoType({required this.name, required this.imagePath});

  Map<String, dynamic> toMap() {
    return {'name': name, 'imagePath': imagePath};
  }

  factory AposentoType.fromMap(Map<String, dynamic> map) {
    return AposentoType(
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}

class AposentoInstance {
  final String id;
  final AposentoType aposentoType;
  final Typology typology;
  final double area;
  final double totalCost;

  AposentoInstance({
    required this.id,
    required this.aposentoType,
    required this.typology,
    required this.area,
    required this.totalCost,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'aposentoType': aposentoType.toMap(),
      'typology': typology.toMap(),
      'area': area,
      'totalCost': totalCost,
    };
  }

  factory AposentoInstance.fromMap(Map<String, dynamic> map) {
    return AposentoInstance(
      id: map['id'] ?? '',
      aposentoType: AposentoType.fromMap(map['aposentoType']),
      typology: Typology.fromMap(map['typology']),
      area: map['area']?.toDouble() ?? 0.0,
      totalCost: map['totalCost']?.toDouble() ?? 0.0,
    );
  }
}

class Project {
  final String id;
  String name;
  final List<AposentoInstance> aposentos;
  final double totalArea;
  final double totalCost;

  Project({
    required this.id,
    required this.name,
    required this.aposentos,
    required this.totalArea,
    required this.totalCost,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'aposentos': aposentos.map((x) => x.toMap()).toList(),
      'totalArea': totalArea,
      'totalCost': totalCost,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      aposentos: List<AposentoInstance>.from(
        (map['aposentos'] as List<dynamic>).map<AposentoInstance>(
          (x) => AposentoInstance.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalArea: map['totalArea']?.toDouble() ?? 0.0,
      totalCost: map['totalCost']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);
}
