/* 把链接跳转的md后缀改成html*/
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("a[href]").forEach(function (a) {
    let href = a.getAttribute("href");
    if (href && href.match(/\.md($|#)/)) {
      a.setAttribute("href", href.replace(/\.md($|#)/, ".html$1"));
    }
  });
});
