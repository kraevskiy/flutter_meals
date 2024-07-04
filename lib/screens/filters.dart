import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = activeFilter[Filter.vegetarian]!;
    _veganFreeFilterSet = activeFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectedScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian-free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              subtitle: Text(
                'Only include vegetarian-free meals.',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan-free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              subtitle: Text(
                'Only include vegan-free meals.',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
