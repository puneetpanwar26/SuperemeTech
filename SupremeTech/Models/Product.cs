using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class Product
{
    public long ProdId { get; set; }

    public string? ProdName { get; set; }

    public string? Sku { get; set; }

    public string? Description { get; set; }

    public int? Qty { get; set; }

    public double? Price { get; set; }

    public double? Discount { get; set; }

    public DateTime? CreatedDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public bool? IsActive { get; set; }

    public long? UserId { get; set; }

    public virtual ICollection<Cart> Carts { get; set; } = new List<Cart>();

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual ICollection<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();

    public virtual User? User { get; set; }
}
