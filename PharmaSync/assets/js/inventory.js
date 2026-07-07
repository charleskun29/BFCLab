/**
 * PharmaSync Inventory — client-side logic
 * Handles filter placeholder actions.
 * Date display, sidebar highlighting, and logout are handled by dashboard.js.
 */

document.addEventListener("DOMContentLoaded", () => {
  initDateFilter();
  initFilterItems();
});

/** Placeholder for the small funnel icon next to the header date */
function initDateFilter() {
  const btn = document.getElementById("date-filter-btn");
  if (!btn) return;

  btn.addEventListener("click", () => {
    alert("Date filter clicked — connect to date-range filter here.");
  });
}

/** Placeholder for the "Filter Items" button */
function initFilterItems() {
  const btn = document.getElementById("filter-items-btn");
  if (!btn) return;

  btn.addEventListener("click", () => {
    alert("Filter Items clicked — connect to item-filter panel here.");
  });
}
