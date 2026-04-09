// app.js - Patas Felizes Pet Shop
// Versão Corrigida - Equipe de Desenvolvimento UC-09

document.addEventListener('DOMContentLoaded', function () {

    // =====================
    // VALIDAÇÃO DO FORMULÁRIO
    // =====================

    // CORREÇÃO BUG #20: Alterado para 'formContato' (ID correto do HTML)
    const form = document.getElementById('formContato');

    if (form) {
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const nome = document.getElementById('nome').value.trim();
            const email = document.getElementById('e-mail').value.trim();
            const mensagem = document.getElementById('mensagem').value.trim();

            // CORREÇÃO BUG #21: Validação de formato de e-mail usando Regex
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!nome || !email || !mensagem) {
                alert('Por favor, preencha todos os campos!');
                return;
            }

            if (!emailRegex.test(email)) {
                alert('Por favor, insira um e-mail válido!');
                return;
            }

            // CORREÇÃO BUG #22: Mensagem agora condiz com o domínio corrigido no HTML (.com.br)
            alert('Mensagem enviada com sucesso! Nossa equipe entrará em contato em breve.');
            form.reset();
        });
    }

    // =====================
    // HIGHLIGHT DO MENU ATIVO
    // =====================

    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('nav a');
    const headerHeight = document.querySelector('header').offsetHeight; // Captura altura do header

    window.addEventListener('scroll', function () {
        let current = '';

        sections.forEach(section => {
            // CORREÇÃO BUG #23: Agora considera a altura do header fixo (sticky)
            // Subtraímos a altura do header + um respiro de 10px para precisão
            const sectionTop = section.offsetTop - (headerHeight + 10);
            if (window.scrollY >= sectionTop) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('text-yellow-200', 'underline'); // Remove estilos de ativo
            if (link.getAttribute('href') === '#' + current) {
                // Adiciona classes para destacar (exemplo usando Tailwind)
                link.classList.add('text-yellow-200', 'underline');
            }
        });
    });

    // =====================
    // ANO NO FOOTER (DINÂMICO)
    // =====================

    // CORREÇÃO BUG #19: Localiza o parágrafo do copyright e atualiza o ano automaticamente
    const footerCopyright = document.querySelector('footer p');
    const anoAtual = new Date().getFullYear();
    
    if (footerCopyright) {
        footerCopyright.textContent = `© ${anoAtual} Patas Felizes Pet Shop. Todos os direitos reservados.`;
    }
});

const menuButton = document.getElementById('menu-button');
const menuList = document.getElementById('menu-list');

if (menuButton && menuList) {
    menuButton.addEventListener('click', function() {
        // Toggle (liga/desliga) a classe 'hidden' que esconde o menu
        menuList.classList.toggle('hidden');
        menuList.classList.toggle('flex'); // Garante que ao aparecer, use flexbox
    });

    // Fechar o menu ao clicar em um link (opcional, melhora a UX)
    const links = menuList.querySelectorAll('a');
    links.forEach(link => {
        link.addEventListener('click', () => {
            if (window.innerWidth < 768) { // Apenas se estiver no mobile
                menuList.classList.add('hidden');
            }
        });
    });
}

document.addEventListener('DOMContentLoaded', () => {
  // Menu Hamburguer
  const btn = document.getElementById('menu-button');
  const menu = document.getElementById('menu-list');
  btn.addEventListener('click', () => menu.classList.toggle('hidden'));

  // Agendamento
  const form = document.getElementById('formAgendamento');
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const pet = document.getElementById('agendamento-pet').value;
    if(!pet) return alert('Por favor, informe o nome do pet!');
    alert(`Solicitação enviada para o suporte! Entraremos em contato.`);
    form.reset();
  });
});