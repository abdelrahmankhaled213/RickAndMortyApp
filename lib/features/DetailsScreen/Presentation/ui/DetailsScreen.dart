import 'package:flutter/material.dart';
import 'package:rickandmoartymovieapp/core/Utils/colors.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';
import 'package:rickandmoartymovieapp/features/functions/widgets.dart';

class DetailsHomeScreeen extends StatelessWidget {
  Result result;
  DetailsHomeScreeen({
    required this.result
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customAppBar(result: result),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                color: AppColor.grey,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
 characterInfo(text: "status",value: result.status.name),
                     buildDivider(context,MediaQuery.of(context).size.width/1.5),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/15,
                    ),
                    characterInfo(text: "Location",value: result. location.name),
                    buildDivider(context,MediaQuery.of(context).size.width/2),
                     SizedBox(
                      height: MediaQuery.of(context).size.height/15,
                    ),
                    characterInfo(text: "Gender",value: result. gender.name),
                    buildDivider(context,MediaQuery.of(context).size.width/1.2),
                     SizedBox(
                      height: MediaQuery.of(context).size.height/15,
                    ),
                    characterInfo(text: "Species",value: result.species.name),
                    buildDivider(context,MediaQuery.of(context).size.width/1.5),

                  ],
                ),
              )
            ]
          )
          )
        ],
      ),
    );
  }
}

Widget characterInfo({required String text,required String value}) {
  return Text.rich(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
TextSpan(children: [
 TextSpan(
  text:  text+" :  ",
   style: TextStyle(
       fontSize: 18,
       color: AppColor.mywhite,
       fontWeight:   FontWeight.w600,
   ),

 ) ,
  TextSpan(
    text:  value,
    style: TextStyle(
      fontSize: 15,
      color: AppColor.mywhite,
      fontWeight:   FontWeight.w200,
    ),
  ) ,
])
  );
}
Widget buildDivider(BuildContext context,double endIntent){
  return Divider(
    color: AppColor.yellow,
    height: 20,
    thickness: 3,
    endIndent:endIntent ,
  );
}