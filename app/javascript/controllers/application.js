import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


document.addEventListener("turbo:load", () => {
  document.querySelectorAll("tr[data-clipboard-text]").forEach(row => {
    row.addEventListener("click", () => {
      const text = row.dataset.clipboardText;
      navigator.clipboard.writeText(text)
        .then(() => alert("テンプレートをコピーしました！"))
        .catch(() => alert("コピーに失敗しました"));
    });
  });
});
