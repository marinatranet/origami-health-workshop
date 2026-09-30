// Navigation only: no changes to the reference lab content or order.
const jump = document.querySelector('.mobile-nav select');
jump?.addEventListener('change', () => { if (jump.value) location.hash = jump.value; });
function revealCurrent() {
  const id = location.hash.slice(1) || 'orientation';
  document.querySelectorAll('.sidebar a[href^="#"]').forEach(link => {
    const active = link.getAttribute('href') === '#' + id;
    if (active) {
      link.setAttribute('aria-current', 'location');
      let ancestor = link.parentElement;
      while (ancestor && !ancestor.matches('.sidebar')) {
        if (ancestor.tagName === 'DETAILS') ancestor.open = true;
        ancestor = ancestor.parentElement;
      }
    } else link.removeAttribute('aria-current');
  });
}
window.addEventListener('hashchange', revealCurrent);
revealCurrent();
