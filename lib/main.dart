
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
 late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

 

 List<String> img = [
  "assets/watches/1.png","assets/watches/2.png","assets/watches/3.png","assets/watches/1.png","assets/watches/3.png",
];
  int selectedIndex = 0;
  late AnimationController animateController;
  bool _anime=true;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(    
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color.fromARGB(255, 57, 56, 56),
                    height: 45,
                    width: 45,
                       child: IconButton(
                               icon: const Icon(Icons.chevron_left_sharp),
                               iconSize: 25,
                               color: Colors.white,
                               onPressed: () {},
                             ),),
                ), 
                ClipRRect(    
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color.fromARGB(255, 57, 56, 56),
                    height: 45,
                    width: 45,
                       child: IconButton(
                               icon: const Icon(Icons.table_rows_outlined),
                               iconSize: 25,
                               color: Colors.white,
                               onPressed: () {},
                             ),),
                ), 
              ],
            ),
          ),
           SizedBox(height: 10,),
        Container(
          child:Stack(
            children: [
                 Image.asset("assets/watches/0.png",
                    width: double.infinity,
                  ),

            Positioned(
              left: 10,
              top: 15,
              child: FadeInRight(   
                animate: _anime,
                controller: ( controller ) => animateController = controller,
                child: Image.asset(img[selectedIndex],height: 350,))),
            ]),
         ),
           listImg() ,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text("Andreas Strer",style: TextStyle(fontFamily: "p",color: Color.fromARGB(255, 74, 69, 68),fontWeight: FontWeight.bold,fontSize: 30),),
                   SizedBox(height: 2,),
                    Text("CARTIER",style: TextStyle(fontFamily: "p",color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                  ],
                ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                              TextSpan(text: "\$ ",style: TextStyle(color: Color.fromARGB(255, 57, 56, 56),fontWeight: FontWeight.bold,fontSize: 16),),  
                        TextSpan(text: "5.99",style: TextStyle(color: Color.fromARGB(255, 57, 56, 56),fontWeight: FontWeight.bold,fontSize: 30),),
                      ],
                    ),
                  ),
              ],
            ),
          ),
           Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(    
            borderRadius: BorderRadius.circular(11),
            child:   Container(
              color:Color.fromARGB(255, 57, 56, 56),width: double.infinity,
              height:55,
            child: Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
              Icons.shopping_basket_outlined,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 11,),
          Text("ADD TO CART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 16),),
        ],
      )),),
),
 )
        ],
      ) ,
    );
  }


   listImg() {
  return  Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...List.generate(
            img.length,
            (index) {
              
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                  GestureDetector(
                      onTap: () {
                        // _anime =! _anime;
                        setState(() {
                  
                            selectedIndex = index;
                          animateController.repeat();
                        });
                      },
                          child: ClipRRect(    
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 58,
                              color: selectedIndex == index
                                          ?  Color.fromARGB(255, 188, 158, 66)
                                          :  Color.fromARGB(255, 57, 56, 56),
                                 child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  img[index],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              
            },
          )
        ]),
      ),
    );

  }
}