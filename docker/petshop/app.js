// app.js - Patas Felizes Pet Shop
// Versão Atualizada - Integração com API (Issue #19)

document.addEventListener("DOMContentLoaded", function () {
  // =====================
  // VALIDAÇÃO E ENVIO DO FORMULÁRIO (Issue #19)
  // =====================
  const form = document.getElementById("formContato");

  if (form) {
    form.addEventListener("submit", async function (e) {
      // Adicionado 'async' para o fetch
      e.preventDefault();

      const nome = document.getElementById("nome").value.trim();
      const email = document.getElementById("e-mail").value.trim();
      const mensagem = document.getElementById("mensagem").value.trim();

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

      // Validações básicas de frontend
      if (!nome || !email || !mensagem) {
        alert("Por favor, preencha todos os campos!");
        return;
      }

      if (!emailRegex.test(email)) {
        alert("Por favor, insira um e-mail válido!");
        return;
      }

      // --- INÍCIO DA INTEGRAÇÃO COM A API ---
      const dados = {
        nome: nome,
        email: email,
        mensagem: mensagem,
      };

      try {
        // Substitua a porta 7217 pela porta que sua API está usando no Visual Studio
        const response = await fetch("https://localhost:7217/api/Contatos", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(dados),
        });

        if (response.ok) {
          alert(
            "Mensagem enviada com sucesso! Nossa equipe entrará em contato em breve.",
          );
          form.reset();
        } else {
          const erroData = await response.json();
          alert(
            "Erro ao enviar mensagem: " +
              (erroData.message || "Verifique os dados."),
          );
        }
      } catch (error) {
        console.error("Erro na requisição:", error);
        alert(
          "Não foi possível conectar à API. Verifique se o servidor está rodando.",
        );
      }
      // --- FIM DA INTEGRAÇÃO ---
    });
  }

  // =====================
  // HIGHLIGHT DO MENU ATIVO
  // =====================
  const sections = document.querySelectorAll("section[id]");
  const navLinks = document.querySelectorAll("nav a");
  const header = document.querySelector("header");
  const headerHeight = header ? header.offsetHeight : 0;

  window.addEventListener("scroll", function () {
    let current = "";

    sections.forEach((section) => {
      const sectionTop = section.offsetTop - (headerHeight + 20);
      if (window.scrollY >= sectionTop) {
        current = section.getAttribute("id");
      }
    });

    navLinks.forEach((link) => {
      link.classList.remove("text-yellow-200", "underline");
      if (link.getAttribute("href") === "#" + current) {
        link.classList.add("text-yellow-200", "underline");
      }
    });
  });

  // =====================
  // ANO NO FOOTER (DINÂMICO)
  // =====================
  const footerCopyright = document.querySelector("footer p");
  const anoAtual = new Date().getFullYear();

  if (footerCopyright) {
    footerCopyright.textContent = `© ${anoAtual} Patas Felizes Pet Shop. Todos os direitos reservados.`;
  }

  // =====================
  // MENU HAMBÚRGUER E AGENDAMENTO
  // =====================
  const menuButton = document.getElementById("menu-button");
  const menuList = document.getElementById("menu-list");

  if (menuButton && menuList) {
    menuButton.addEventListener("click", function () {
      menuList.classList.toggle("hidden");
      menuList.classList.toggle("flex");
    });

    const links = menuList.querySelectorAll("a");
    links.forEach((link) => {
      link.addEventListener("click", () => {
        if (window.innerWidth < 768) {
          menuList.classList.add("hidden");
        }
      });
    });
  }

  const formAgendamento = document.getElementById("formAgendamento");
  if (formAgendamento) {
    formAgendamento.addEventListener("submit", (e) => {
      e.preventDefault();
      const pet = document.getElementById("agendamento-pet").value;
      if (!pet) return alert("Por favor, informe o nome do pet!");
      alert(
        `Solicitação de agendamento enviada para o suporte! Entraremos em contato.`,
      );
      formAgendamento.reset();
    });
  }
});
