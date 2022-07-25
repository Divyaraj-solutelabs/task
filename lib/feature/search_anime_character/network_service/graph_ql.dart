import 'package:anime/feature/search_anime_character/model/model.dart';
import 'package:anime/feature/search_anime_character/util/util.dart';
import 'package:graphql/client.dart';

const baseURL="https://graphql.anilist.co";

final GraphQLClient client = GraphQLClient(
    link: HttpLink(baseURL),
    cache: GraphQLCache()
);

final _characters = <Character>[];


//Sreaching the Character
Future<List<Character>> Result(String name) async{
  var result = await client.query(
      QueryOptions(document: gql(
      _getAnimeCharacter
      ),
        variables: {
        'character':name
        }
      )
  );
  if(result.data!=null){
    print(result.data);
    _characters.add(Character.toObject(result.data!, Utils.randomColor()));
  }
  return _characters;
}

//GraphQL Query
const _getAnimeCharacter = r"""
          query ($character: String) {
              character: Character(search: $character) {
                id,
                name {
                  full
                  native
                },
                 description,
                image {
                  large
                }
              }
          }
    """;

