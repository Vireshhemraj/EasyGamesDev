using EasyGamesDev.Data.Models.Transaction;

namespace EasyGamesDev.Data.Data.Transaction
{
    public interface ITransactionData
    {
        Task<IEnumerable<TransactionModel>> GetTransactionList(int? clientID);
        Task AddTransaction(AddTransactionModel addTransaction);
        Task UpdateTransaction(UpdateTransactionModel updateTransaction);
    }
}
