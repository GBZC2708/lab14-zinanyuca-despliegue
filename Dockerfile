# Etapa 1: compilar y publicar el proyecto con .NET 8
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS compilacion
WORKDIR /fuente
COPY Lab14.Zinanyuca.csproj ./
RUN dotnet restore Lab14.Zinanyuca.csproj
COPY . .
RUN dotnet publish Lab14.Zinanyuca.csproj -c Release -o /publicado --no-restore /p:UseAppHost=false

# Etapa 2: ejecutar la aplicacion (sin instalar el SDK en produccion)
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=compilacion /publicado .
ENV ASPNETCORE_URLS=http://0.0.0.0:10000
EXPOSE 10000
ENTRYPOINT ["dotnet", "Lab14.Zinanyuca.dll"]
