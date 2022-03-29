import 'package:flutter/material.dart';
import 'data/models/meal.dart';

List<Meal> DUMMY_MEALS = [
  Meal(
      id: 1,
      title: 'Гавайи',
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
  Meal(
      id: 2,
      title: 'Гавайи',
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
      imageUrl: 'assets/meal/meal1.png'),
  Meal(
      id:3,
      title: 'Гавайи',
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
      imageUrl: 'assets/meal/meal2.png'),
  Meal(
      id: 4,
      title: 'Гавайи',
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
      imageUrl: 'assets/meal/meal3.png'),
  Meal(
      id: 5,
      title: 'Гавайи',
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
      imageUrl: 'assets/meal/meal4.png'),
  Meal(
      id: 6,
      title: 'Гавайи',
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
      imageUrl: 'assets/meal/meal5.png'),
];

List<Meal> DUMMY_MEALS_UZ = [
  Meal(
      id: 1,
      title: 'Gavayi',
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
  Meal(
      id: 2,
      title: 'Gavayi',
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
      imageUrl: 'assets/meal/meal1.png'),
  Meal(
      id: 3,
      title: 'Gavayi',
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
      imageUrl: 'assets/meal/meal2.png'),
  Meal(
      id: 4,
      title: 'Gavayi',
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
      imageUrl: 'assets/meal/meal3.png'),
  Meal(
      id: 5,
      title: 'Gavayi',
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
      imageUrl: 'assets/meal/meal4.png'),
  Meal(
     id: 6,
      title: 'Gavayi',
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
      imageUrl: 'assets/meal/meal5.png'),
];


List<Meal> DUMMY_DRINK = [
  Meal(
      id: 1,
      title: 'Coca-Cola',
      subType: 'Напитки',
      typeMeal: 'Газированная',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/cola.png'),
  Meal(
      id: 2,
      title: 'Coffe',
      subType: 'Напитки',
      typeMeal: 'Горячий',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/coffe.png'),
  Meal(
      id: 3,
      title: 'Fanta',
      subType: 'Напитки',
      typeMeal: 'Газированная',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/fanta.png'),
  Meal(
      id: 4,
      title: 'Juice',
      subType: 'Напитки',
      typeMeal: 'Сок',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/juice.png'),
  Meal(
      id: 5,
      title: 'Pepsi-Cola',
      subType: 'Напитки',
      typeMeal: 'Газированная',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/pepsi.png'),


];
List<Meal> DUMMY_DRINK_UZ = [
  Meal(
      id: 1,
      title: 'Coca-Cola',
      subType: 'Ichimliklar',
      typeMeal: 'Gazlangan',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/cola.png'),
  Meal(
      id: 2,
      title: 'Coffe',
      subType: 'Ichimliklar',
      typeMeal: 'Qaynoq',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/coffe.png'),
  Meal(
      id: 3,
      title: 'Fanta',
      subType: 'Ichimliklar',
      typeMeal: 'Gazlangan',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/fanta.png'),
  Meal(
      id: 4,
      title: 'Sharbat',
      subType: 'Ichimliklar',
      typeMeal: 'Gazlanmagan',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:10000,
      imageUrl: 'assets/drink/juice.png'),
  Meal(
      id: 5,
      title: 'Pepsi-Cola',
      subType: 'Ichimliklar',
      typeMeal: 'Gazlangan',
      ingriedent: [],
      videoId: '',
      description: "",
      cost:9000,
      imageUrl: 'assets/drink/pepsi.png'),
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