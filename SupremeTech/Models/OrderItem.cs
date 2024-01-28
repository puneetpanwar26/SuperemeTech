using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class OrderItem
{
    public long Id { get; set; }

    public long? OrderId { get; set; }

    public long? ProdId { get; set; }

    public int? Qty { get; set; }

    public double? Price { get; set; }

    public double? Amount { get; set; }

    public double? Discount { get; set; }

    public double? TotalAmount { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Product? Prod { get; set; }
}
