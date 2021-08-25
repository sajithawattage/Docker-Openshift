#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/runtime:3.1-buster-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src

COPY ["Batch-Job-ConsoleApp/Batch-Job-ConsoleApp.csproj", "Batch-Job-ConsoleApp/"]
RUN dotnet restore "Batch-Job-ConsoleApp/Batch-Job-ConsoleApp.csproj"
COPY . .
WORKDIR "/src/Batch-Job-ConsoleApp"
RUN dotnet build "Batch-Job-ConsoleApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Batch-Job-ConsoleApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
RUN chmod -R 777 /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Batch-Job-ConsoleApp.dll"]