using EasyGamesDev.Data.DBAccess;
using EasyGamesDev.Data.Models.Transaction;

namespace EasyGamesDev.Data.Data.Transaction
{
    public class TransactionData : ITransactionData
    {
        private readonly ISqlDataAccess _db;

        public TransactionData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<IEnumerable<TransactionModel>> GetTransactionList(int? clientID)
        {
           return await _db.LoadData<TransactionModel, dynamic>("dbo.Transaction_List", new { clientID });
        }

        public async Task AddTransaction(AddTransactionModel addTransaction)
        {
            await _db.SaveData("dbo.Transaction_Add", addTransaction);
        }

        public async Task UpdateTransaction(UpdateTransactionModel updateTransaction)
        {
            await _db.SaveData("dbo.Transaction_Update", updateTransaction);
        }

    }
}
