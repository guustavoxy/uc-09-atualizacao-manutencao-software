using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Galeria
    {
        public int Id { get; set; }
        public string Titulo { get; set; } = string.Empty;
        public string CaminhoImagem { get; set; } = string.Empty;
        public DateTime DataCriacao { get; set; } = DateTime.Now;
    }
}