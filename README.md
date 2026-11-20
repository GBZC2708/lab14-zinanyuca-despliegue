# LABORATORIO 14 - Publicacion y despliegue .NET 8

**Estudiante:** Gerald Brand Zinanyuca Calcina  
**Curso:** Desarrollo de Aplicaciones Empresariales Avanzadas  
**Docente:** J. L. Mayhua Ubillas  
**GitHub:** https://github.com/GBZC2708

Este proyecto ASP.NET Core 8 presenta una pagina principal y dos rutas para verificar el funcionamiento:

- `/` - pagina de inicio.
- `/api/estado` - endpoint de un controlador ASP.NET Core.
- `/health` - estado de la aplicacion para pruebas de despliegue.

El ejemplo **no usa base de datos, JWT ni contrasenas**. No requiere paquetes NuGet adicionales.

## En Windows

1. Descomprime el ZIP.
2. Abre esta carpeta en Visual Studio o Rider, o abre `Lab14.Zinanyuca.csproj`.
3. Ejecuta `01_VERIFICAR_REQUISITOS.bat` y confirma que se encuentra un runtime Microsoft.AspNetCore.App 8.x.
4. Ejecuta `02_PUBLICAR_RELEASE.bat`. Se creara `Publicado/`.
5. Ejecuta `03_EJECUTAR_LOCAL.bat` y, sin cerrarlo, `04_ABRIR_Y_PROBAR.bat`.
6. Ejecuta `05_EJECUTAR_PUBLICADO.bat` en otra consola y `06_PROBAR_PUBLICADO.bat` para verificar los binarios publicados.

## En GitHub y Render

Lee **GUIA_PASO_A_PASO_Y_CAPTURAS.md** antes de subir el proyecto. Necesitas crear un **repositorio propio** llamado `lab14-zinanyuca-despliegue` en la cuenta GBZC2708. No modifiques otros repositorios de tus cursos.

El workflow hace restore/build/publish, conserva los archivos compilados como artifact y, **solo si configuras** el secreto `RENDER_DEPLOY_HOOK_URL`, solicita el despliegue a Render despues de completar las comprobaciones.

**No hay despliegue publico hecho todavia.** Solo deben tomarse capturas de acciones realmente realizadas en tu equipo o cuentas.
