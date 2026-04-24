using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace Application.DTOs
{
    public class UploadFotoDto
    {
        public string Titulo { get; set; } = string.Empty;
        public IFormFile Arquivo { get; set; } = null!;
    }
}