using Application.DTOs;
using Domain.Entities;
using Infra.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ApiPetshop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GaleriaController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        // O construtor recebe o Banco e o Ambiente (para achar a pasta wwwroot)
        public GaleriaController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        [HttpPost("upload")]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> UploadImagem([FromForm] UploadFotoDto dto)
        {
            if (dto.Arquivo == null || dto.Arquivo.Length == 0)
                return BadRequest("Nenhum arquivo enviado.");

            try
            {
                var uploadsFolder = Path.Combine(_environment.WebRootPath, "uploads");
                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);

                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(dto.Arquivo.FileName);
                var filePath = Path.Combine(uploadsFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await dto.Arquivo.CopyToAsync(stream);
                }

                var novaGaleria = new Galeria
                {
                    Titulo = dto.Titulo, 
                    CaminhoImagem = "/uploads/" + fileName,
                    DataCriacao = DateTime.Now
                };

                _context.Galeria.Add(novaGaleria);
                await _context.SaveChangesAsync();

                return Ok(new { mensagem = "Foto enviada com sucesso!", item = novaGaleria });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Erro interno: {ex.Message}");
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Galeria>>> GetGaleria()
        {
            return await _context.Galeria.OrderByDescending(x => x.DataCriacao).ToListAsync();
        }
    }
}