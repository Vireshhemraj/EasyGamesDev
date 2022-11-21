using AutoMapper;
using EasyGamesDev.Business.Dtos.Transactions;
using EasyGamesDev.Data.Data.Transaction;
using EasyGamesDev.Data.Models.Transaction;

namespace EasyGamesDev.Business.Business.Transaction
{
    public class TransactionBusiness: ITransactionBusiness
    {
        private readonly ITransactionData _transactionData;
        private IMapper _mapper;
        public TransactionBusiness(ITransactionData transactionData, IMapper mapper)
        {
            _transactionData = transactionData;
            _mapper = mapper;
        }

        public async Task<List<TransactionListDto>> GetTransactionList(int? clientID)
        {
            var transactionList = await _transactionData.GetTransactionList(clientID);
            return _mapper.Map<List<TransactionModel>, List<TransactionListDto>>(transactionList.ToList());
        }

        public async Task AddTransaction(AddTransactionDto dto)
        {
            var addTransactionModel = _mapper.Map<AddTransactionDto, AddTransactionModel>(dto);
            await _transactionData.AddTransaction(addTransactionModel);
        }

        public async Task UpdateTransaction(UpdateTransactionDto dto)
        {
            var updateTransactionModel = _mapper.Map<UpdateTransactionDto, UpdateTransactionModel>(dto);
            await _transactionData.UpdateTransaction(updateTransactionModel);
        }
    }
}
