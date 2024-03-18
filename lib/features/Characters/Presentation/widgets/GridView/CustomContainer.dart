import 'package:flutter/material.dart';
import 'package:rickandmoartymovieapp/core/Utils/colors.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Model_view/Cubit/states.dart';

class CustomContainer extends StatelessWidget {
final int index;
final LoadedState state;
final TextEditingController controller;
final List<Result>container;
CustomContainer({
  required this.state,
  required this.index,
  required this.controller,
  required this.container
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius:  BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),

      child: GridTile(
        child: Container(
            child: state.characterModel.results[index].image.isNotEmpty?
            FadeInImage.assetNetwork(
              placeholder:"assets/images/Animation - 1708614151790.gif" ,
              image: controller.text.isEmpty?state.characterModel.results[index].image:container[index].image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ):Image.asset("")
        ),
        footer: Container(
            height: 30,width: double.infinity,color:
        Colors.black54,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  controller.text.isEmpty?
                  state.characterModel.results[index].name:container[index].name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
            )
        ),
      ),
    );
  }
}
