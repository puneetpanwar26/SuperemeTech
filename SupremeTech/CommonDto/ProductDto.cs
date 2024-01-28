namespace SupremeTech.CommonDto
{
    public class ProductDto
    {
        public long ProdId { get; set; }

        public string ProdName { get; set; }

        public string Sku { get; set; }

        public string Description { get; set; }

        public int Qty { get; set; }

        public double Price { get; set; }

        public double Discount { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdateDate { get; set; }

        public bool IsActive { get; set; }

        public long UserId { get; set; }
    }
}
