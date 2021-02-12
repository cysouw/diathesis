
<!-- Javascript to make TOC expandable on click -->

<script>

  function toggleNav() {
    document.querySelector("body").classList.toggle("bodysmall");
    document.querySelector("nav").classList.toggle("navshown");
  };

  document.querySelector("#toc-title").addEventListener("click", function() {
    toggleNav()
  });

  function toggleSub(lis) {
    for (const li of lis) {
      li.addEventListener('click', function (e) {
        if (e.clientX - e.currentTarget.getBoundingClientRect().left < 10) {
          li.classList.toggle('subShow');
        }
      });
    };
  };

  toggleSub(document.querySelectorAll("nav li"));

</script>
