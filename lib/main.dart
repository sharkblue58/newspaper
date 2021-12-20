import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspaper/cubit/cubit.dart';
import 'package:newspaper/cubit/states.dart';
import 'package:newspaper/shared/bloc_observer.dart';
import 'package:newspaper/shared/network/local/cache_helper.dart';
import 'package:newspaper/shared/network/remote/dio_helper.dart';
import 'cubit/cubit2.dart';
import 'cubit/states2.dart';
import 'layout/news_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
 bool? isdark= CacheHelper.getBoolean(key: 'isdark');
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(isdark));
}

class MyApp extends StatelessWidget {

final bool? isdark;
     MyApp(this.isdark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (BuildContext context)=>AppCubit()..changeAppMode(fromshared: isdark,)
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){} ,
        builder:(context,state){
          var cubit= AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility:false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness:Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color:Colors.black,
                  fontSize:20.0,
                  fontWeight:FontWeight.bold,
                ),
                iconTheme:IconThemeData(color:Colors.black),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor:Colors.deepOrange,
                unselectedItemColor:Colors.grey  ,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

            ),
            darkTheme:ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility:false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:HexColor('333739'),
                  statusBarIconBrightness:Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color:Colors.white,
                  fontSize:20.0,
                  fontWeight:FontWeight.bold,
                ),
                iconTheme:IconThemeData(color:Colors.white),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor:Colors.deepOrange,
                unselectedItemColor:Colors.grey  ,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
            home: NewsLayout() ,
          );
        } ,
      ),
    );
  }
}


