using Microsoft.EntityFrameworkCore;
using RailwayManagementSystem.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllersWithViews();

// Configure PostgreSQL Database Context
builder.Services.AddDbContext<RailwayContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("RailwayDb"))
        .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking)); // Read-only for better performance

var app = builder.Build();

// Verify database connection
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var logger = services.GetRequiredService<ILogger<Program>>();
    var context = services.GetRequiredService<RailwayContext>();

    try
    {
        if (context.Database.CanConnect())
        {
            logger.LogInformation("Connected to the database successfully.");
        }
        else
        {
            logger.LogError("Failed to connect to the database.");
        }
    }
    catch (Exception ex)
    {
        logger.LogError(ex, "An error occurred while connecting to the database.");
    }
}

// Middleware pipeline
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Country}/{action=Index}/{id?}");

app.Run();