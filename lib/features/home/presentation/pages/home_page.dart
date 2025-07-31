import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/core/utils/locator/service_locator.dart';
import 'package:pixabay/features/favorite/presentation/pages/add_favorite_page.dart';
import 'package:pixabay/features/home/presentation/bloc/home_bloc.dart';
import 'package:pixabay/features/home/presentation/widgets/home_body.dart';
import 'package:pixabay/shared/widgets/base_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  @override
  void initState() {
    super.initState();
    _homeBloc = locator<HomeBloc>()..add(FetchSavedImages());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: BaseScaffold(
        appbarTitle: "Home",
        body: HomeBody(),
        appBarActionWidget: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddFavoritePage()))
                .then((value) {
                  _homeBloc.add(FetchSavedImages());
                });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
