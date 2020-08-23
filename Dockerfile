#
# RUN COMMAND
#  docker run --name web --rm -it -p 5000:80 web:v1.0
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]




