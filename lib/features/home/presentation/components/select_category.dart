import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectCategory extends StatefulWidget {

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  int _item = 1;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text(
                'Select Category',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'view all',
                    style: TextStyle(color: Colors.deepOrangeAccent),
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
    if(item == 1){
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage('assets/icons/home_page/phones_icon.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(height: 5,),
          Text('Phones', style: TextStyle(color: Colors.deepOrangeAccent),),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      );
    } else { return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          child: const Image(
            height: 35,
            image: AssetImage('assets/icons/home_page/phones_icon.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        SizedBox(height: 5,),
        Text('Phones'),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );}
  }
  //Методы смены активной категории Компьютеры
  Widget _changeColorComputer(item) {
    if(item == 2){
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage('assets/icons/home_page/computer_icon.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(height: 5,),
          Text('Computer', style: TextStyle(color: Colors.deepOrangeAccent),),
        ],
      );
    } else { return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          child: const Image(
            height: 35,
            image: AssetImage('assets/icons/home_page/computer_icon.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        SizedBox(height: 5,),
        Text('Computer'),
      ],
    );}
  }

  //Методы смены активной категории Здоровье
  Widget _changeColorHealth(item) {
    if(item == 3){
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image:  AssetImage('assets/icons/home_page/health_icon.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(height: 5,),
          const Text('Health', style: TextStyle(color: Colors.deepOrangeAccent),),
        ],
      );
    } else { return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          child: const Image(
            height: 35,
            image:  AssetImage('assets/icons/home_page/health_icon.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(height: 5,),
        const Text('Health'),
      ],
    );}
  }

  //Методы смены активной категории Книги
  Widget _changeColorBooks(item) {
    if(item == 4){
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: const Image(
              height: 35,
              image: AssetImage('assets/icons/home_page/books_icon.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(height: 5,),
          const Text('Books', style: TextStyle(color: Colors.deepOrangeAccent),),
        ],
      );
    } else { return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          child: const Image(
            height: 35,
            image: AssetImage('assets/icons/home_page/books_icon.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(height: 5,),
        const Text('Books'),
      ],
    );}
  }
}