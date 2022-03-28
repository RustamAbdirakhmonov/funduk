import 'package:flutter/material.dart';
import 'data/models/meal.dart';

List<Meal> DUMMY_MEALS = [
  Meal(title: 'Гавайи',
       subType: 'Салаты',
      typeMeal: 'Европейская',
      ingriedent: [
        'Куриная грудка',
        'черри',
        'свежая зелень',
        "маринованные вешенки",
        "кукуруза",
        "чеснок"
      ],
      videoId: 'WqFb6cm5knA',

      description: "Что бы мне не говорили, а самый вкусный шашлык получается из баранины. Есть правда один минус. На базаре невозможно купить нормальную баранину, все скупают на корню шашлычники.\n\n Не беда, если руки растут из нужного места, шашлык можно приготовить из того что оставили нам эти коршуны. Будем готовить бараньи ребрышки. Не те кусочки, где больше всего мяса, а те кусочки, которые остались после налета саранчи",
      cost:32000,
      imageUrl: 'assets/images/food1.png'),
];

List<Meal> DUMMY_MEALS_UZ = [
  Meal(title: 'Gavayi',
      subType: 'Salatlar',
      typeMeal: 'Yevropacha',
      ingriedent: [
        'Tovuq felesi',
        'cherry',
        'barra ko\'kat',
        "маринованные вешенки",
        "jo'xori",
        "chesnok"
      ],
      videoId: 'WqFb6cm5knA',

      description: "Menga nima deyishmasin, eng mazali shish kabob qo'zichoqdan keladi. Haqiqatan ham bitta kamchilik bor. Bozordan oddiy qo'y go'shti sotib bo'lmaydi, hamma tokda shish kabob sotib oladi.\n\n Qo'l to'g'ri joydan o'sadimi farqi yo'q, kabobni mana shu kitlar bizga qoldirgan narsadan pishirsa bo'ladi. Keling, qo'zichoq qovurg'alarini pishiramiz. Eng ko'p go'shtli bo'laklar emas, balki chigirtka bosqinidan keyin qolgan bo'laklar",
      cost:32000,
      imageUrl: 'assets/images/food1.png'),
];


List<Meal> DUMMY_DRINK = [
  Meal(title: 'Coca-Cola',
      subType: 'Напитки',
      typeMeal: 'Газированная',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/cola.png'),

];
List<Meal> DUMMY_DRINK_UZ = [
  Meal(title: 'Coca-Cola',
      subType: 'Ichimliklar',
      typeMeal: 'Gazlangan',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/cola.png'),

];

List<Color> COLORS=[
  Colors.orange.shade300,
  Colors.deepPurple.shade200,
  Colors.blue.shade200,
  Colors.cyan.shade300,
  Colors.pink.shade200,
  Colors.teal.shade100,
  Colors.indigo.shade200,
];