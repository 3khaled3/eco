part of 'widget_import.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: StylesBox.medium16.copyWith(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
