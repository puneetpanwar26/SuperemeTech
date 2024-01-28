using SupremeTech.CommonDto;

namespace SupremeTech.ApiResponse
{
    public class ProductResponse
    {
        public int StatusCode { get; set; }
        public List<ProductDto> Data { get; set; }
        public string Message { get; set; }
        public bool Success { get; set; }
    }
}
