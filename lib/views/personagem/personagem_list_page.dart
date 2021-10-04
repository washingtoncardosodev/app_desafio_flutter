import 'package:app_desafio/controllers/personagem/personagem_controller.dart';
import 'package:app_desafio/views/personagem/widgets/personagem_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonagemListPage extends StatefulWidget {
  const PersonagemListPage({Key? key}) : super(key: key);

  @override
  State<PersonagemListPage> createState() => _PersonagemListPageState();
}

class _PersonagemListPageState extends State<PersonagemListPage> {
  final personagemController = PersonagemController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    personagemController.getPersonagens();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        personagemController.getPersonagens();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/images/marvel.svg",
        width: 100,
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Observer(
      builder: (_) {
        if (personagemController.isError) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Text(
                "Ops! Houve um problema ao carregar os personagens, por favor tente novamente mais tarde!",
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        }
        if (personagemController.personagens.isNotEmpty) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              GridView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: personagemController.personagens.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (BuildContext context, int? index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index! % 2 == 0 ? 10 : 10,
                      right: index % 2 == 0 ? 5 : 20,
                      left: index % 2 == 1 ? 5 : 20,
                      bottom: index % 2 == 1 ? 10 : 10,
                    ),
                    child: PersonagemCardWidget(
                      personagem: personagemController.personagens[index],
                    ),
                  );
                },
              ),
              personagemController.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
