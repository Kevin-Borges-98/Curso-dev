@echo off
SETLOCAL

REM Definir cores para melhor visualização
color 0A

REM Navegar até o diretório do projeto (diretório onde o script está localizado)
cd /d %~dp0

echo ================================
echo Iniciando o Equinox Project
echo ================================

REM Passo 1: Restaurar Dependências
echo Restaurando dependências...
dotnet restore
if ERRORLEVEL 1 (
    echo Erro ao restaurar dependências.
    pause
    exit /b 1
)
echo Dependências restauradas com sucesso.

REM Passo 2: Adicionar o Pacote EF Core Design (Se ainda não estiver adicionado)
echo Verificando se o pacote Microsoft.EntityFrameworkCore.Design está instalado...
cd src\Equinox.Infra.Data
dotnet list package | findstr /i "Microsoft.EntityFrameworkCore.Design"
if ERRORLEVEL 1 (
    echo Pacote não encontrado. Adicionando Microsoft.EntityFrameworkCore.Design...
    dotnet add package Microsoft.EntityFrameworkCore.Design --version 8.0.7
    if ERRORLEVEL 1 (
        echo Erro ao adicionar o pacote Microsoft.EntityFrameworkCore.Design.
        pause
        exit /b 1
    )
    echo Pacote Microsoft.EntityFrameworkCore.Design adicionado com sucesso.
) else (
    echo Pacote Microsoft.EntityFrameworkCore.Design já está instalado.
)

REM Passo 3: Restaurar Novamente (Após Adicionar o Pacote)
echo Restaurando dependências novamente...
dotnet restore
if ERRORLEVEL 1 (
    echo Erro ao restaurar dependências após adicionar o pacote.
    pause
    exit /b 1
)
echo Dependências restauradas com sucesso.

REM Passo 4: Executar o Script SQL para Gerar o Banco de Dados
echo Executando o script SQL para criar/configurar o banco de dados...

REM Definir variáveis para o servidor e banco de dados
SET SQL_SERVER=.\SQLEXPRESS
SET DATABASE_NAME=Equinox
SET SQL_SCRIPT_PATH=%~dp0sql\GenerateDataBase.sql

REM Verificar se o script SQL existe
IF NOT EXIST "%SQL_SCRIPT_PATH%" (
    echo Arquivo SQL %SQL_SCRIPT_PATH% não encontrado.
    pause
    exit /b 1
)

REM Executar o script SQL usando SQLCMD
sqlcmd -S %SQL_SERVER% -i "%SQL_SCRIPT_PATH%"
if ERRORLEVEL 1 (
    echo Erro ao executar o script SQL.
    pause
    exit /b 1
)
echo Script SQL executado com sucesso.
cd ..\..
REM Passo 5: Executar a API e o Frontend Web Simultaneamente
echo Iniciando a API e o Frontend Web...

REM Iniciar o Frontend Web em outra nova janela do terminal
start cmd /k "cd src\Equinox.UI.Web && dotnet run"

echo ================================
echo Equinox Project está rodando!
echo Frontend Web e API foram iniciados em janelas separadas.
echo ================================

REM Finalizar o script
ENDLOCAL
pause
