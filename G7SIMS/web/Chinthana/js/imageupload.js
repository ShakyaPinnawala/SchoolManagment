$(".imgAdd").click(function() {
  $(this).closest(".row").find('.imgAdd').before('<div class="col-sm-2 imgUp"><div class="imagePreview"></div><label class="btn btn-primary">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;" accept="image/jpg"></label><i class="fa fa-times del"></i></div>');
});

$(document).on("click", "i.del", function() {
  $(this).parent().remove();
});

$(function() {
  $(document).on("change", ".uploadFile", function() {
    var uploadFile = $(this);
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

    if (/^image\/(jpeg|jpg)$/.test(files[0].type)) { // only jpeg/jpg file
      var reader = new FileReader(); // instance of the FileReader
      reader.readAsDataURL(files[0]); // read the local file

      reader.onloadend = function() { // set image data as background of div
        uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url(" + this.result + ")");
      }
    } else {
      alert("Please upload a .jpg file.");
      uploadFile.val(""); // clear input field if file type is not jpg
    }
  });
});
