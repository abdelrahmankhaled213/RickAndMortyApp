import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmoartymovieapp/core/Utils/colors.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Model_view/Cubit/states.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/widgets/GridView/CustomCircularprogressindicator.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/widgets/GridView/CustomContainer.dart';
import 'package:rickandmoartymovieapp/features/DetailsScreen/Presentation/ui/DetailsScreen.dart';
//widget gridbuider
Widget gridBuilder({
  required CharacterModel model,
  required List<Result>container
  ,required TextEditingController controller
  ,required LoadedState state
  ,required BuildContext context}){
  return SizedBox(
    height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
    child: GridView.builder(
      shrinkWrap: true,
      itemCount: controller.text.isEmpty?state.characterModel.results.length
          :  container.length
      ,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1/1.5,
    ), itemBuilder: (context, index) {
      return InkWell(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsHomeScreeen(
        result: controller.text.isEmpty?model.results[index]:container[index],
      ),));
      },child: CustomContainer(state: state, index: index,controller: controller,container:
      container,));
    },
    ),
  );
}
//widget buildSearchItem
Widget buildSearchItem({
  required TextEditingController searchcontroller,
  required void Function(String) addSearchItem
}){
  return TextFormField(
    controller: searchcontroller,
    cursorColor: AppColor.mywhite,
    decoration:  const InputDecoration(
        hintText: "Find the character",
        hintStyle:  TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.grey
        )
    ),
    style: const TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColor.grey,
    ),
    onChanged: (value) {
      addSearchItem(value);
    },
  );
}
Widget customAppBar({

  required Result result}
    ){
  return SliverAppBar(
      stretch: true,
      expandedHeight: 600,
      pinned: true,
      backgroundColor: AppColor.grey,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(result.image,fit: BoxFit.cover,),
        title: Text(result.name,style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: AppColor.grey,
          fontSize: 24,

        ),
        ),
      )

  );
}