// A Copy button beside a line: <button data-copy="id-of-the-code">. Where the clipboard is
// refused the line is selected instead, and the button says so.
document.querySelectorAll("button[data-copy]").forEach(function (btn) {
  btn.addEventListener("click", function () {
    var code = document.getElementById(btn.dataset.copy);
    var back = function () { btn.textContent = "Copy"; };
    var done = function () { btn.textContent = "Copied"; setTimeout(back, 1600); };
    var select = function () {
      var r = document.createRange(); r.selectNodeContents(code);
      var s = getSelection(); s.removeAllRanges(); s.addRange(r);
      btn.textContent = "Selected"; setTimeout(back, 1600);
    };
    try { navigator.clipboard.writeText(code.textContent).then(done, select); } catch (e) { select(); }
  });
});
