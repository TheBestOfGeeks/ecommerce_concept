# ecommerce_concept

Тестовое демо приложение.
UI написан с фигмы - https://www.figma.com/file/KqZcU5m3GMxAHwgFkvCONz/ECOMMERCE?node-id=2%3A845 

Разбиение слоёв приложения реализовано по чистой архитектуре.

В качестве стэйт менеджера используется BLoC.

Данные тянутся по http с фекового API.

В приложении реализованы следующие фичи:

SQL - При первом входе в приложение мы данные грузим из бэка и записываем в БД, при втором входе данные берем уже из БД
Cвой DAO класс для каждого экрана

Через FireBase реализованы Push Notifications и Deep link

Google Map и Permissions - 
На главном экране при нажатии на "Zihuatanejo" открывается новый экран с картой
На этом экране лишь карта и кнопка "Найти меня"
На карту высыпано 10 рандомных пинов
При нажатии на "Найти меня" сначала показывается системное окно с разрешением на геолокацию.

Мультиязычность - 
Реализовано 2 варианта перевода (русский/english) всех текстов, которые не от сервера.
Если в настройках смартфона базовый язык русский, то весь интерфейс на русском.
Если любой другой язык, то язык приложения английский.


http responce :

{
  "home_store": [
    {
      "id": 1,
      "is_new": true,
      "title": "Iphone 12",
      "subtitle": "Súper. Mega. Rápido.",
      "picture": "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both",
      "is_buy" : true
    },
    {
      "id": 2,
      "title": "Samsung Galaxy A71",
      "subtitle": "Súper. Mega. Rápido.",
      "picture": "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg",
      "is_buy" : true
    },
    {
      "id": 3,
      "title": "Xiaomi Mi 11 ultra",
      "subtitle": "Súper. Mega. Rápido.",
      "picture": "https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg",
      "is_buy" : true
    }
  ],
  "best_seller": [
    {
      "id": 111,
      "is_favorites": true,
      "title": "Samsung Galaxy s20 Ultra",
      "price_without_discount": 1047,
      "discount_price": 1500,
      "picture": "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"
    },
    {
      "id": 222,
      "is_favorites": true,
      "title": "Xiaomi Mi 10 Pro",
      "price_without_discount": 300,
      "discount_price": 400,
      "picture": "https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg"
    },
    {
      "id": 3333,
      "is_favorites": true,
      "title": "Samsung Note 20 Ultra",
      "price_without_discount": 1047,
      "discount_price": 1500,
      "picture": "https://opt-1739925.ssl.1c-bitrix-cdn.ru/upload/iblock/c01/c014d088c28d45b606ed8c58e5817172.jpg?160405904823488"
    },
    {
      "id": 4444,
      "is_favorites": true,
      "title": "Motorola One Edge ",
      "price_without_discount": 300,
      "discount_price": 400,
      "picture": "https://www.benchmark.rs/assets/img/news/edge1.jpg"
    }
  ]

}


{
  "CPU": "Exynos 990",
  "camera": "108 + 12 mp",
  "capacity": [
    "126",
    "252"
  ],
  "color": [
    "#772D03",
    "#010035"
  ],
  "id": "3",
  "images": [
    "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
    "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"
  ],
  "isFavorites": true,
  "price": 1500,
  "rating": 4.5,
  "sd": "256 GB",
  "ssd": "8 GB",
  "title": "Galaxy Note 20 Ultra"
}

{
  "basket": [
    {
      "id": 1,
      "images": "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
      "price": 1500,
      "title": "Galaxy Note 20 Ultra"
    },
    {
      "id": 2,
      "images": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-silver-select?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1631652954000",
      "price": 1800,
      "title": "iPhone 13"
    }
  ],
  "delivery": "Free",
  "id": "4",
  "total": 3300
}
