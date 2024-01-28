using SupremeTech.ApiResponse;
using SupremeTech.CommonDto;

namespace SupremeTech.BusinessLayer
{
    public interface IProductBL
    {
        public Task<ProductResponse> GetAll();
        public Task<ProductResponse> GetById(long id);
        public Task<ProductResponse> saveProduct(ProductDto product);
        public Task<ProductResponse> deleteProduct(long id);
        public Task<ProductResponse> updateProduct(ProductDto product);
    }
}
