using Microsoft.AspNetCore.Mvc;

namespace Lab14.Zinanyuca.Controllers;

[ApiController]
[Route("api/[controller]")]
public class EstadoController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok(new
        {
            mensaje = "API del Laboratorio 14 funcionando",
            autor = "Gerald Brand Zinanyuca Calcina",
            curso = "Desarrollo de Aplicaciones Empresariales Avanzadas"
        });
    }
}
