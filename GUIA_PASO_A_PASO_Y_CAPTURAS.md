# GUIA DETALLADA - LABORATORIO 14

**Estudiante:** Gerald Brand Zinanyuca Calcina · **Seccion:** C24-6-E  
**Tema:** Publicacion manual, GitHub Actions y Render  
**Requisitos:** Windows, Visual Studio 2022/Rider, Git y .NET SDK 8 o superior.

## PARTE 1 - Publicacion local en modo Release

**1. Preparar:** descomprime el ZIP, abre el archivo `Lab14.Zinanyuca.csproj` en Visual Studio o Rider y ejecuta `01_VERIFICAR_REQUISITOS.bat`. Aunque tu SDK principal sea 10.0.401, el proyecto solicita `net8.0`. Si falta `Microsoft.AspNetCore.App 8.x` en `dotnet --list-runtimes`, instala el runtime ASP.NET Core 8 desde Microsoft para ejecutar localmente en .NET 8.

**2. Publicar:** haz doble clic en `02_PUBLICAR_RELEASE.bat`. El equivalente en PowerShell, estando dentro de esta carpeta, es:

```powershell
dotnet restore .\Lab14.Zinanyuca.csproj
dotnet publish .\Lab14.Zinanyuca.csproj -c Release -f net8.0 -o .\Publicado
```

Conserva `Build succeeded` y archivos como `Lab14.Zinanyuca.dll`, `Lab14.Zinanyuca.deps.json`, `Lab14.Zinanyuca.runtimeconfig.json`, `wwwroot` en `Publicado/`. **No confundas `bin/Debug` con `Publicado/`.**

**3. Ejecutar codigo:** doble clic en `03_EJECUTAR_LOCAL.bat`; sin cerrar la consola ejecuta `04_ABRIR_Y_PROBAR.bat`. Debe responder en `http://localhost:5080`, `/api/estado` y `/health`.

**4. Ejecutar artefacto de publicacion:** deja libre el puerto 5081 y ejecuta `05_EJECUTAR_PUBLICADO.bat`. En otro momento abre `06_PROBAR_PUBLICADO.bat`; debe mostrarse la misma pagina en `http://localhost:5081`. Esto prueba que la carpeta publicada funciona.

**EVIDENCIA E01 - Proyecto y publicacion:** en Visual Studio/Rider, abre Explorador de soluciones para que aparezca `Lab14.Zinanyuca.csproj` y la carpeta de código. Junto a el coloca la consola de `02_PUBLICAR_RELEASE.bat` terminada con éxito. Usa Win+Shift+S y guarda como `E01_proyecto_y_publicacion.png`. **Texto:** «Publiqué el proyecto ASP.NET Core 8 en modo Release y generé los archivos necesarios para su ejecución».

**EVIDENCIA E02 - Archivos generados:** abre el Explorador de archivos en `Publicado/`, usa vista Detalles para que se vean `.dll`, `.deps.json`, `.runtimeconfig.json` y `wwwroot`. Captura con Win+Shift+S como `E02_archivos_publicados.png`. **Texto:** «Verifiqué los archivos generados por la publicación en una carpeta local».

**EVIDENCIA E03 - Prueba de lo publicado:** con `05_EJECUTAR_PUBLICADO.bat` abierto, visita `http://localhost:5081` y `http://localhost:5081/health`. Captura pantalla donde se vea la URL y respuesta. Guarda `E03_ejecucion_publicada.png`. **Texto:** «Comprobé que la versión publicada responde correctamente desde un navegador».

**Ubicación Word:** Parte 1, página 3, recuadro «Toma una captura». Usa E01 y E02 allí y, si no caben, añade E03 inmediatamente después del recuadro.

## PARTE 2 - GitHub y GitHub Actions

**5. Crear repositorio:** abre `https://github.com/new` (sesión de `GBZC2708`). Pon `lab14-zinanyuca-despliegue`, visibilidad **Public** para facilitar la conexión académica a Render (o Private si lo prefieres y Render tiene acceso). **No marques** «Add a README» ni .gitignore, porque ya vienen en el ZIP. Haz clic en **Create repository**. La ruta esperada sera `https://github.com/GBZC2708/lab14-zinanyuca-despliegue` una vez creado.

**6. Subir fuente:** abre PowerShell EN ESTA CARPETA (donde esta `Lab14.Zinanyuca.csproj`) y ejecuta, linea por linea:

```powershell
git init -b main
git add .
git status
git commit -m "Laboratorio 14: publicacion y CI/CD"
git remote add origin https://github.com/GBZC2708/lab14-zinanyuca-despliegue.git
git push -u origin main
```

Si Git solicita identidad ejecuta `git config --global user.name "Gerald Brand Zinanyuca Calcina"` y `git config --global user.email "TU_CORREO_DE_GITHUB"`; luego repite el commit. Si pide autenticacion, utiliza la ventana oficial de Git Credential Manager; no copies tokens en el chat.

**7. Revisar Actions:** entra al repositorio → pestaña **Actions** → workflow `Build and Deploy .NET Application` → última ejecución. Deben verse verdes `Obtener el codigo`, `Instalar .NET 8`, `Restaurar dependencias`, `Compilar en Release`, `Publicar aplicacion` y `Guardar archivos publicados`. En el resumen de la ejecución se muestra el **artifact** `lab14-publicado` descargable. En el primer push la tarea de Render se **omitirá** porque todavía no existe el secreto; eso es esperado, no un error.

**EVIDENCIA E04 - Repositorio:** captura la pestaña Code donde se aprecie URL del repositorio, `Dockerfile`, `Program.cs`, `.github/` y `Lab14.Zinanyuca.csproj`. Guarda `E04_repositorio.png`. **Texto:** «Subí el código del proyecto a un repositorio independiente de GitHub».

**EVIDENCIA E05 - Ejecución del workflow:** abre la última ejecución en Actions. Captura la lista de pasos con marcas de éxito. Guarda `E05_actions_exitoso.png`. **Texto:** «Configuré GitHub Actions para restaurar, compilar y publicar el proyecto automáticamente».

**EVIDENCIA E06 - Artefacto:** abre la página resumen del workflow, desplázate a **Artifacts** y captura el archivo `lab14-publicado`. Guarda `E06_artifact.png`. **Texto:** «La integración continua generó y conservó los archivos publicados como evidencia».

**Ubicación Word:** Parte 2, página 5, recuadro de **Verificación**. Usa E05; añade E04 y E06 debajo si no caben en el mismo recuadro.

## PARTE 3 - Render con Docker

**8. Conectar Render:** entra a `https://dashboard.render.com` y a tu workspace. Si no ves GitHub, haz **New → Web Service → Connect repository** e instala/autoriza la integración de Render para el repositorio `GBZC2708/lab14-zinanyuca-despliegue`.

**9. Configurar servicio:** en **New → Web Service**, elige el nuevo repositorio, rama `main`, nombre `lab14-zinanyuca`, región de tu preferencia y **Language/Runtime = Docker** (no Node, no Python). Verifica que el archivo `Dockerfile` esté en la raíz y que el **Root Directory** esté vacío. Elige el plan que tu cuenta permita y revisa los costes antes de crear. Presiona **Deploy Web Service**.

**10. Verificar primer despliegue:** en Render → servicio → **Events/Logs**, comprueba que el build y el deploy terminen en **Live**. Abre la URL asignada por Render (del tipo `https://lab14-zinanyuca.onrender.com`, el nombre real puede ser distinto). Prueba esa URL, `/api/estado` y `/health`. El `Dockerfile` escucha en `0.0.0.0:10000`, puerto de Render por defecto.

**11. Habilitar despliegue desde Actions:** en Render → servicio → **Settings**, cambia **Auto-Deploy** a **Off** (evita doble despliegue). En **Deploy Hook** copia la URL secreta, pero **NO la pegues en el chat ni el Word**. Ve a GitHub → repositorio → **Settings → Secrets and variables → Actions → New repository secret**. Nombre: `RENDER_DEPLOY_HOOK_URL`; valor: la URL secreta de Render. GitHub no muestra el valor una vez guardado.

**12. Probar despliegue automatico real:** en GitHub → pestaña **Actions** → selecciona el workflow → **Run workflow** sobre `main` (o haz un nuevo commit). Confirma que el paso `Iniciar despliegue en Render` se ejecute y quede verde. En Render comprueba que aparezca un despliegue nuevo y termine en **Live**. Esto demuestra que Actions dispara el despliegue despues de publicar el artefacto.

**EVIDENCIA E07 - Configuracion de Render:** captura la ficha del Web Service que muestre repositorio asociado, rama `main` y runtime Docker. Oculta cualquier token o deploy hook. Guarda `E07_render_config.png`. **Texto:** «Conecté el repositorio GitHub con Render usando Docker para ejecutar la API .NET 8».

**EVIDENCIA E08 - Deploy Live:** abre Render → Events/Deploys y captura el estado `Live` y la URL del servicio. Guarda `E08_render_live.png`. **Texto:** «Comprobé el despliegue exitoso de la aplicación en Render».

**EVIDENCIA E09 - URL publica y CI/CD:** en el navegador abre la URL pública, pulsa enlace **Comprobar estado** (`/health`), captura con la URL visible. Adjunta por separado una captura de GitHub Actions con el paso de Render verde (`E09_accion_despliegue.png`). **Texto:** «Verifiqué el acceso público a la API y la activación automática del despliegue desde GitHub Actions».

**Ubicación Word:** Parte 3, página 6, recuadro de evidencia. Usa E08 y E09 (URL de la app); añade E07 en el texto de configuración si hace falta.

## Lista de comprobacion final

- [ ] Proyecto .NET 8 compilado sin errores en Windows.
- [ ] Publicacion Release en `Publicado/` y ejecucion real de lo publicado.
- [ ] Repositorio nuevo bajo GBZC2708 y workflow funcional.
- [ ] Artifact publicado en GitHub Actions.
- [ ] Servicio Render en estado Live con URL verificada.
- [ ] Deploy Hook guardado **solo como GitHub Secret** y prueba de CD exitosa.
- [ ] Nueve capturas reales E01–E09, segun instrucciones.
- [ ] Documento original con cinco observaciones y cinco conclusiones.

## Si algo falla

- **Error SDK 8:** `dotnet --list-sdks` y `dotnet --list-runtimes` para verificar el runtime o targeting pack.
- **Error al abrir localhost:** no cierres la consola del servidor; comprueba que usa el puerto 5080 o 5081.
- **GitHub Actions rojo:** abre la tarea fallida y comparte solo las lineas del error, sin secretos.
- **Render no muestra el repositorio:** revisa la instalacion de Render en tu cuenta GitHub y acceso al repo nuevo.
- **Render falla en Docker:** confirma `Runtime: Docker`, `Dockerfile Path: ./Dockerfile`, `Root Directory: vacio`.
- **Render falla health-check:** revisa puerto 10000 y que app escuche en `0.0.0.0`.
- **Deploy Hook omitido:** revisa que el secreto de GitHub se llame exactamente `RENDER_DEPLOY_HOOK_URL` y ejecuta nuevamente el workflow.

**Norma de evidencias:** captura con Win+Shift+S (o `Win+PrtScrn`), guarda cada PNG en `EVIDENCIAS`, no simules estados ni reveles contraseñas, tokens o deploy hooks.
