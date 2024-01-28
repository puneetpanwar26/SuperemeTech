using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class Order
{
    public long OrderId { get; set; }

    public long? UserId { get; set; }

    public long? AddressId { get; set; }

    public double? SubTotal { get; set; }

    public double? Discount { get; set; }

    public double? Total { get; set; }

    public double? GrandTotal { get; set; }

    public DateTime? CreatedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual Address? Address { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual User? User { get; set; }
}
