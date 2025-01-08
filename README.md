## Pré-requisitos

Antes de iniciar, certifique-se de ter os seguintes pré-requisitos instalados em sua máquina:

- **Sistema Operacional**: Windows 10 ou superior
- **.NET SDK 8.0**: [Baixe aqui](https://dotnet.microsoft.com/download/dotnet/8.0)
- **SQL Server Express**: [Baixe aqui](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)
- **SQL Server Management Studio (SSMS)** (opcional, mas recomendado para gerenciar o banco de dados): [Baixe aqui](https://docs.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms)
- **Git**: [Baixe aqui](https://git-scm.com/downloads)


### Validar a String de Conexão

1. **Localizar o Arquivo de Configuração**:
   
   - Navegue até os projetos **API** e **Web** dentro da pasta `src`.
   - Abra o arquivo `appsettings.json` em cada projeto.

2. **Verificar a String de Conexão**:
   
   - Certifique-se de que a string de conexão aponta para a instância correta do SQL Server e para o banco de dados `Equinox`.
   
   **Exemplo de `appsettings.json`:**
   ```json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Server=.\\SQLEXPRESS;Database=Equinox;Trusted_Connection=True;MultipleActiveResultSets=true"
     },
     // Outros settings
   }
   
## Passos para Executar:

Navegue até a Raiz do Projeto:

Abra o Explorador de Arquivos e vá para ..\EquinoxProject-master\.

Executar o Script Batch:

Dê um duplo clique no arquivo run_equinox.bat.
OU abra o Prompt de Comando, navegue até a raiz do projeto e execute:
	
	batch
	run_equinox.bat
	
## Executando as Aplicações
Frontend Web:
	URL: http://localhost:5000
