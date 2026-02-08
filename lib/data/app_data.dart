import '../models/data_models.dart';

class AppData {
  AppData._();

  static const List<ConstructionMaterial> materials = [
    ConstructionMaterial(
      name: 'Concreto',
      typologies: [
        Typology(id: 'VC01', costPerSqm: 260000),
        Typology(id: 'VC02', costPerSqm: 320000),
        Typology(id: 'VC03', costPerSqm: 365000),
        Typology(id: 'VC04', costPerSqm: 425000),
        Typology(id: 'VC05', costPerSqm: 485000),
        Typology(id: 'VC06', costPerSqm: 545000),
        Typology(id: 'VC07', costPerSqm: 700000),
        Typology(id: 'VC08', costPerSqm: 920000),
        Typology(id: 'VC09', costPerSqm: 1495000),
        Typology(id: 'VC10', costPerSqm: 1835000),
      ],
    ),
    ConstructionMaterial(
      name: 'Liviano',
      typologies: [
        Typology(id: 'VS01', costPerSqm: 310000),
        Typology(id: 'VS02', costPerSqm: 500000),
      ],
    ),
    ConstructionMaterial(
      name: 'Madera',
      typologies: [
        Typology(id: 'VM01', costPerSqm: 290000),
        Typology(id: 'VM02', costPerSqm: 425000),
        Typology(id: 'VM03', costPerSqm: 635000),
        Typology(id: 'VM04', costPerSqm: 985000),
      ],
    ),
    ConstructionMaterial(
      name: 'Bambú',
      typologies: [Typology(id: 'VB01', costPerSqm: 140000)],
    ),
  ];

  static const List<AposentoType> aposentoTypes = [
    AposentoType(name: 'Dormitorio', imagePath: 'assets/images/Dormitorio.png'),
    AposentoType(name: 'Sala', imagePath: 'assets/images/Sala.png'),
    AposentoType(name: 'Cocina', imagePath: 'assets/images/Cocina.png'),
    AposentoType(name: 'Comedor', imagePath: 'assets/images/Comedor.png'),
    AposentoType(name: 'Baño', imagePath: 'assets/images/Bano.png'),
    AposentoType(
      name: 'Estudio/Despacho',
      imagePath: 'assets/images/Estudio.png',
    ),
    AposentoType(
      name: 'Cuarto de Lavado',
      imagePath: 'assets/images/Lavanderia.png',
    ),
    AposentoType(
      name: 'Pasillo/Distribuidor',
      imagePath: 'assets/images/Pasillo.png',
    ),
    AposentoType(name: 'Garaje', imagePath: 'assets/images/Garaje.png'),
    AposentoType(
      name: 'Terraza/balcón',
      imagePath: 'assets/images/Terraza.png',
    ),
    AposentoType(
      name: 'Vivienda completa',
      imagePath: 'assets/images/CasaCompleta.png',
    ),
  ];
}
