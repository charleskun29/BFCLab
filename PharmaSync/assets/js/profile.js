/**
 * PharmaSync Profile — client-side logic
 * Handles edit-profile / edit-field placeholder actions.
 * Date display, sidebar highlighting, and logout are handled by dashboard.js.
 */

document.addEventListener("DOMContentLoaded", () => {
  initEditProfile();
  initEditFields();
  initPasswordReveal();
});

/** Placeholder for the main "Edit profile" action */
function initEditProfile() {
  const btn = document.getElementById("edit-profile-btn");
  if (!btn) return;

  btn.addEventListener("click", () => {
    alert("Edit profile clicked — connect to profile-edit flow here.");
  });
}

/** Placeholder for per-field pencil-icon edits in the Contacts card */
function initEditFields() {
  const editButtons = document.querySelectorAll(".btn-edit-field");

  editButtons.forEach((btn) => {
    btn.addEventListener("click", () => {
      const field = btn.dataset.field;
      alert(`Edit ${field} clicked — connect to field-edit flow here.`);
    });
  });
}

/** Optional: click the masked password to reveal/hide it (UI only, no real security) */
function initPasswordReveal() {
  const passwordValue = document.getElementById("contact-password");
  if (!passwordValue) return;

  const mask = passwordValue.querySelector(".password-mask");
  const actual = "**********"; // placeholder — replace with real masked source server-side
  let revealed = false;

  passwordValue.style.cursor = "pointer";
  passwordValue.title = "Click to toggle visibility";

  passwordValue.addEventListener("click", (e) => {
    if (e.target.closest(".btn-edit-field")) return;
    revealed = !revealed;
    mask.textContent = revealed ? actual : "••••••••••••";
  });
}
