using SupremeTech.ApiResponse;
using SupremeTech.CommonDto;
using SupremeTech.Models;

namespace SupremeTech.BusinessLayer
{
    public interface ICustomerBL
    {
        public Task<CustomerResponse> GetAll();
        public Task<CustomerResponse> GetById(long id);
        public Task<CustomerResponse> saveUser(CustomerDto user);
        public Task<CustomerResponse> deleteUser(long id);
        public Task<CustomerResponse> updateUser(CustomerDto user);
    }
}
