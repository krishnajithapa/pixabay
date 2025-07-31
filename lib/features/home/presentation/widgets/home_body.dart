import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/home/presentation/bloc/home_bloc.dart';
import 'package:pixabay/features/home/presentation/widgets/home_image_grid.dart';

class HomeBody extends StatelessWidget {
  final String query;
  const HomeBody({super.key, this.query = ''});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          if (state.images.isEmpty) {
            return Center(child: Text("Your favorite list is empty! "));
          }
          return HomeImageGrid(
            images: state.images,
            favoriteIds: state.images.map((e) => e.id).toList(),
          );
        } else {
          return Center(child: Text("Search Something to begin with!"));
        }
      },
    );
  }
}
