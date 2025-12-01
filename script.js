/* ========= MENU MOBILE ========= */
const btnMenu = document.getElementById("btn-menu");
const nav = document.getElementById("main-nav");

btnMenu.addEventListener("click", () => {
  nav.classList.toggle("open");
  const expanded = btnMenu.getAttribute("aria-expanded") === "true";
  btnMenu.setAttribute("aria-expanded", String(!expanded));
});

/* ========= DARK MODE ========= */
const themeBtn = document.getElementById("btn-theme");
const sun = document.getElementById("icon-sun");
const moon = document.getElementById("icon-moon");

function applyTheme(theme) {
  if (theme === "dark") {
    document.body.classList.add("dark");
    sun.classList.remove("hidden");
    moon.classList.add("hidden");
  } else {
    document.body.classList.remove("dark");
    sun.classList.add("hidden");
    moon.classList.remove("hidden");
  }
}

let savedTheme = localStorage.getItem("theme") || "light";
applyTheme(savedTheme);

themeBtn.addEventListener("click", () => {
  const newTheme = document.body.classList.contains("dark") ? "light" : "dark";
  localStorage.setItem("theme", newTheme);
  applyTheme(newTheme);
});

/* ========= ROLAGEM SUAVE ========= */
document.querySelectorAll('a[href^="#"]').forEach(link => {
  link.addEventListener("click", (e) => {
    const target = document.querySelector(link.getAttribute("href"));
    if (target) {
      e.preventDefault();
      window.scrollTo({
        top: target.offsetTop - 60,
        behavior: "smooth"
      });
    }
  });
});
