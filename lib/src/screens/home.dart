import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/cat.dart';
class Home extends StatefulWidget{
  HomeState createState()=>HomeState();
  
}
class HomeState extends State<Home> with TickerProviderStateMixin{
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;
  initState(){
    super.initState();
    boxController=AnimationController(
      vsync: this, 
      duration :Duration(milliseconds: 100),
       );
boxAnimation=Tween(begin: pi*0.6, end: pi*.65,).animate(
  CurvedAnimation(
    curve:Curves.easeInOut,
    parent: boxController,
     ),
);
boxAnimation.addStatusListener((status){
  if(status==AnimationStatus.completed){
    boxController.reverse();
  }else if(status==AnimationStatus.dismissed)
  {
    boxController.forward();
  }
}
);
boxController.forward();
    catController=AnimationController(
      duration : Duration(milliseconds: 200),
      vsync: this,
    );
    catAnimation=Tween(begin : -25.0, end :-83.0).animate(
      CurvedAnimation(
        parent: catController,
        curve : Curves.easeIn,
      ),
        );
        //
  }

onTap(){
  //RboxController.stop();
  if(catController.status==AnimationStatus.completed){
    catController.reverse();
    boxController.forward();
  }else if(catController.status==AnimationStatus.dismissed){
  catController.forward();
  boxController.stop();
  }
}
  Widget build(context){
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.pinkAccent,
      title: Text('Hey!'),
      ),
      backgroundColor: Colors.pink[50],
      body: GestureDetector(
        
        child:Center(
          
          child: 
          Stack(
            overflow: Overflow.visible,
          children :[
            buildCatAnimation(),
            buildBox(),
            buildLeftFlap(),
            buildRightFlap(),
           
          ],
        ),
        ),
         
        onTap: onTap,
      ),
      );
  }
  Widget buildCatAnimation(){
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context,child){
        return Positioned(
          child: child,
          top : catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
 
  }

  Widget buildBox(){
    return Container(
      height :200.0,
      width: 200.0,
      color: Colors.brown[400],
      );
  }
  Widget buildLeftFlap(){
    return Positioned(
      left: 3.0,
      child:    AnimatedBuilder(
      animation:boxAnimation ,
      child :Container(
      height: 20.0,
      width : 105.0,
      color: Colors.brown[400],
    ),
    builder: (context,child){
      return Transform.rotate(
        child: child,
        alignment: Alignment.topLeft,
        angle : boxAnimation.value,
      );
    }
      ),
      ) ;


  }
Widget buildRightFlap(){
    return Positioned(
      right: 3.0,
      child:    AnimatedBuilder(
      animation:boxAnimation ,
      child :Container(
      height: 20.0,
      width : 105.0,
      color: Colors.brown[400],
    ),
    builder: (context,child){
      return Transform.rotate(
        child: child,
        alignment: Alignment.topRight,
        angle : -boxAnimation.value,
      );
    }
      ),
      ) ;


  }
}  