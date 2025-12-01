// MENU MOBILE
const btnMenu = document.getElementById('btn-menu');
const nav = document.getElementById('main-nav');

btnMenu.addEventListener('click', () => {
  const opened = nav.classList.toggle('open');
  btnMenu.setAttribute('aria-expanded', opened ? 'true' : 'false');
  btnMenu.classList.toggle('is-active');
});

// DARK MODE (persistente)
const themeBtn = document.getElementById('btn-theme');
const iconSun = document.getElementById('icon-sun');
const iconMoon = document.getElementById('icon-moon');

function applyTheme(theme){
  if(theme === 'light'){
    document.documentElement.classList.add('light');
    iconSun.classList.remove('hidden');
    iconMoon.classList.add('hidden');
  } else {
    document.documentElement.classList.remove('light');
    iconSun.classList.add('hidden');
    iconMoon.classList.remove('hidden');
  }
}

const saved = localStorage.getItem('pw_theme') || 'dark';
applyTheme(saved);

themeBtn.addEventListener('click', () => {
  const current = document.documentElement.classList.contains('light') ? 'light' : 'dark';
  const next = current === 'light' ? 'dark' : 'light';
  localStorage.setItem('pw_theme', next);
  applyTheme(next);
});

// SMOOTH SCROLL (header offset)
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function(e){
    const href = this.getAttribute('href');
    if(!href || href === '#') return;
    const target = document.querySelector(href);
    if(target){
      e.preventDefault();
      const offset = 72;
      const top = target.getBoundingClientRect().top + window.scrollY - offset;
      window.scrollTo({ top, behavior: 'smooth' });
      // fecha menu mobile se aberto
      if(nav.classList.contains('open')){
        nav.classList.remove('open');
        btnMenu.setAttribute('aria-expanded','false');
      }
    }
  });
});
