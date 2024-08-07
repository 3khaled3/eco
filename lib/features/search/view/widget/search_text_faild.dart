import 'package:eco/utils/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// A text field that debounces the search event.
///
/// The [onSearchChanged] callback is called with the search query after a
/// 1 second delay since the last search query change.
class SearchTextField extends StatefulWidget {
  final void Function(String) onSearchChanged;
  final void Function() onPressedFilter;

  /// Creates a debounced search text field.
  ///
  /// The [onSearchChanged] argument must not be null.
  const SearchTextField({
    super.key,
    required this.onSearchChanged,
    required this.onPressedFilter,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

///
/// This class debounces the search event and notifies the parent widget when
/// the user stops typing for a second.
class _SearchTextFieldState extends State<SearchTextField> {
  // The subject that receives the search query input.
  final _debounce = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    // Listens to the search query input stream and debounces it by waiting for
    // 1 second since the last input before notifying the parent widget.
    _debounce.stream
        .debounceTime(const Duration(milliseconds: 1000))
        .listen(widget.onSearchChanged);
  }

  @override
  void dispose() {
    // Closes the subject to release any resources.
    _debounce.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // Adds the search query input to the subject.
        _debounce.add(value);
      },
      decoration: InputDecoration(
        hintText: GetTranslation.of(context).search,
        hintStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondaryFixed),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.secondaryFixed,
        ),
        suffixIcon: IconButton(
          onPressed: widget.onPressedFilter,
          icon: const Icon(Icons.filter_alt_outlined),
          color: Theme.of(context).colorScheme.secondaryFixed,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
