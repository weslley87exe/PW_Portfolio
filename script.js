// Animações simples para interação
document.addEventListener('DOMContentLoaded', () => {
  const techs = document.querySelectorAll('.tech-item');
  techs.forEach((t, i) => {
    t.style.opacity = '0';
    setTimeout(() => {
      t.style.transition = 'opacity 0.6s ease';
      t.style.opacity = '1';
    }, i * 150);
  });
});
