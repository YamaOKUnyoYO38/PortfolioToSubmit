// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
// Bootstrap の JS を読み込む
import "bootstrap"
//追加
import "@rails/ujs"
Rails.start()

// コピー用ボタンの処理を Turbo 対応でまとめる
document.addEventListener("turbo:load", () => {
  const copyButtons = document.querySelectorAll(".copy-btn");

  copyButtons.forEach((btn) => {
    btn.addEventListener("click", () => {
      const text = btn.dataset.text;

      navigator.clipboard.writeText(text)
        .then(() => {
          // コピー成功アラート
          alert("クリップボードにコピーしました！\n" + text);

          // ボタン色を一瞬変える
          const originalColor = btn.style.backgroundColor;
          btn.style.backgroundColor = "#28a745"; // 緑色
          setTimeout(() => {
            btn.style.backgroundColor = originalColor;
          }, 500); // 0.5秒で元に戻す
        })
        .catch((err) => {
          alert("コピーに失敗しました");
          console.error("コピーに失敗しました:", err);
        });
    });
  });
});

document.addEventListener("turbo:load", () => {
  // 行クリックでテンプレート全文コピー
  document.querySelectorAll("tr[data-clipboard-text]").forEach(row => {
    row.addEventListener("click", (e) => {
      if(e.target.classList.contains("name-cell")) return;
      const text = row.dataset.clipboardText;
      navigator.clipboard.writeText(text)
        .then(() => alert("テンプレート全文をコピーしました！"))
        .catch(() => alert("コピーに失敗しました"));
    });
  });

  // 名前クリックで名前だけコピー
  document.querySelectorAll(".name-cell").forEach(cell => {
    cell.addEventListener("click", (e) => {
      e.stopPropagation();
      const name = cell.dataset.clipboardName;
      navigator.clipboard.writeText(name)
        .then(() => alert("名前をコピーしました！"))
        .catch(() => alert("コピーに失敗しました"));
    });
  });
});
