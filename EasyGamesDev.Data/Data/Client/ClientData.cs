using EasyGamesDev.Data.DBAccess;
using EasyGamesDev.Data.Models.Client;

namespace EasyGamesDev.Data.Data.Client
{
    public class ClientData : IClientData
    {
        private readonly ISqlDataAccess _db;

        public ClientData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<IEnumerable<ClientModel>> GetGlientList(int? clientID) 
        {
            var result = await _db.LoadData<ClientModel, dynamic>("dbo.Client_List", new { clientID });
            return result;
        }
    }
}
