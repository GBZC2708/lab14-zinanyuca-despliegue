var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

var app = builder.Build();

app.UseDefaultFiles();
app.UseStaticFiles();
app.MapControllers();

app.MapGet("/health", () => Results.Ok(new
{
    estado = "OK",
    aplicacion = "Lab14.Zinanyuca",
    laboratorio = 14
}));

app.Run();
