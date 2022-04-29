import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenfree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenfree= widget.currentFilters['gluten'];
    _vegetarian=widget.currentFilters['vegetarian'];
    _vegan= widget.currentFilters['vegan'];
    _lactoseFree= widget.currentFilters['lactose'];

    super.initState();
  }


  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('filters'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Map<String,bool> _selectedfilters= {
                    'gluten': _glutenfree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters(_selectedfilters);
                },
                icon: Icon(Icons.save)),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection!',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten free meals',
                    _glutenfree,
                    (value) {
                      setState(() {
                        _glutenfree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegetarian,
                    (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose free meals',
                    _lactoseFree,
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
