 

<input type="file" />
<img src="" alt="" />
<script>
  // get a reference to the file input
  const fileInput = document.querySelector("input");
  const imageElement = document.querySelector("img");
  // listen for the change event so we can capture the file
  fileInput.addEventListener("change", (e) => {
    // get a reference to the file
    const file = e.target.files[0];

    // encode the file using the FileReader API
    const reader = new FileReader();
    reader.onloadend = () => {
      // use a regex to remove data url part
      const base64String = reader.result
        .replace("data:", "")
        .replace(/^.+,/, "");

      // log to console
      // logs wL2dvYWwgbW9yZ...
      console.log(base64String); 

      // set file as image source
      imageElement.src = URL.createObjectURL(file);
    };
    reader.readAsDataURL(file);
  });
</script>





