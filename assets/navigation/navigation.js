(() => {
  const nav = document.querySelector('.workshop-nav');
  if (!nav) return;
  const sections = [...document.querySelectorAll('main > section[id]')];
  const labLinks = [...nav.querySelectorAll('.nav-lab')];
  const stepLinks = [...nav.querySelectorAll('.nav-steps a')];
  const allLinks = [...labLinks, ...stepLinks];
  const mobile = document.querySelector('.mobile-nav select');
  const targetOf = link => document.getElementById(link.hash.slice(1));
  function update(section, anchor) {
    if (!section) return;
    labLinks.forEach(link => {
      const current = link.hash === '#' + section.id;
      link.classList.toggle('is-current', current);
      const details = link.closest('details');
      if (details) details.classList.toggle('is-current', current);
      if (current) {
        link.setAttribute('aria-current', 'location');
      } else link.removeAttribute('aria-current');
    });
    stepLinks.forEach(link => {
      if (targetOf(link) === anchor) link.setAttribute('aria-current', 'location');
      else link.removeAttribute('aria-current');
    });
    if (mobile) mobile.value = section.id;
  }
  function readPosition() {
    const topbar = document.querySelector('.topbar');
    const threshold = (topbar ? topbar.getBoundingClientRect().bottom : 61) + 75;
    let section = sections[0];
    for (const candidate of sections) {
      if (candidate.getBoundingClientRect().top <= threshold) section = candidate;
    }
    let anchor = null;
    for (const link of stepLinks) {
      const target = targetOf(link);
      if (target && section.contains(target) && target.getBoundingClientRect().top <= threshold) anchor = target;
    }
    update(section, anchor);
  }
  function followHash() {
    const target = document.getElementById(location.hash.slice(1));
    const section = target && target.closest('main > section');
    if (section) {
      const link = labLinks.find(item => item.hash === '#' + section.id);
      const details = link && link.closest('details');
      if (details) details.open = true;
      update(section, target);
    }
    else if (!location.hash || location.hash === '#top') update(sections[0], null);
  }
  nav.addEventListener('click', event => {
    const link = event.target.closest('a');
    if (!link || !allLinks.includes(link)) return;
    const details = link.closest('details');
    if (details) details.open = true;
    const target = targetOf(link);
    if (target) update(target.closest('main > section'), target);
  });
  let scheduled = false;
  window.addEventListener('scroll', () => {
    if (scheduled) return;
    scheduled = true;
    requestAnimationFrame(() => {readPosition(); scheduled = false;});
  }, {passive:true});
  window.addEventListener('hashchange', followHash);
  window.addEventListener('resize', readPosition);
  window.addEventListener('load', readPosition, {once:true});
  followHash();
})();
