enum ContractType { buy, sell }

extension ContractTypeExtension on ContractType {
  String toBackendKey() {
    switch (this) {
      case ContractType.buy:
        return "CALL";

      case ContractType.sell:
        return "PUT";
    }
  }
}
