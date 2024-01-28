using Mapster;
using SupremeTech.ApiResponse;
using SupremeTech.CommonDto;
using SupremeTech.Models;
using SupremeTech.Repository;
using System.Xml.Linq;

namespace SupremeTech.BusinessLayer
{
    public class CustomerBL : ICustomerBL
    {
        private readonly ICustomerRL _customerRL;
        CustomerResponse CustomerResp = new CustomerResponse();
        public CustomerBL(ICustomerRL customerRL)
        {
            _customerRL = customerRL;
        }
        public async Task<CustomerResponse> deleteUser(long id)
        {
            try
            {

                bool result = _customerRL.deleteUser(id);
                if (result)
                {
                    List<User> listUser = _customerRL.GetAll();
                    if (listUser != null)
                    {
                        CustomerResp.Data = await Task.FromResult(_customerRL.GetAll().Adapt<List<CustomerDto>>());
                        CustomerResp.Message = "Successfull";
                    }
                    else
                    {
                        CustomerResp.Data = new List<CustomerDto>();
                        CustomerResp.Message = "No Data Found";
                    }
                    CustomerResp.Success = true;

                    CustomerResp.StatusCode = 200;
                }
                else
                {
                    CustomerResp.Success = false;
                    CustomerResp.Message = "No Record Found";
                    CustomerResp.Data = new List<CustomerDto>();
                    CustomerResp.StatusCode = 200;
                }
            }
            catch (Exception ex)
            {
                //CustomerResp.Success = false;
                //CustomerResp.Message = ex.Message;
                //CustomerResp.Data = new List<CustomerDto>();
                //CustomerResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return CustomerResp;
        }

        public async Task<CustomerResponse> GetAll()
        {
            try
            {

                List<User> listUser = _customerRL.GetAll();
                if (listUser != null)
                {
                    CustomerResp.Data = await Task.FromResult(_customerRL.GetAll().Adapt<List<CustomerDto>>());
                    CustomerResp.Message = "Successfull";
                }
                else
                {
                    CustomerResp.Data = new List<CustomerDto>();
                    CustomerResp.Message = "No Data Found";
                }
                CustomerResp.Success = true;

                CustomerResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //CustomerResp.Success = false;
                //CustomerResp.Message = ex.Message;
                //CustomerResp.Data = new List<CustomerDto>();
                //CustomerResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return CustomerResp;
        }

        public async Task<CustomerResponse> GetById(long id)
        {
            //return _customerRL.GetById(id);
            try
            {
                List<CustomerDto> listData = new List<CustomerDto>();
                User user = _customerRL.GetById(id);
                if (user != null)
                {
                    listData.Add(_customerRL.GetById(id).Adapt<CustomerDto>());
                    CustomerResp.Message = "Successfull";
                }
                else
                {
                    CustomerResp.Message = "No Data Found";
                }

                CustomerResp.Success = true;

                CustomerResp.Data = listData;
                CustomerResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //CustomerResp.Success = false;
                //CustomerResp.Message = ex.Message;
                //CustomerResp.Data = new List<CustomerDto>();
                //CustomerResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return CustomerResp;
        }

        public async Task<CustomerResponse> saveUser(CustomerDto user)
        {
            try
            {
                List<CustomerDto> listData = new List<CustomerDto>();

                if (user != null)
                {
                    User userResult = _customerRL.saveUser(user.Adapt<User>());
                    listData.Add(userResult.Adapt<CustomerDto>());
                    CustomerResp.Message = "Successfull";
                    CustomerResp.Success = true;
                }
                else
                {
                    CustomerResp.Message = "Data cant't Empty";
                    CustomerResp.Success = false;
                }



                CustomerResp.Data = listData;
                CustomerResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //CustomerResp.Success = false;
                //CustomerResp.Message = ex.Message;
                //CustomerResp.Data = new List<CustomerDto>();
                //CustomerResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return CustomerResp;




        }

        public async Task<CustomerResponse> updateUser(CustomerDto user)
        {


            try
            {
                List<CustomerDto> listData = new List<CustomerDto>();

                if (user != null)
                {
                    User userResult = _customerRL.updateUser(user.Adapt<User>()); ;
                    listData.Add(userResult.Adapt<CustomerDto>());
                    CustomerResp.Message = "Successfull";
                    CustomerResp.Success = true;
                }
                else
                {
                    CustomerResp.Message = "Data cant't Empty";
                    CustomerResp.Success = false;
                }



                CustomerResp.Data = listData;
                CustomerResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //CustomerResp.Success = false;
                //CustomerResp.Message = ex.Message;
                //CustomerResp.Data = new List<CustomerDto>();
                //CustomerResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return CustomerResp;

        }
    }
}
