using EasyGamesDev.Business.Business.Transaction;
using EasyGamesDev.Business.Dtos.Transactions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Net;
using System.Reflection;

namespace EasyGamesDev.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionController : ControllerBase
    {
        private readonly ITransactionBusiness _transactionBusiness;

        public TransactionController(ITransactionBusiness transactionBusiness)
        {
            _transactionBusiness = transactionBusiness;
        }

        [HttpGet]
        [Route("GetAllTransactions")]
        public async Task<List<TransactionListDto>> GetAllTransactions(int? clientID)
        {
            return await _transactionBusiness.GetTransactionList(clientID);
        }

        [HttpPost]
        [Route("AddTransaction")]
        public async Task<IActionResult> AddTransaction(AddTransactionDto dto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(new { message = "failed", error = this.ModelState });
                }
                await _transactionBusiness.AddTransaction(dto);
                return Ok(new { message = "success" });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "failed", error = e.Message });
            }            
        }

        [HttpPost]
        [Route("UpdateTransaction")]
        public async Task<IActionResult> UpdateTransaction(UpdateTransactionDto dto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(new { message = "failed", error = this.ModelState });
                }
                await _transactionBusiness.UpdateTransaction(dto);
                return Ok(new { message = "success" });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = "failed", error = e.Message });
            }
        }
    }
}
