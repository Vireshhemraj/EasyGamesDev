using AutoMapper;
using EasyGamesDev.Business.Dtos.Clients;
using EasyGamesDev.Business.Dtos.Transactions;
using EasyGamesDev.Data.Models.Client;
using EasyGamesDev.Data.Models.Transaction;

namespace EasyGamesDev.Business.MappingConfiguration
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ClientModel, ClientListDto>();

            CreateMap<TransactionModel, TransactionListDto>();
            CreateMap<AddTransactionDto, AddTransactionModel>();
            CreateMap<UpdateTransactionDto, UpdateTransactionModel>();
        }
    }
}
