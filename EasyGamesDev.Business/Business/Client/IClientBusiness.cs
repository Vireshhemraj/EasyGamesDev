using EasyGamesDev.Business.Dtos.Clients;

namespace EasyGamesDev.Business.Business.Client
{
    public interface IClientBusiness
    {
        Task<List<ClientListDto>> GetGlientList(int? clientID);
    }
}
