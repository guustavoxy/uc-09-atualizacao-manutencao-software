using Microsoft.EntityFrameworkCore;
using Domain.Entities;

namespace Infra.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Contato> Contatos { get; set; }
    public DbSet<FotoAntesDepois> FotosAntesDepois { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Se você tiver arquivos de configuração, aponte para eles aqui
        // Exemplo: modelBuilder.ApplyConfiguration(new FotoAntesDepoisConfiguration());
        
        base.OnModelCreating(modelBuilder);
    }
}