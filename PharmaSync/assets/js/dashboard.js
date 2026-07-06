/**
 * PharmaSync Dashboard — client-side logic
 * Handles date display, nav highlighting, and export placeholder.
 */

document.addEventListener("DOMContentLoaded", () => {
  initDate();
  initSidebar();
  initExport();
});

/** Sets the header date to today's formatted string */
function initDate() {
  const dateEl = document.getElementById("current-date");
  if (!dateEl) return;

  const now = new Date();
  const options = { year: "numeric", month: "long", day: "numeric" };
  dateEl.textContent = now.toLocaleDateString("en-US", options);
}

/** Marks active nav link and attaches click handlers */
function initSidebar() {
  const links = document.querySelectorAll(".sidebar__link");

  links.forEach((link) => {
    link.addEventListener("click", (e) => {
      e.preventDefault();
      links.forEach((l) => l.classList.remove("sidebar__link--active"));
      link.classList.add("sidebar__link--active");
    });
  });

  const logoutBtn = document.getElementById("logout-btn");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", () => {
      alert("Logout clicked — connect to auth flow here.");
    });
  }
}

/** Placeholder export action until backend is wired */
function initExport() {
  const exportBtn = document.getElementById("export-btn");
  if (!exportBtn) return;

  exportBtn.addEventListener("click", () => {
    alert("Export triggered — connect to report download here.");
  });
}
