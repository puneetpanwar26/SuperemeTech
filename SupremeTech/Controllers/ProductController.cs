using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SupremeTech.BusinessLayer;
using SupremeTech.CommonDto;

namespace SupremeTech.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductBL _productBL;
        private readonly ILogger<ProductController> _logger;
        public ProductController(IProductBL productBL, ILogger<ProductController> logger)
        {
            _productBL = productBL;
            _logger = logger;   
        }
        [Route("GetProduct")]
        [HttpGet]

        public async Task<IActionResult> GetAll()
        {
            _logger.LogInformation("All Product List ==>>> Get All ");
            //await _customerBL.GetAll();
            return Ok(await _productBL.GetAll());
        }
        [Route("GetProduct/{id}")]
        [HttpGet]

        public async Task<IActionResult> GetProductById(long id)
        {
            _logger.LogInformation("GetProductById Api Call");
            //await _customerBL.GetById(id);
            return Ok(await _productBL.GetById(id));
        }
        [HttpPost]
        [Route("SaveProduct")]
        public async Task<IActionResult> Post(ProductDto product)
        {
            _logger.LogInformation("Save Product Api Call");
            return Ok(await _productBL.saveProduct(product));
        }
        [HttpPut]
        [Route("UpdateProduct")]
        public async Task<IActionResult> Put(ProductDto product)
        {
            _logger.LogInformation("UpdateProducct Api Call");
            return Ok(await _productBL.updateProduct(product));
        }
        [HttpDelete]
        [Route("DeleteProduct/{id}")]
        public async Task<IActionResult> Delete(long id)
        {
            _logger.LogInformation("DeleteProduct Api Call");

            return Ok(await _productBL.deleteProduct(id));
        }
    }
}
