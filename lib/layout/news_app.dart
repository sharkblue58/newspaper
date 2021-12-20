import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/cubit/cubit.dart';
import 'package:newspaper/cubit/cubit2.dart';
import 'package:newspaper/cubit/states.dart';
import 'package:newspaper/modules/search/search_screen.dart';
import 'package:newspaper/shared/component/componants.dart';
import 'package:newspaper/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit= NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context,SearchScreen());
                  },
                  icon:Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){
                     AppCubit.get(context).changeAppMode();
                  },
                  icon:Icon(Icons.brightness_4_outlined)
              )
            ],
          ),
          body:cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:cubit.currentindex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items:cubit.bottomItems,
          ),

        );
      },
    );
  }
}
