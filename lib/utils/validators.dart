
String? validateTextInput(String? value) {
  if (fieldIsEmpty(value)) {
    return "Campo requerido";
  }
  return null;
}

bool fieldIsEmpty(String? value) {
  return (value == null || value.isEmpty);
}