import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/cubit/cubit.dart';
import 'package:newspaper/cubit/states.dart';
import 'package:newspaper/shared/component/componants.dart';

class SearchScreen  extends StatelessWidget {

  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return BlocConsumer<NewsCubit,NewsStates> (
      listener: (context,state){},
      builder: (context,state){
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildlogintextfield(
                  circle:10.0 ,
                  controller:searchController ,
                  lable:'Search',
                  prefix:Icons.search ,
                  type:TextInputType.text,
                  onchange: (value){
                    NewsCubit.get(context).getSearch(value);
                  }
                ),
              ),
              Expanded(child: articleBuilder(list, context,issearch: true)),
            ],
          ),
        );
      },
    );
  }
}
