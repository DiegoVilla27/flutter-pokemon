import 'package:flutter_pokemon/core/routes/routes_names.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_detail/pokemon_detail_screen.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/pokemon_search_screen.dart';
import 'package:go_router/go_router.dart';

/// Configures the application's routing using GoRouter.
///
/// This class defines a static `GoRouter` instance with a comprehensive list
/// of routes, each associated with a specific screen widget. It includes
/// nested routes for detailed navigation, such as the hero details route.
/// The initial route is set to the home screen, and an error screen is
/// provided for undefined routes.
class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/pokemon',
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutesNamed.pokemon,
        path: '/pokemon',
        builder: (_, _) => const PokemonSearchScreen(),
        routes: [
          GoRoute(
            name: AppRoutesNamed.pokemonDetail,
            path: 'detail',
            builder: (_, GoRouterState state) {
              final pokemon = state.extra as PokemonEntity;
              return PokemonDetailScreen(pokemon: pokemon);
            },
          ),
        ],
      ),
    ],
  );
}
