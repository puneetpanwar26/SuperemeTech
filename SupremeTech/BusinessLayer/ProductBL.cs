using Mapster;
using SupremeTech.ApiResponse;
using SupremeTech.CommonDto;
using SupremeTech.Models;
using SupremeTech.Repository;

namespace SupremeTech.BusinessLayer
{
    public class ProductBL : IProductBL
    {
        private readonly IProductRL _productRL;
        ProductResponse ProductResp = new ProductResponse();
     
        public ProductBL(IProductRL productRL)
        {
            _productRL = productRL;
           

        }
        public async Task<ProductResponse> deleteProduct(long id)
        {
            try
            {

                bool result = _productRL.deleteProduct(id);
                if (result)
                {
                    List<Product> listUser = _productRL.GetAll();
                    if (listUser != null)
                    {
                        ProductResp.Data = await Task.FromResult(_productRL.GetAll().Adapt<List<ProductDto>>());
                        ProductResp.Message = "Successfull";
                    }
                    else
                    {
                        ProductResp.Data = new List<ProductDto>();
                        ProductResp.Message = "No Data Found";
                    }
                    ProductResp.Success = true;

                    ProductResp.StatusCode = 200;
                }
                else
                {
                    ProductResp.Success = false;
                    ProductResp.Message = "No Record Found";
                    ProductResp.Data = new List<ProductDto>();
                    ProductResp.StatusCode = 200;
                }
            }
            catch (Exception ex)
            {
                //ProductResp.Success = false;
                //ProductResp.Message = ex.Message;
                //ProductResp.Data = new List<ProductDto>();
                //ProductResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return ProductResp;
        }

        public async Task<ProductResponse> GetAll()
        {
            try
            {
               
                List<Product> listUser = _productRL.GetAll();
                if (listUser != null)
                {
                    ProductResp.Data = await Task.FromResult(listUser.Adapt<List<ProductDto>>());
                    ProductResp.Message = "Successfull";
                }
                else
                {
                    ProductResp.Data = new List<ProductDto>();
                    ProductResp.Message = "No Data Found";
                }
                ProductResp.Success = true;

                ProductResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //ProductResp.Success = false;
                //ProductResp.Message = ex.Message;
                //ProductResp.Data = new List<ProductDto>();
                //ProductResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return ProductResp;
        }

        public async Task<ProductResponse> GetById(long id)
        {
            try
            {
                List<ProductDto> listData = new List<ProductDto>();
                Product user = _productRL.GetById(id);
                if (user != null)
                {
                    listData.Add(_productRL.GetById(id).Adapt<ProductDto>());
                    ProductResp.Message = "Successfull";
                }
                else
                {
                    ProductResp.Message = "No Data Found";
                }

                ProductResp.Success = true;

                ProductResp.Data = listData;
                ProductResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //ProductResp.Success = false;
                //ProductResp.Message = ex.Message;
                //ProductResp.Data = new List<ProductDto>();
                //ProductResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return ProductResp;
        }

        public async Task<ProductResponse> saveProduct(ProductDto product)
        {
            try
            {
                List<ProductDto> listData = new List<ProductDto>();

                if (product != null)
                {
                    Product productResult = _productRL.saveProduct(product.Adapt<Product>());
                    listData.Add(productResult.Adapt<ProductDto>());
                    ProductResp.Message = "Successfull";
                    ProductResp.Success = true;
                }
                else
                {
                    ProductResp.Message = "Data cant't Empty";
                    ProductResp.Success = false;
                }



                ProductResp.Data = listData;
                ProductResp.StatusCode = 200;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                //ProductResp.Success = false;
                //ProductResp.Message = ex.Message;
                //ProductResp.Data = new List<ProductDto>();
                //ProductResp.StatusCode = 500;
            }
            return ProductResp;
        }

        public async Task<ProductResponse> updateProduct(ProductDto product)
        {
            try
            {
                List<ProductDto> listData = new List<ProductDto>();

                if (product != null)
                {
                    Product productResult = _productRL.updateProduct(product.Adapt<Product>()); ;
                    listData.Add(productResult.Adapt<ProductDto>());
                    ProductResp.Message = "Successfull";
                    ProductResp.Success = true;
                }
                else
                {
                    ProductResp.Message = "Data cant't Empty";
                    ProductResp.Success = false;
                }



                ProductResp.Data = listData;
                ProductResp.StatusCode = 200;
            }
            catch (Exception ex)
            {

                //ProductResp.Success = false;
                //ProductResp.Message = ex.Message;
                //ProductResp.Data = new List<ProductDto>();
                //ProductResp.StatusCode = 500;
                throw new Exception(ex.Message);
            }
            return ProductResp;
        }
    }
}
