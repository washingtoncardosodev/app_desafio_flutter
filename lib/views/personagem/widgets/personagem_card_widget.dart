import 'package:app_desafio/models/personagem_model.dart';
import 'package:app_desafio/views/personagem/personagem_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonagemCardWidget extends StatelessWidget {
  final PersonagemModel? personagem;
  const PersonagemCardWidget({Key? key, this.personagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonagemDetailsPage(
              personagem: personagem,
            ),
          ),
        );
      },
      child: Container(
        padding:
            EdgeInsets.all((10 / 375.0) * MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Hero(
                  tag: "tagHero${personagem!.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "${personagem!.thumbnail!.path}.${personagem!.thumbnail!.extension}",
                      fit: BoxFit.scaleDown,
                      height:
                          (150 / 812.0) * MediaQuery.of(context).size.height,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: (10 / 812.0) * MediaQuery.of(context).size.height,
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    personagem!.name!,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: GoogleFonts.oswald(
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        fontSize:
                            (22 / 375.0) * MediaQuery.of(context).size.width,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
