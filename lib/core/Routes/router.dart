import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/Repo/GetAllCharactersRepo.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Model_view/Cubit/cubit.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Ui/CharacterHomeScreen.dart';

final GoRouter router=GoRouter(routes: [
  GoRoute(
    path: "/",builder: (context, state)
  => BlocProvider(create: (context)
  =>CharacterCubit(apiServices: GetAllCharactersRepo()
  ),child: CharacterHomeScreen(),
  )
    ,),

// GoRoute(path: "/details"
//   ,builder:(context, state) {
//   return DetailsHomeScreeen(result: );
// },
// )
]
);