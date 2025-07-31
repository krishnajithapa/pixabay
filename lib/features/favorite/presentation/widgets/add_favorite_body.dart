import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/favorite/presentation/bloc/add_favorite_bloc.dart';
import 'package:pixabay/features/favorite/presentation/widgets/image_grid.dart';

class AddFavoriteBody extends StatefulWidget {
  final String query;
  const AddFavoriteBody({super.key, this.query = ''});

  @override
  State<AddFavoriteBody> createState() => _AddFavoriteBodyState();
}

class _AddFavoriteBodyState extends State<AddFavoriteBody> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  final int _perPage = 20;
  String _query = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _query = widget.query;
    if (_query.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<AddFavoriteBloc>().add(
          SearchImages(_query, page: _currentPage, perPage: _perPage),
        );
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _isLoading = true;
      _currentPage++;
      context.read<AddFavoriteBloc>().add(
        SearchImages(_query, page: _currentPage, perPage: _perPage),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFavoriteBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          _isLoading = false; // Reset loading state on error
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          _isLoading = false; // Reset loading state on error
          return ImageGrid(images: state.images, controller: _scrollController);
        } else {
          return Center(child: Text("Search Something to begin with!"));
        }
      },
    );
  }
}
