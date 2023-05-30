import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodiary_test_app/features/form/presentation/form_view.dart';
import 'package:kodiary_test_app/features/get_company_list/presentation/company_home_view.dart';
import 'package:kodiary_test_app/features/google_maps/maps.dart';

void main() {
  runApp(
    const ProviderScope(
child:
    MyApp(),  )

    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder:(context)=>const FormView()));
      
            }, child: const Text('Form'),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder:(context)=>const CompanyHomeView()));
      
            }, child: const Text('Company List'),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder:(context)=>const MapsView()));
      
            }, child: const Text('Maps'),),
          ],
        ),
      ),

    );
  }
}
