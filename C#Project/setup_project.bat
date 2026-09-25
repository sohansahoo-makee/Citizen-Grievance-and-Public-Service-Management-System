@echo off
echo Setting up Citizen Grievance System...

mkdir CitizenGrievanceSystem
cd CitizenGrievanceSystem

dotnet new sln -n CitizenGrievanceSystem
mkdir src
cd src

dotnet new webapi -n CitizenGrievance.API
dotnet new classlib -n CitizenGrievance.Application
dotnet new classlib -n CitizenGrievance.Domain
dotnet new classlib -n CitizenGrievance.Infrastructure

cd ..
dotnet sln add src/CitizenGrievance.API/CitizenGrievance.API.csproj
dotnet sln add src/CitizenGrievance.Application/CitizenGrievance.Application.csproj
dotnet sln add src/CitizenGrievance.Domain/CitizenGrievance.Domain.csproj
dotnet sln add src/CitizenGrievance.Infrastructure/CitizenGrievance.Infrastructure.csproj

cd src/CitizenGrievance.API
dotnet add reference ../CitizenGrievance.Application/CitizenGrievance.Application.csproj
dotnet add reference ../CitizenGrievance.Infrastructure/CitizenGrievance.Infrastructure.csproj

cd ../CitizenGrievance.Infrastructure
dotnet add reference ../CitizenGrievance.Application/CitizenGrievance.Application.csproj
dotnet add reference ../CitizenGrievance.Domain/CitizenGrievance.Domain.csproj

cd ../CitizenGrievance.Application
dotnet add reference ../CitizenGrievance.Domain/CitizenGrievance.Domain.csproj

cd ..\..
echo Project scaffolded successfully!
pause
