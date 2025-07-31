import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/core/utils/locator/service_locator.dart';
import 'package:pixabay/features/favorite/presentation/bloc/add_favorite_bloc.dart';
import 'package:pixabay/features/favorite/presentation/widgets/add_favorite_body.dart';

class AddFavoritePage extends StatefulWidget {
  const AddFavoritePage({super.key});

  @override
  State<AddFavoritePage> createState() => _AddFavoritePageState();
}

class _AddFavoritePageState extends State<AddFavoritePage> {
  late final TextEditingController _searchController;
  late final AddFavoriteBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _homeBloc = locator<AddFavoriteBloc>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _homeBloc.close();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    if (value.trim().isNotEmpty) {
      _homeBloc.add(SearchImages(value.trim()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search images...',
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: _onSearchSubmitted,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _onSearchSubmitted(_searchController.text),
            ),
          ],
        ),
        body: const AddFavoriteBody(),
      ),
    );
  }
}
