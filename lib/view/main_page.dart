import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rick and Morty API")),
      body: _buildCharacterList(context),
    );
  }

  Widget _buildCharacterList(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (context, index) {
          Character character = viewModel.characters[index];
          return ListTile(
            title: Text(character.name),
            subtitle: Text(character.status),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(character.image),
            ),
          );
        },
      ),
    );
  }
}
