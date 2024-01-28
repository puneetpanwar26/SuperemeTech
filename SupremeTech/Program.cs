using Microsoft.AspNetCore.Diagnostics;
using Microsoft.EntityFrameworkCore;
using SupremeTech.BusinessLayer;
using SupremeTech.Exceptions;
using SupremeTech.Models;
using SupremeTech.Repository;
using System.Net;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<OnlineShoppingContext>
    (options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"),
    sqlServerOptionsAction: sqlOptions =>
    {
        sqlOptions.EnableRetryOnFailure(
            maxRetryCount: 150,
            maxRetryDelay: System.TimeSpan.FromMinutes(30),
            errorNumbersToAdd: null);
    }));
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<ICustomerRL, CustomerRL>();
builder.Services.AddTransient<ICustomerBL, CustomerBL>();
builder.Services.AddTransient<IProductRL, ProductRL>();
builder.Services.AddTransient<IProductBL, ProductBL>();
builder.Services.AddCors();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
else
{
    //app.UseExceptionHandler(
    //    option =>
    //    {
    //        option.Run(
    //            async context =>
    //            {
    //                context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
    //                var ex = context.Features.Get<IExceptionHandlerFeature>();
    //                if (ex != null)
    //                {
    //                    await context.Response.WriteAsync(ex.Error.Message);
    //                }
    //            }
    //            );
    //    });
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();
// Add custom middleware For Handel Exception 
app.UseExceptionHandlerMiddleware();
app.UseCors(builder => builder
                .AllowAnyHeader()
                .AllowAnyMethod()
                .SetIsOriginAllowed((host) => true)
                .AllowCredentials()
            );
app.Run();
