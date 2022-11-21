using AutoMapper;
using EasyGamesDev.Business.Dtos.Clients;
using EasyGamesDev.Data.Data.Client;
using EasyGamesDev.Data.Models.Client;

namespace EasyGamesDev.Business.Business.Client
{
    public class ClientBusiness: IClientBusiness
    {
        private readonly IClientData _clientData;
        private IMapper _mapper;
        public ClientBusiness(IClientData clientData, IMapper mapper)
        {
            _clientData = clientData;
            _mapper = mapper;
        }

        public async Task<List<ClientListDto>> GetGlientList(int? clientID)
        {
            var clientList = await _clientData.GetGlientList(clientID);
            return _mapper.Map<List<ClientModel>, List<ClientListDto>>(clientList.ToList());
        }
    }
}
