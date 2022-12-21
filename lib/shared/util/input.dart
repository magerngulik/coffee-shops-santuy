Map<String, InputControllerState> inputControllers = {};

class Input {
  static get(String id) {
    return inputControllers[id]!.getValue();
  }
}

class InputControllerState {
  setValue(value) {}
  getValue() {}
}
