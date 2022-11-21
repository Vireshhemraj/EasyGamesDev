namespace EasyGamesDev.Data.Models.Transaction
{
    public class TransactionModel
    {
        public int TransactionID { get; set; }
        public double Amount { get; set; }
        public int ClientID { get; set; }
        public string? Comment { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int TransactionTypeID { get; set; }
        public string TransactionTypeName { get; set; }
    }
}
