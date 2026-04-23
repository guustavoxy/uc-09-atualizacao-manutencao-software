using Microsoft.AspNetCore.Mvc;
using Infra.Data;
using Domain.Entities;
using Application.DTOs;
using ApiPetshop.Data;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/[controller]")]
public class ContatosController : ControllerBase
{
    private readonly AppDbContext _context;

    public ContatosController(AppDbContext context)
    {
        _context = context;
    }

    [HttpPost]
    public async Task<IActionResult> Post([FromBody] ContatoDTO dto)
    {
        // Validação básica
        if (string.IsNullOrEmpty(dto.Email) || !dto.Email.Contains("@"))
            return BadRequest("E-mail inválido.");

        var contato = new Contato
        {
            Nome = dto.Nome,
            Email = dto.Email,
            Mensagem = dto.Mensagem
        };

        _context.Contatos.Add(contato);
        await _context.SaveChangesAsync();

        return Ok(new { mensagem = "Contato enviado com sucesso!" });
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Contato>>> GetContatos()
    {
        // Retorna todos os contatos salvos no banco, ordenados pelo mais recente
        return await _context.Contatos
            .OrderByDescending(c => c.Id)
            .ToListAsync();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteContato(int id)
    {
        var contato = await _context.Contatos.FindAsync(id);

        if (contato == null)
        {
            return NotFound(new { message = "Contato não encontrado!" });
        }

        _context.Contatos.Remove(contato);
        await _context.SaveChangesAsync();

        return Ok(new { message = $"Contato {id} removido com sucesso!" });
    }
}