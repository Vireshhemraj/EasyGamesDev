using System.ComponentModel.DataAnnotations;

namespace EasyGamesDev.Business.Dtos.Transactions
{
    public class AddTransactionDto
    {
        [Required(ErrorMessage = "ClientID is required.")]
        public int ClientID { get;set; }
        [Required(ErrorMessage = "Amount is required.")]
        public double Amount { get;set;}
        [Required(ErrorMessage = "Check Debit or Credit Transaction Type as it is required.")]
        public int TransactionTypeID { get; set; }
        [StringLength(100,ErrorMessage = "Maximum 100 characters for comment.")]
        public string? Comment { get; set; }
    }
}
