FROM mcr.microsoft.com/dotnet/aspnet:5.0-focal AS base
COPY Publish app/
WORKDIR /app
EXPOSE 5002
ENTRYPOINT ["dotnet", "Docker-Openshift.dll"]
