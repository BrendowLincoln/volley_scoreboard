enum QuantitySets {
  one,
  three,
  five,
}

class QuantityValue {
  final int value;

  const QuantityValue(this.value);
}

extension QuantityValueExtension on QuantitySets {
  int get numericValue {
    switch (this) {
      case QuantitySets.one:
        return const QuantityValue(1).value;
      case QuantitySets.three:
        return const QuantityValue(3).value;
      case QuantitySets.five:
        return const QuantityValue(5).value;
      default:
        return const QuantityValue(0).value;
    }
  }
}
