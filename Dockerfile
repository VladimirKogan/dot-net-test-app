FROM mcr.microsoft.com/dotnet/runtime:latest
WORKDIR /app
COPY bin/Release/net5.0/publish/ ./
ENTRYPOINT ["dotnet", "SimpleApp.dll"]
