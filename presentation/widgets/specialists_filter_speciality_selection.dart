import 'package:eventie_client_app/core/domain/entities/category.dart';
import 'package:eventie_client_app/core/presentation/cubit/responsive_size.dart';
import 'package:eventie_client_app/features/explore/presentation/widgets/specialists_filter_speciality_row.dart';
import 'package:flutter/material.dart';

class SpecialistsFilterSpecialitySelection extends StatefulWidget {
  const SpecialistsFilterSpecialitySelection({
    Key? key,
    this.availableCategories = const [],
    this.initiallySelectedCategories = const [],
    this.onCategoriesSelected,
  }) : super(key: key);

  final List<Category> availableCategories;
  final List<Category> initiallySelectedCategories;
  final void Function(List<Category>)? onCategoriesSelected;

  @override
  State<SpecialistsFilterSpecialitySelection> createState() =>
      _SpecialistsFilterSpecialitySelectionState();
}

class _SpecialistsFilterSpecialitySelectionState
    extends State<SpecialistsFilterSpecialitySelection> {
  late final List<Category> _selectedCategories =
      List.of(widget.initiallySelectedCategories);

  Future<void> selectCategory(Category category) async {
    if (!_selectedCategories.contains(category)) {
      _selectedCategories.add(category);
    } else {
      _selectedCategories.remove(category);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xffF4E9D7),
      child: Column(
        children: [
          Divider(
            color: Color(0xff1c1c1c).withOpacity(0.1),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16, top: 30),
              child: ListView(
                children: widget.availableCategories
                    .map(
                      (e) => SpecialistsFilterSpecialityRow(
                        text: e.name,
                        isSelected: _selectedCategories.contains(e),
                        onTap: () => selectCategory(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              RespSize.of(context).height(15),
              RespSize.of(context).width(16),
              RespSize.of(context).height(15),
              RespSize.of(context).width(30),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onCategoriesSelected?.call(_selectedCategories);
                  Navigator.of(context).pop();
                },
                child: Text('Продолжить'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
