import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class MyHomePage extends StatefulWidget {


  



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 @override
  void initState() {
      Provider.of<MyProvider>(context, listen: false)
        .getDataFromAPI();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
    
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
            
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
          Padding(
            padding:const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
             height: 500,
              child: Consumer<MyProvider>(
                builder: (context, myProvider, _) {
                        
                          if (myProvider
                         .serviceLineDetailsModel!.serviceLineDetails!.isEmpty) {
               return const Center(
                 child: Text(
                   'There are no events currently available.',
                   style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w600,
                       fontSize: 14,
                       ),
                 ),
               );
                          } else {
               return ListView.builder(
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 itemCount: myProvider
                     .serviceLineDetailsModel!.serviceLineDetails!.length,
                 itemBuilder: (BuildContext context, int index) {
                   var serviceLineData = myProvider
                       .serviceLineDetailsModel!.serviceLineDetails![index];
                     
                  
                     
                   return Padding(
                     padding: const EdgeInsets.symmetric(
                         vertical: 4.0, horizontal: 10),
                     child: Container(
                       decoration: BoxDecoration(
                         color:
                             
                             Colors.white,
                         borderRadius: BorderRadius.circular(4.0),
                         boxShadow: [
                           BoxShadow(
                             color: Color(0xff00000029).withOpacity(0.1),
                             blurRadius: 2.0,
                             // spreadRadius: 2.0,
                             // offset: Offset(0.0, 0.0),
                           ),
                         ],
                       ),
                       height: 60,
                       child: Text(
                               serviceLineData.serviceLineDescription!.trim(),
                               style: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w600,
                                   fontSize: 16,
                                   ),
                             ),
                     ),
                   );
                 },
               );
                          }
                        
                },
              ),
            ),
          ),
        
         ],
              ),
      ),
     
    );
  }
}
