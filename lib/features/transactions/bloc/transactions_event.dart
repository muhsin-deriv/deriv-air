part of 'transactions_bloc.dart';

@immutable
abstract class TransactionsEvent {}

class InitializeTransactions extends TransactionsEvent {}

class NewTransaction extends TransactionsEvent {
  final Transaction transaction;

  NewTransaction(this.transaction);
}

class NewContract extends TransactionsEvent {
  final OpenContract contract;

  NewContract(this.contract);
}
