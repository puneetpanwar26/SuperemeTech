using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class Cart
{
    public long CartId { get; set; }

    public long? UserId { get; set; }

    public long? ProdId { get; set; }

    public int? Qty { get; set; }

    public double? Price { get; set; }

    public double? Total { get; set; }

    public DateTime? CreatedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual Product? Prod { get; set; }

    public virtual User? User { get; set; }
}
