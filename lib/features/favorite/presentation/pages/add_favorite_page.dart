import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixabay/core/utils/locator/service_locator.dart';
import 'package:pixabay/core/utils/ui_helper.dart';
import 'package:pixabay/features/favorite/presentation/bloc/add_favorite_bloc.dart';
import 'package:pixabay/features/favorite/presentation/widgets/add_favorite_body.dart';

class AddFavoritePage extends StatefulWidget {
  const AddFavoritePage({super.key});

  @override
  State<AddFavoritePage> createState() => _AddFavoritePageState();
}

class _AddFavoritePageState extends State<AddFavoritePage> {
  late final TextEditingController _searchController;
  late final AddFavoriteBloc _addFavoriteBloc;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _addFavoriteBloc = locator<AddFavoriteBloc>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _addFavoriteBloc.close();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    if (value.trim().isNotEmpty) {
      _addFavoriteBloc.add(SearchImages(value.trim()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _addFavoriteBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 120.h, // Increase height to fit title + search
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                'Add to Favorites',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpaceSmall,
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search images...',
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: _onSearchSubmitted,
              ),
            ],
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
