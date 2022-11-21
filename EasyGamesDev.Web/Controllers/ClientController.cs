using EasyGamesDev.Business.Business.Client;
using EasyGamesDev.Business.Dtos.Clients;
using Microsoft.AspNetCore.Mvc;

namespace EasyGamesDev.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientController : ControllerBase
    {
        private readonly IClientBusiness _clientBusiness;

        public ClientController(IClientBusiness clientBusiness)
        {
            _clientBusiness = clientBusiness;
        }

        [HttpGet]
        [Route("GetAllClients")]
        public async Task<List<ClientListDto>> GetAllClients(int? ClientID)
        {
            return await _clientBusiness.GetGlientList(ClientID);
        }
    }
}
