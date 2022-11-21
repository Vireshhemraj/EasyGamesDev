using System.ComponentModel.DataAnnotations;

namespace EasyGamesDev.Business.Dtos.Transactions
{
    public class UpdateTransactionDto
    {
        [Required(ErrorMessage = "TransactionID is required.")]
        public int TransactionID { get; set; }
        [StringLength(100, ErrorMessage = "Maximum 100 characters for comment.")]
        public string? Comment { get;set;}
    }
}
