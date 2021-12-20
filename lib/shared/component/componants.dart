

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspaper/cubit/cubit.dart';
import 'package:newspaper/modules/web_view/web_view_screen.dart';

Widget buildArticalItem(article,context)=>InkWell(
  onTap:(){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120.0,
  
          height: 120.0,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0),
  
            image: DecorationImage(
  
              image: NetworkImage('${article['urlToImage']}'),
  
              fit: BoxFit.cover,
  
            ),
  
  
  
          ),
  
        ),
  
        SizedBox(width:20.0,),
  
        Expanded(
  
          child: Container(
  
            height:120.0,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children:
  
              [
  
                Expanded(
  
                  child: Text('${article['title']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 3,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text('${article['publishedAt']}',
  
                  style: TextStyle(color:Colors.grey),
  
                ),
  
              ],
  
            ),
  
          ),
  
        )
  
      ],
  
    ),
  
  ),
);
Widget myDivider()=>Container(
  height: 1.0,
  width: double.infinity,
  color: Colors.grey[300],
);
Widget articleBuilder(list,context,{issearch=false})=>ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder:(context,index)=>buildArticalItem(list[index],context),
      separatorBuilder:(context,index)=>myDivider() ,
      itemCount: 10),
  fallback:(context) =>issearch?Container():Center(child: CircularProgressIndicator()),
);
Widget buildlogintextfield(
    {
      required TextEditingController controller,
      required TextInputType type ,
      required String lable,
      required IconData prefix,
      required double circle,
      required dynamic onchange,

    }
    )=> TextFormField(

  keyboardType:type,
  controller: controller,
  validator: (value){

    if (value!.isEmpty)
    {
      return 'Search Must Not Be Empty';
    }
    return null;
  },
  decoration: InputDecoration(
    labelText: lable,
    prefixIcon:Icon(
      prefix,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(circle),
    ),

  ),
  onFieldSubmitted: (value){
    print(value);
  },
  onChanged:onchange
);

void navigateTo( context, widget)=> Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context)=>widget,
    ),
);

