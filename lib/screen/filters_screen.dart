import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  // Widget _builderSwitchListTile(
  //   String title,
  //   String description,
  //   bool currentValue,
  //   Function updateValue,
  // ) {
  //   return SwitchListTile(
  //     title: Text(title),
  //     subtitle: Text(description),
  //     value: currentValue,
  //     onChanged: updateValue,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include gluten-free meals'),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include lactose-free meals'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include vegetarian meals'),
                ),
                // _builderSwitchListTile(
                //   'Gluten-free',
                //   'Only include gluten-free meals',
                //   _glutenFree,
                //   (newValue) {
                //     setState(
                //       () {
                //         _glutenFree = newValue;
                //       },
                //     );
                //   },
                // ),
                // _builderSwitchListTile(
                //   'Lactose-free',
                //   'Only include lactose-free meals',
                //   _lactoseFree,
                //   (newValue) {
                //     setState(
                //       () {
                //         _lactoseFree = newValue;
                //       },
                //     );
                //   },
                // ),
                // _builderSwitchListTile(
                //   'Vegan',
                //   'Only include vegan meals',
                //   _vegan,
                //   (newValue) {
                //     setState(
                //       () {
                //         _vegan = newValue;
                //       },
                //     );
                //   },
                // ),
                // _builderSwitchListTile(
                //   'Vegetarian',
                //   'Only include vegetarian meals',
                //   _vegetarian,
                //   (newValue) {
                //     setState(
                //       () {
                //         _vegetarian = newValue;
                //       },
                //     );
                //   },
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
