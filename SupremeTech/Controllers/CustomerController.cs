using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SupremeTech.BusinessLayer;
using SupremeTech.CommonDto;
using SupremeTech.Models;
using SupremeTech.Repository;

namespace SupremeTech.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerBL _customerBL;
        private readonly ILogger<CustomerController> _logger;
        public CustomerController(ICustomerBL customerBL, ILogger<CustomerController> logger)
        {
            _customerBL = customerBL;
            _logger = logger;
        }
        [Route("GetCustomer")]
        [HttpGet]

        public async Task<IActionResult> GetAll()
        {
            _logger.LogInformation("All Customer List ==>>> Get All ");
            //await _customerBL.GetAll();
            return Ok(await _customerBL.GetAll());
        }
        [Route("GetCustomer/{id}")]
        [HttpGet]

        public async Task<IActionResult> GetCustomerById(long id)
        {
            _logger.LogInformation("GetCustomerById Api Call ");
            return Ok(await _customerBL.GetById(id));
        }
        [HttpPost]
        [Route("SaveCustomer")]
        public async Task<IActionResult> Post(CustomerDto user)
        {
            _logger.LogInformation("Save Customer Api Call ");
            return Ok(await _customerBL.saveUser(user));
        }
        [HttpPut]
        [Route("UpdateCustomer")]
        public async Task<IActionResult> Put(CustomerDto user)
        {
            _logger.LogInformation("Update Customer Api Call ");
            return Ok(await _customerBL.updateUser(user));
        }
        [HttpDelete]
        [Route("DeleteCustomer/{id}")]
        public async Task<IActionResult> Delete(long id)
        {
            _logger.LogInformation("Delete Customer Api Call ");
            return Ok(await _customerBL.deleteUser(id));
        }
    }
}
