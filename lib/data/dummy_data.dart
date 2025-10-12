import 'package:flutter/material.dart';

import 'package:meal_museum/models/category.dart';
import 'package:meal_museum/models/meal.dart';

// Constants in Dart should be written in lowerCamelcase.
const availableCategories = [
  Category(
    id: 'c1',
    title: 'Italiano',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Fácil e rapido',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Hambúrgueres',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Alemão',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Leve e adorável',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Exótico',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Café da manhã',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Asiático',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Francês',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Verão',
    color: Colors.teal,
  ),
];

const dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Espaguete com Molho de Tomate',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      '4 Tomates',
      '1 Colher de sopa de Azeite de Oliva',
      '1 Cebola',
      '250g de Espaguete',
      'Temperos',
      'Queijo (opcional)'
    ],
    steps: [
      'Corte os tomates e a cebola em pedaços pequenos.',
      'Ferva um pouco de água - adicione sal assim que ferver.',
      'Coloque o espaguete na água fervente - deve ficar pronto em cerca de 10 a 12 minutos.',
      'Enquanto isso, aqueça um pouco de azeite e adicione a cebola picada.',
      'Após 2 minutos, adicione os pedaços de tomate, sal, pimenta e seus outros temperos.',
      'O molho estará pronto quando o espaguete estiver.',
      'Sinta-se à vontade para adicionar um pouco de queijo por cima do prato finalizado.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Torrada Havaiana',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      '1 Fatia de Pão Branco',
      '1 Fatia de Presunto',
      '1 Rodela de Abacaxi',
      '1-2 Fatias de Queijo',
      'Manteiga'
    ],
    steps: [
      'Passe manteiga em um lado do pão branco',
      'Coloque camadas de presunto, abacaxi e queijo sobre o pão branco',
      'Asse a torrada por aproximadamente 10 minutos no forno a 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Hambúrguer Clássico',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      '300g de Carne Moída',
      '1 Tomate',
      '1 Pepino',
      '1 Cebola',
      'Ketchup',
      '2 Pães de Hambúrguer'
    ],
    steps: [
      'Forme 2 hambúrgueres',
      'Frite os hambúrgueres por aproximadamente 4 minutos de cada lado',
      'Frite rapidamente os pães por aproximadamente 1 minuto de cada lado',
      'Passe ketchup nos pães',
      'Sirva o hambúrguer com tomate, pepino e cebola'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Schnitzel Vienense',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      '8 Bifes de Vitela',
      '4 Ovos',
      '200g de Farinha de Rosca',
      '100g de Farinha de Trigo',
      '300ml de Manteiga',
      '100g de Óleo Vegetal',
      'Sal',
      'Rodelas de Limão'
    ],
    steps: [
      'Amacie a vitela até cerca de 2-4mm de espessura e tempere com sal dos dois lados.',
      'Em um prato raso, bata os ovos levemente com um garfo.',
      'Passe levemente os bifes na farinha de trigo, depois mergulhe no ovo e, por fim, empane na farinha de rosca.',
      'Aqueça a manteiga e o óleo em uma frigideira grande (deixe a gordura ficar bem quente) e frite os schnitzels até dourar dos dois lados.',
      'Certifique-se de mexer a panela regularmente para que os schnitzels fiquem cercados de óleo e a cobertura fique crocante.',
      'Retire e escorra em papel toalha. Frite a salsinha no óleo restante e escorra.',
      'Coloque os schnitzels em um prato aquecido e sirva decorado com salsinha e rodelas de limão.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salada com Salmão Defumado',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Rúcula',
      'Alface',
      'Salsinha',
      'Funcho',
      '200g de Salmão Defumado',
      'Mostarda',
      'Vinagre Balsâmico',
      'Azeite de Oliva',
      'Sal e Pimenta'
    ],
    steps: [
      'Lave e corte a salada e as ervas',
      'Corte o salmão em cubos',
      'Misture mostarda, vinagre e azeite de oliva para fazer um molho',
      'Monte a salada',
      'Adicione os cubos de salmão e o molho'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Deliciosa Mousse de Laranja',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    ingredients: [
      '4 Folhas de Gelatina',
      '150ml de Suco de Laranja',
      '80g de Açúcar',
      '300g de Iogurte',
      '200g de Creme de Leite',
      'Raspas de Laranja',
    ],
    steps: [
      'Dissolva a gelatina em uma panela',
      'Adicione o suco de laranja e o açúcar',
      'Retire a panela do fogo',
      'Adicione 2 colheres de sopa de iogurte',
      'Misture a gelatina ao iogurte restante',
      'Leve tudo à geladeira para esfriar',
      'Bata o creme de leite e incorpore à mistura de laranja',
      'Leve à geladeira novamente por pelo menos 4 horas',
      'Sirva com raspas de laranja',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Panquecas',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Xícaras de Farinha de Trigo',
      '3 1/2 Colheres de chá de Fermento em Pó',
      '1 Colher de chá de Sal',
      '1 Colher de sopa de Açúcar Branco',
      '1 1/4 xícaras de Leite',
      '1 Ovo',
      '3 Colheres de sopa de Manteiga derretida',
    ],
    steps: [
      'Em uma tigela grande, peneire a farinha, o fermento, o sal e o açúcar.',
      'Faça um buraco no centro e despeje o leite, o ovo e a manteiga derretida; misture até ficar homogêneo.',
      'Aqueça uma chapa ou frigideira levemente untada em fogo médio-alto.',
      'Despeje ou coloque a massa na chapa, usando aproximadamente 1/4 de xícara para cada panqueca. Doure dos dois lados e sirva quente.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Curry Cremoso de Frango Indiano',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      '4 Peitos de Frango',
      '1 Cebola',
      '2 Dentes de Alho',
      '1 Pedaço de Gengibre',
      '4 Colheres de sopa de Amêndoas',
      '1 Colher de chá de Pimenta Caiena',
      '500ml de Leite de Coco',
    ],
    steps: [
      'Corte e frite o peito de frango',
      'Processe a cebola, o alho e o gengibre em uma pasta e refogue tudo',
      'Adicione os temperos e refogue',
      'Adicione o peito de frango + 250ml de água e cozinhe tudo por 10 minutos',
      'Adicione o leite de coco',
      'Sirva com arroz'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Suflê de Chocolate',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      '1 Colher de chá de Manteiga derretida',
      '2 Colheres de sopa de Açúcar branco',
      '2 Onças de Chocolate amargo 70%, quebrado em pedaços',
      '1 Colher de sopa de Manteiga',
      '1 Colher de sopa de Farinha de Trigo',
      '4 1/3 colheres de sopa de Leite frio',
      '1 Pitada de Sal',
      '1 Pitada de Pimenta Caiena',
      '1 Gema de Ovo grande',
      '2 Claras de Ovo grandes',
      '1 Pitada de Cremor Tártaro',
      '1 Colher de sopa de Açúcar branco',
    ],
    steps: [
      'Preaqueça o forno a 190°C. Forre uma assadeira com borda com papel manteiga.',
      'Pincele o fundo e as laterais de 2 ramequins levemente com 1 colher de chá de manteiga derretida; cubra o fundo e as laterais até a borda.',
      'Adicione 1 colher de sopa de açúcar branco aos ramequins. Gire os ramequins até o açúcar cobrir todas as superfícies.',
      'Coloque os pedaços de chocolate em uma tigela de metal.',
      'Coloque a tigela sobre uma panela com cerca de 3 xícaras de água quente em fogo baixo.',
      'Derreta 1 colher de sopa de manteiga em uma frigideira em fogo médio. Polvilhe a farinha. Bata até a farinha incorporar na manteiga e a mistura engrossar.',
      'Bata o leite frio até a mistura ficar lisa e engrossar. Transfira a mistura para a tigela com o chocolate derretido.',
      'Adicione sal e pimenta caiena. Misture bem. Adicione a gema e misture para combinar.',
      'Deixe a tigela sobre a água quente (não fervendo) para manter o chocolate aquecido enquanto você bate as claras.',
      'Coloque 2 claras em uma tigela; adicione o cremor tártaro. Bata até a mistura começar a engrossar e um fio do batedor permanecer na superfície cerca de 1 segundo antes de desaparecer na mistura.',
      'Adicione 1/3 do açúcar e bata. Bata um pouco mais de açúcar por cerca de 15 segundos.',
      'Bata o restante do açúcar. Continue batendo até a mistura ficar espessa como creme de barbear e formar picos macios, de 3 a 5 minutos.',
      'Transfira um pouco menos da metade das claras para o chocolate.',
      'Misture até as claras estarem completamente incorporadas ao chocolate.',
      'Adicione o restante das claras; dobre delicadamente no chocolate com uma espátula, levantando do fundo e dobrando por cima.',
      'Pare de misturar quando as claras desaparecerem. Divida a mistura entre os 2 ramequins preparados. Coloque os ramequins na assadeira preparada.',
      'Asse no forno preaquecido até os suflês crescerem e ultrapassarem a borda dos ramequins, de 12 a 15 minutos.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Salada de Aspargos com Tomates Cereja',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    duration: 30,
    ingredients: [
      'Aspargos Brancos e Verdes',
      '30g de Pinhões',
      '300g de Tomates Cereja',
      'Salada',
      'Sal, Pimenta e Azeite de Oliva'
    ],
    steps: [
      'Lave, descasque e corte os aspargos',
      'Cozinhe em água salgada',
      'Tempere os aspargos com sal e pimenta',
      'Torre os pinhões',
      'Corte os tomates ao meio',
      'Misture com os aspargos, salada e molho',
      'Sirva com Baguete'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
