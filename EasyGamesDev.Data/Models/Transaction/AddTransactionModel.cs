namespace EasyGamesDev.Data.Models.Transaction
{
    public class AddTransactionModel
    {
        public int ClientID { get; set; }
        public double Amount { get; set; }
        public int TransactionTypeID { get; set; }
        public string? Comment { get; set; }
    }
}
