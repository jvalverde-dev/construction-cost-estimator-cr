class TypologyContent {
  final String estructura;
  final String paredes;
  final String cubierta;
  final String cielos;
  final String entrepisos;
  final String pisos;

  const TypologyContent({
    required this.estructura,
    required this.paredes,
    required this.cubierta,
    required this.cielos,
    required this.entrepisos,
    required this.pisos,
  });
}

const Map<String, TypologyContent> typologyData = {
  // ============================================
  // CONCRETO (VC)
  // ============================================
  'VC01': TypologyContent(
    estructura: 'Mampostería integral, prefabricado.',
    paredes:
        'Bloques de concreto, baldosas prefabricadas con repello quemado, '
        'internas con láminas de cemento, fibra de vidrio y malla electrosoldada '
        'a un forro o prefabricadas, pintura acrílica económica. '
        'Alturas de 2,40 m a 2,50 m.',
    cubierta:
        'Cerchas de perfiles metálicos, techos de láminas onduladas de '
        'hierro galvanizado N°28, canoas de PVC o hierro galvanizado.',
    cielos: 'Tablilla PVC, total o parcial, o sin cielos.',
    entrepisos:
        'Viguetas prefabricadas, coladas en sitio, o metal con láminas de '
        'cemento, fibra de vidrio y malla electrosoldada.',
    pisos:
        'Cerámica económica, en algunos casos con concreto con acabado lujado.',
  ),
  'VC02': TypologyContent(
    estructura:
        'Concreto, mampostería integral, prefabricado o perfiles metálicos.',
    paredes:
        'Bloques de concreto, baldosas prefabricadas con repello quemado, '
        'internas de cemento, fibra de vidrio y malla electrosoldada a un forro '
        'o prefabricadas, pintura acrílica o de aceite económica, fachaleta en '
        'algunas áreas. Alturas de 2,40 m a 3,00 m.',
    cubierta:
        'Cerchas de perfiles metálicos, techos de láminas onduladas de '
        'hierro galvanizado N°28, canoas y bajantes de hierro galvanizado o PVC.',
    cielos:
        'Tablilla PVC, láminas de yeso, cemento y/o fibra de vidrio y malla '
        'electrosoldada o similar.',
    entrepisos:
        'Viguetas prefabricadas, coladas en sitio, o metal con láminas de '
        'cemento, fibra de vidrio y malla electrosoldada.',
    pisos: 'Terrazo, cerámica económica o mosaico.',
  ),
  'VC03': TypologyContent(
    estructura:
        'Concreto, mampostería integral, prefabricado o perfiles metálicos.',
    paredes:
        'Bloques de concreto, láminas de cemento, fibra de vidrio y malla '
        'electrosoldada o baldosas prefabricadas, paredes internas con láminas '
        'de yeso, cemento y fibra de vidrio o similar a doble forro, repello '
        'con acabado afinado y pintura acrílica o de aceite de regular calidad, '
        'fachaleta en algunas áreas. Alturas de 2,40 m a 3,50 m.',
    cubierta:
        'Cerchas de perfiles metálicos, techos de láminas onduladas de '
        'hierro galvanizado N°28, canoas y bajantes de hierro galvanizado o PVC.',
    cielos:
        'Tablilla PVC, láminas de yeso, cemento y fibra de vidrio o similar.',
    entrepisos:
        'Viguetas prefabricadas, coladas en sitio, o metal con láminas de '
        'cemento, fibra de vidrio y malla electrosoldada o losa de concreto.',
    pisos: 'Porcelanato, terrazo, mosaico y cerámica de mediana calidad.',
  ),
  'VC04': TypologyContent(
    estructura:
        'Concreto, mampostería integral, prefabricado, láminas estructurales '
        'con poliestireno o perfiles metálicos.',
    paredes:
        'Bloques de concreto, láminas estructurales con poliestireno, láminas '
        'de cemento, fibra de vidrio y malla electrosoldada o baldosas '
        'prefabricadas, internas con láminas de yeso, cemento y fibra de vidrio '
        'o similar a doble forro, repello con acabado afinado, pintura acrílica '
        'o de aceite de regular calidad, fachaleta y/o enchapes en algunas áreas. '
        'Alturas de 2,40 m a 4,00 m.',
    cubierta:
        'Cerchas en tubo estructural, perfiles metálicos, techos de láminas '
        'onduladas de hierro galvanizado N°28, canoas y bajantes de hierro '
        'galvanizado o PVC, precintas en láminas de cemento, fibra de vidrio '
        'y malla electrosoldada.',
    cielos:
        'Tablilla PVC, láminas de yeso, cemento y fibra de vidrio o similar.',
    entrepisos:
        'Viguetas prefabricadas, coladas en sitio, o metal con láminas de '
        'cemento, fibra de vidrio y malla electrosoldada o losa de concreto.',
    pisos: 'Porcelanato y cerámica de mediana calidad, madera laminada.',
  ),
  'VC05': TypologyContent(
    estructura:
        'Concreto, mampostería integral, prefabricado, láminas estructurales '
        'con poliestireno o perfiles metálicos.',
    paredes:
        'Bloques de concreto, láminas estructurales con poliestireno, láminas '
        'de cemento, fibra de vidrio y malla electrosoldada o baldosas '
        'prefabricadas, paredes internas con láminas de yeso, cemento y fibra '
        'de vidrio o similar a doble forro, repello con acabado afinado y '
        'pintura acrílica o de aceite de buena calidad, enchapes de ladrillo '
        'o fachaleta de buena calidad en algunas áreas. Alturas de 2,40 m a 4,00 m.',
    cubierta:
        'Cerchas en tubo estructural, perfiles metálicos, techos de láminas de '
        'hierro galvanizado esmaltado, teja de barro, asfáltica o metálica, '
        'canoas y bajantes de hierro galvanizado o PVC, precintas en láminas '
        'de cemento, fibra de vidrio y malla electrosoldada o madera.',
    cielos:
        'Tablilla PVC, láminas de yeso, cemento y fibra de vidrio o similar '
        'con diseños.',
    entrepisos:
        'Viguetas prefabricadas, coladas en sitio, o metal con láminas de '
        'cemento, fibra de vidrio y malla electrosoldada o losa de concreto.',
    pisos: 'Porcelanato y cerámica de buena calidad, madera laminada.',
  ),
  'VC06': TypologyContent(
    estructura:
        'Concreto, mampostería integral, láminas estructurales con poliestireno '
        'o perfiles metálicos.',
    paredes:
        'Bloques de concreto, láminas estructurales con poliestireno, internas '
        'de láminas de yeso, cemento y fibra de vidrio o similar a doble forro, '
        'repello con acabado afinado y pintura acrílica o de aceite de excelente '
        'calidad, enchapes de piedra, ladrillo o fachaleta de buena calidad en '
        'áreas extensas. Alturas de 2,50 m a 4,50 m.',
    cubierta:
        'Cerchas en tubo estructural, perfiles metálicos, techos de láminas de '
        'hierro galvanizado esmaltado, teja de barro, asfáltica, metálica o de '
        'concreto, canoas y bajantes de hierro galvanizado o PVC ocultos, '
        'precintas en láminas de cemento, fibra de vidrio y malla electrosoldada '
        'o madera.',
    cielos:
        'Láminas de yeso, cemento y fibra de vidrio o similar con diseños, '
        'artesonados de madera.',
    entrepisos:
        'Viguetas prefabricadas, coladas en sitio, o metal con láminas de '
        'cemento, fibra de vidrio y malla electrosoldada o losa de concreto.',
    pisos: 'Porcelanato de muy buena calidad, madera sólida.',
  ),
  'VC07': TypologyContent(
    estructura:
        'Concreto, mampostería integral, láminas estructurales con poliestireno '
        'o perfiles metálicos.',
    paredes:
        'Bloques de concreto, láminas estructurales con poliestireno, internas '
        'de láminas de yeso, cemento y fibra de vidrio o similar a doble forro, '
        'repello con acabado afinado y pintura acrílica o de aceite de excelente '
        'calidad, estuco veneciano, enchapes de piedra, ladrillo o fachaleta de '
        'excelente calidad en áreas extensas. Alturas de 2,60 m a 5,00 m.',
    cubierta:
        'Cerchas en tubo estructural, perfiles metálicos, techos de láminas de '
        'hierro galvanizado esmaltado, teja de barro, asfáltica, metálica o de '
        'concreto, canoas y bajantes de hierro galvanizado o PVC ocultos, '
        'precintas en láminas de cemento, fibra de vidrio y malla electrosoldada '
        'o madera.',
    cielos:
        'Láminas de yeso, cemento y fibra de vidrio o similar con diseños '
        'complejos, artesonados de madera fina.',
    entrepisos: 'Losa de concreto o metal con láminas de cemento.',
    pisos: 'Porcelanato de lujo, mármol, madera sólida fina.',
  ),
  'VC08': TypologyContent(
    estructura:
        'Concreto, mampostería integral, láminas estructurales con poliestireno '
        'o perfiles metálicos.',
    paredes:
        'Bloques de concreto, láminas estructurales con poliestireno, internas '
        'de láminas de yeso, cemento y fibra de vidrio o similar a doble forro, '
        'repello con acabado afinado y pintura acrílica o de aceite de excelente '
        'calidad, estuco veneciano, enchapes de piedra, ladrillo, mármol o '
        'granito de excelente calidad en áreas extensas. Alturas de 2,80 m a 6,00 m.',
    cubierta:
        'Estructura metálica compleja, techos de láminas de hierro galvanizado '
        'esmaltado, teja de barro, asfáltica, metálica o de concreto, canoas y '
        'bajantes de hierro galvanizado o PVC ocultos, precintas en láminas de '
        'cemento, fibra de vidrio y malla electrosoldada o madera.',
    cielos:
        'Láminas de yeso, cemento y fibra de vidrio o similar con diseños muy '
        'complejos, artesonados de madera muy fina.',
    entrepisos: 'Losa de concreto o metal con láminas de cemento.',
    pisos: 'Porcelanato de lujo, mármol, madera sólida muy fina.',
  ),
  'VC09': TypologyContent(
    estructura: 'Concreto reforzado, estructuras de acero complejas.',
    paredes:
        'Concreto, vidrio templado de seguridad, acabados de ultra lujo, mármol '
        'importado, piedras exóticas, maderas preciosas, sistemas inteligentes '
        'integrados.',
    cubierta:
        'Techos con diseños arquitectónicos únicos, materiales importados de la '
        'más alta calidad, sistemas de recolección de agua pluvial integrados.',
    cielos:
        'Diseños artísticos personalizados, alturas dobles o triples, materiales '
        'acústicos y térmicos de vanguardia, automatización de iluminación.',
    entrepisos: 'Losa de concreto postensado o sistemas de alta ingeniería.',
    pisos:
        'Mármol de gran formato importado, granito exótico, maderas preciosas '
        'con diseños especiales.',
  ),
  'VC10': TypologyContent(
    estructura:
        'Sistemas estructurales avanzados, concreto de alta resistencia, acero '
        'inoxidable.',
    paredes:
        'Muros cortina de vidrio de alta tecnología, acabados exclusivos hechos '
        'a medida, revestimientos de metales preciosos o piedras semipreciosas, '
        'domótica total.',
    cubierta:
        'Cubiertas verdes transitables, sistemas de energía solar integrados, '
        'diseños escultóricos.',
    cielos:
        'Obras de arte integradas, sistemas de climatización e iluminación '
        'invisibles.',
    entrepisos:
        'Sistemas estructurales de grandes luces sin columnas intermedias.',
    pisos: 'Materiales únicos de canteras exclusivas, diseños de autor.',
  ),

  // ============================================
  // LIVIANO (VS)
  // ============================================
  'VS01': TypologyContent(
    estructura:
        'Perfiles de acero galvanizado fijados con tornillos de acero galvanizado '
        'en la base, vigas y elementos horizontales y verticales.',
    paredes:
        'Exteriores e internas de láminas de yeso, cemento y fibra de vidrio o '
        'similar a doble forro, algunas veces a un forro. Fachaleta y/o enchapes '
        'en algunas áreas. Repello con acabado afinado y pintura acrílica o de '
        'aceite de regular calidad. Algunas viviendas presentan las paredes '
        'externas especialmente las laterales con láminas de hierro estructural. '
        'Alturas de 2,40 m a 3,50 m.',
    cubierta:
        'Cerchas de perfiles metálicos, techos de láminas onduladas de hierro '
        'galvanizado N°28 sin canoas.',
    cielos:
        'Tablilla PVC, láminas de yeso, cemento y fibra de vidrio o similar.',
    entrepisos:
        'Perfiles de metal con láminas de cemento, fibra de vidrio y malla '
        'electrosoldada.',
    pisos:
        'Loseta de vinil, madera laminada, cerámica o similar. Puede estar sobre '
        'bases de concreto. Porcelanato y cerámica de mediana calidad.',
  ),
  'VS02': TypologyContent(
    estructura:
        'Perfiles de acero galvanizado de mayor calibre y complejidad estructural.',
    paredes:
        'Exteriores e internas de láminas de yeso, cemento y fibra de vidrio de '
        'alta calidad a doble forro, con aislamientos térmicos y acústicos '
        'internos. Acabados finos de repello, pintura de alta calidad, enchapes '
        'decorativos extensos. Alturas superiores a 2,60 m.',
    cubierta:
        'Cerchas de perfiles metálicos reforzados, techos de láminas esmaltadas, '
        'teja asfáltica o metálica con canoas y bajantes ocultos.',
    cielos: 'Gypsum con diseños, artesonados ligeros, iluminación empotrada.',
    entrepisos:
        'Estructura metálica reforzada con entrepisos sólidos o láminas de '
        'alta densidad.',
    pisos:
        'Porcelanato, cerámica de alta calidad, madera laminada de alto tránsito.',
  ),

  // ============================================
  // MADERA (VM)
  // ============================================
  'VM01': TypologyContent(
    estructura:
        'Zócalo de bloques de concreto, madera generalmente de cedro en '
        'columnas, cadenillos y soleras de 5 cm x 7.5 cm.',
    paredes:
        'Un solo forro de tabla o láminas de cemento, fibra de vidrio y malla '
        'electrosoldada, madera, en algunos casos las laterales forradas con '
        'láminas de hierro galvanizado, estructural, o internas de láminas de '
        'cemento, fibra de vidrio y malla electrosoldada a un forro.',
    cubierta:
        'Cerchas de madera o perfiles metálicos, techos de láminas onduladas de '
        'hierro galvanizado N°28 a una o dos aguas, sin canoas ni bajantes.',
    cielos: 'Tabla, madera aglomerada o similar.',
    entrepisos: 'Sin entrepiso.',
    pisos: 'Tablón semiduro, cascote o mosaico.',
  ),
  'VM02': TypologyContent(
    estructura:
        'Zócalo de bloques de concreto o baldosas, madera generalmente de cedro '
        'en columnas, cadenillos y soleras de 7.5 cm x 10 cm o perfiles metálicos.',
    paredes:
        'Un solo forro de tablilla biselada de 2da calidad o láminas de cemento, '
        'fibra de vidrio y malla electrosoldada.',
    cubierta:
        'Cerchas de madera o perfiles metálicos. Techos de láminas onduladas de '
        'hierro galvanizado N°28 a dos aguas. Canoas y bajantes de hierro '
        'galvanizado.',
    cielos: 'Tablilla PVC, celotex o similar.',
    entrepisos: 'Viguetas y tablón de madera de 2da calidad.',
    pisos: 'Tablón semiduro, concreto lujado o cerámica económica.',
  ),
  'VM03': TypologyContent(
    estructura:
        'Madera generalmente de cedro en columnas, cadenillos y soleras de '
        '10 cm x 15 cm.',
    paredes:
        'Doble forro en tablilla biselada, de buena calidad como laurel, ciprés '
        'y surá, algunas de láminas de cemento, fibra de vidrio y malla '
        'electrosoldada.',
    cubierta:
        'Cerchas de madera, perfiles metálicos. Teja de hierro galvanizado o '
        'similar, a dos y cuatro aguas. Canoas y bajantes de hierro galvanizado.',
    cielos:
        'Tablilla PVC, artesonados, tablilla biselada de buena calidad o similar.',
    entrepisos: 'Viguetas y tablones de madera de buena calidad.',
    pisos:
        'Madera tipo tabloncillo machihembrado, madera laminada, terrazo, loseta '
        'de barro, mosaico artesanal con diseños especiales, cerámica rústica '
        'o similar.',
  ),
  'VM04': TypologyContent(
    estructura:
        'Maderas finas y tratadas, columnas y vigas de grandes dimensiones, '
        'detalles estructurales vistos.',
    paredes:
        'Doble forro de maderas preciosas (Cristóbal, Cenízaro, Teca, etc.), '
        'acabados de barniz marino o poliuretano de alta resistencia. Diseños '
        'arquitectónicos complejos.',
    cubierta:
        'Estructura de madera compleja, teja de barro, teja asfáltica de alta '
        'gama o cubierta de cobre/metal oxidado. Canoas de cobre o PVC oculto.',
    cielos: 'Artesonados complejos de maderas finas, alturas dobles.',
    entrepisos: 'Vigas y duelas de maderas preciosas de alto espesor.',
    pisos: 'Parquet, maderas preciosas, combinaciones con piedra natural.',
  ),

  // ============================================
  // BAMBÚ (VB)
  // ============================================
  'VB01': TypologyContent(
    estructura:
        'Bambú, zócalo de bloques de concreto, entramado de bambú con estructura '
        'de madera de 10 cm x 15 cm.',
    paredes: 'Bambú recubierto con mortero.',
    cubierta:
        'Cerchas de bambú. Láminas onduladas de hierro galvanizado con canoas '
        'y bajantes.',
    cielos: 'Sin cielos.',
    entrepisos: 'Sin entrepiso.',
    pisos: 'Cerámica económica, en algunos casos con concreto lujado.',
  ),
};
