using SupremeTech.CommonDto;

namespace SupremeTech.ApiResponse
{
    public class CustomerResponse
    {
        public int StatusCode { get; set; }
        public List<CustomerDto> Data { get; set; }
        public string Message { get; set; }
        public bool Success { get; set; }
      
    }
}
