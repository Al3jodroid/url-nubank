import 'package:flutter/material.dart';

class UrlShrinkForm extends StatefulWidget {
  final Function(String) onClickShrinkUrl;
  final Function(String) validateUrl;

  const UrlShrinkForm(
      {super.key,
      required this.onClickShrinkUrl, //run an external method that call the shrink process
      required this.validateUrl //run a decoupled method fron this form for validate url well formed
      });

  @override
  State<UrlShrinkForm> createState() => _UrlShrinkFormState();
}

class _UrlShrinkFormState extends State<UrlShrinkForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String validUrl = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _renderUrlFormWidget(),
            const VerticalDivider(),
            _renderButtonShrink()
          ],
        ),
      ),
    );
  }

  Flexible _renderUrlFormWidget() {
    return Flexible(
      child: TextFormField(
        maxLines: 1,
        decoration: const InputDecoration(hintText: 'Enter the url to shrink'),
        validator: validateUrlInput,
      ),
    );
  }

  ElevatedButton _renderButtonShrink() {
    return ElevatedButton(
      onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        if (_formKey.currentState!.validate()) {
          widget.onClickShrinkUrl(validUrl);
        }
      },
      child: const Text('Shrink it!'),
    );
  }

  String? validateUrlInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter the url to shrink';
    }
    // else if (!widget.validateUrl(value)) {
    //   return 'Please enter a valid url (http:// or https://)';
    // }
    validUrl = value;
    return null;
  }
}
