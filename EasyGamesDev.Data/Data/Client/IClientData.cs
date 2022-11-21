using EasyGamesDev.Data.Models.Client;

namespace EasyGamesDev.Data.Data.Client
{
    public interface IClientData
    {
        Task<IEnumerable<ClientModel>> GetGlientList(int? clientID);
    }
}
