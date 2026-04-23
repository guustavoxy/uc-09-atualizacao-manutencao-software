using ApiPetshop.Data;
using Infra.Data; // Certifique-se de usar o namespace da Infra como corrigimos antes
using Microsoft.EntityFrameworkCore;

// Inicializa o criador (builder) da aplicação Web
var builder = WebApplication.CreateBuilder(args);

// ... (CORS e outras configurações seguem iguais) ...
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
    });
});

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(
        connectionString,
        new MySqlServerVersion(new Version(8, 0, 36)),
        mySqlOptions => mySqlOptions.EnableRetryOnFailure()
    )
);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

// Configura o gerador do Swagger
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new() { Title = "ApiPetshop", Version = "v1" });
});

var app = builder.Build();

// --- ALTERAÇÃO AQUI: TROCANDO SCALAR PELO SWAGGER UI ---
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    // Substituímos o app.MapScalarApiReference por:
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "ApiPetshop v1");
        options.RoutePrefix = string.Empty; // Faz o Swagger abrir direto na raiz (opcional)
    });
}
// -------------------------------------------------------

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseCors("AllowAll");
app.UseAuthorization();
app.MapControllers();

// Bloco de Seed (Cuidado: certifique-se de que as tabelas existem no MySQL Workbench como fizemos)
using (var scope = app.Services.CreateScope())
{
    // AQUI: Adicione o prefixo Infra.Data. antes de AppDbContext
    var db = scope.ServiceProvider.GetRequiredService<Infra.Data.AppDbContext>();
    
    // Opcional: Garanta que o banco seja criado
    db.Database.EnsureCreated(); 
    
    SeedData.Seed(db);
}

app.Run(); 