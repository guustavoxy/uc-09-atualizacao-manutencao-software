using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ApiPetshop.Data.Configurations; 

public class GaleriaConfiguration : IEntityTypeConfiguration<Galeria>
{
    public void Configure(EntityTypeBuilder<Galeria> builder)
    {
        // Define a chave primária
        builder.HasKey(g => g.Id);

        // Configura o título (obrigatório e tamanho máximo)
        builder.Property(g => g.Titulo)
            .IsRequired()
            .HasMaxLength(100);

        // Configura o caminho da imagem
        builder.Property(g => g.CaminhoImagem)
            .IsRequired()
            .HasMaxLength(255);

        // Configura a data
        builder.Property(g => g.DataCriacao)
            .IsRequired();
    }
}