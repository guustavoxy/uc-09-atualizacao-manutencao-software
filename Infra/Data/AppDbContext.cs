using Microsoft.EntityFrameworkCore;
using Domain.Entities;
using ApiPetshop.Data.Configurations; 

namespace Infra.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Contato> Contatos { get; set; }
    public DbSet<FotoAntesDepois> FotosAntesDepois { get; set; }
    public DbSet<Galeria> Galeria { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);

        base.OnModelCreating(modelBuilder);
    }
}