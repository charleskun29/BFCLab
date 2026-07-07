/**
 * PharmaSync Settings — client-side logic
 * Handles settings-nav item selection, form save, and avatar placeholder actions.
 * Date display, sidebar highlighting, and logout are handled by dashboard.js.
 */

document.addEventListener("DOMContentLoaded", () => {
  initSettingsNav();
  initSaveChanges();
  initPasswordSave();
  initPasswordVisibility();
  initAvatarActions();
});

/** Highlights the selected item in the settings nav list (Account Profile / Password) */
function initSettingsNav() {
  const items = document.querySelectorAll(".settings-nav__item[data-panel]");
  const panels = document.querySelectorAll(".settings-panel");

  items.forEach((item) => {
    item.addEventListener("click", () => {
      items.forEach((i) => i.classList.remove("settings-nav__item--active"));
      item.classList.add("settings-nav__item--active");

      const panelName = item.dataset.panel;
      panels.forEach((panel) => {
        const isActive = panel.id === `${panelName}-panel`;
        panel.classList.toggle("settings-panel--active", isActive);
        panel.hidden = !isActive;
      });
    });
  });

  const logoutItem = document.getElementById("settings-logout");
  if (logoutItem) {
    logoutItem.addEventListener("click", () => {
      alert("Log out clicked — connect to auth flow here.");
    });
  }
}

/** Placeholder for saving the Edit Profile form */
function initSaveChanges() {
  const form = document.getElementById("settings-form");
  if (!form) return;

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    alert("Save Changes clicked — connect to profile-update flow here.");
  });
}

/** Placeholder for saving the password form */
function initPasswordSave() {
  const form = document.getElementById("password-form");
  if (!form) return;

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    alert("Update Password clicked — connect to password-update flow here.");
  });
}

/** Toggles password field visibility using the eye buttons */
function initPasswordVisibility() {
  const toggleButtons = document.querySelectorAll(".settings-field__toggle[data-target]");

  toggleButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const targetId = button.dataset.target;
      const input = document.getElementById(targetId);

      if (!input) return;

      const isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";
      button.classList.toggle("is-visible", isHidden);
      button.innerHTML = isHidden
        ? '<i class="fa-solid fa-eye-slash"></i>'
        : '<i class="fa-solid fa-eye"></i>';
      button.setAttribute("aria-label", isHidden ? `Hide ${targetId.replace(/-/g, " ")}` : `Show ${targetId.replace(/-/g, " ")}`);
    });
  });
}

/** Placeholders for the avatar buttons */
function initAvatarActions() {
  const changeBtn = document.getElementById("change-avatar-btn");
  if (changeBtn) {
    changeBtn.addEventListener("click", () => {
      alert("Change avatar clicked — connect to file-upload flow here.");
    });
  }

  const deleteBtn = document.getElementById("delete-avatar-btn");
  if (deleteBtn) {
    deleteBtn.addEventListener("click", () => {
      alert("Delete avatar clicked — connect to avatar-removal flow here.");
    });
  }
}
