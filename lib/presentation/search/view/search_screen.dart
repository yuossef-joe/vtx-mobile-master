import 'package:applocation/app/constants.dart';
import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/cubit/search_cubit.dart';
import 'package:applocation/domain/state_management/states/search_states.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = ["The Chill Spot", "Serenity Space"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme themes = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                            shortSearchBar(size, _searchController, '', (text) {
                      context
                          .read<SearchCubit>()
                          .fetchSuggestionsAndRecentSearches(text);
                    })),
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                      },
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(AppStrings.cancel.tr(),
                            style: TextStyle(color: ColorManager.lightBlue)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildSectionTitle(AppStrings.suggestion_Item.tr()),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoaded) {
                      return _buildSuggestionList(
                          size, themes, state.suggestions);
                    } else if (state is SearchError) {
                      return Center(child: Text(state.message));
                    } else {
                      return Container();
                    }
                  },
                ),
                Divider(),
                _buildSectionTitle(AppStrings.recentSearch.tr()),
                _buildRecentSearchList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: AppStrings.search.tr(),
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {
        setState(() {}); // Update the list based on the search input if neededx
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSuggestionList(
      Size size,
      TextTheme themes,
      List<FamousPlace>
          data) // TODO : add list<FamousPlaces> after implementing bloc
  {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return circularBorderContainer(
            size: size,
            width: 0.86,
            height: 0.11,
            child: Row(
              children: [
                circular_image(
                    height: size.height * 0.079,
                    width: size.width * 0.17,
                    image: '${Constants.baseUrlImages}${data[index].image}'),
                SizedBox(
                  width: size.width * 0.055,
                ),
                defaultContainer(
                  height: size.height * 0.043,
                  width: size.width * 0.3,
                  child: defaultText(
                      text: data[index].title,
                      style: themes.headlineSmall!),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    context.read<SearchCubit>().removeSuggestion(
                        index, (state as SearchLoaded).suggestions);
                  },
                )
              ],
            ),
          );
          // return ListTile(
          //   leading: Icon(Icons.location_on, color: Colors.grey),
          //   title: Text(suggestionItems[index]),
          //   trailing: ,
          // );
        },
      );
    });
  }

  Widget _buildRecentSearchList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: recentSearches.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.history, color: Colors.grey),
          title: Text(recentSearches[index]),
          trailing: IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              setState(() {
                recentSearches.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}
