import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  int _item = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.select_category,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.view_all,
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _item = 1;
                  setState(() {});
                },
                child: _changeColorPhones(_item),
              ),
              InkWell(
                onTap: () {
                  _item = 2;
                  setState(() {});
                },
                child: _changeColorComputer(_item),
              ),
              InkWell(
                onTap: () {
                  _item = 3;
                  setState(() {});
                },
                child: _changeColorHealth(_item),
              ),
              InkWell(
                onTap: () {
                  _item = 4;
                  setState(() {});
                },
                child: _changeColorBooks(_item),
              ),
            ],
          )
        ],
      ),
    );
  }

  //Методы смены активной категории Телефоны
  Widget _changeColorPhones(item) {
    if (item == 1) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.PHONE_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            AppLocalizations.of(context)!.phones,
            style: const TextStyle(
                color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      );
    } else {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.PHONE_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(AppLocalizations.of(context)!.phones),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      );
    }
  }

  //Методы смены активной категории Компьютеры
  Widget _changeColorComputer(item) {
    if (item == 2) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.COMPUTER_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            AppLocalizations.of(context)!.computer,
            style: TextStyle(
                color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.COMPUTER_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            AppLocalizations.of(context)!.computer,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      );
    }
  }

  //Методы смены активной категории Здоровье
  Widget _changeColorHealth(item) {
    if (item == 3) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.HEALTH_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
    AppLocalizations.of(context)!.health,
            style: const TextStyle(
                color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.HEALTH_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            AppLocalizations.of(context)!.health,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      );
    }
  }

  //Методы смены активной категории Книги
  Widget _changeColorBooks(item) {
    if (item == 4) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.BOOKS_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            AppLocalizations.of(context)!.books,
            style: const TextStyle(
                color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage(Constants.BOOKS_ICON),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            AppLocalizations.of(context)!.books,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      );
    }
  }
}
