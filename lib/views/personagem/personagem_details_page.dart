import 'package:app_desafio/models/personagem_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonagemDetailsPage extends StatelessWidget {
  final PersonagemModel? personagem;
  const PersonagemDetailsPage({Key? key, required this.personagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "${personagem!.name}",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return ListView(
      children: [
        Hero(
          tag: "tagHero${personagem!.id}",
          child: ClipRRect(
            child: Image.network(
              "${personagem!.thumbnail!.path}.${personagem!.thumbnail!.extension}",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Text(
            "${personagem!.name}",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 35,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Descrição",
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: .8,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                personagem!.description != ""
                    ? "${personagem!.description}"
                    : "Sem informação",
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Histórias em quadrinhos que participou",
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: .8,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              personagem!.comics!.items!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: personagem!.comics!.items!.map((comic) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "${comic!.name}",
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                letterSpacing: .5,
                                fontSize: 18,
                              ),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                    )
                  : Text(
                      "Sem informação",
                      style: GoogleFonts.oswald(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontSize: 18,
                        ),
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
