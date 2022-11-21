using EasyGamesDev.Business.Dtos.Transactions;

namespace EasyGamesDev.Business.Business.Transaction
{
    public interface ITransactionBusiness
    {
        Task<List<TransactionListDto>> GetTransactionList(int? clientID);
        Task AddTransaction(AddTransactionDto dto);
        Task UpdateTransaction(UpdateTransactionDto dto);
    }
}
