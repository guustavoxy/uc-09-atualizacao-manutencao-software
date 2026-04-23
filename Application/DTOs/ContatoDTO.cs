using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs;

public record ContatoDTO(string Nome, string Email, string Mensagem);
