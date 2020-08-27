$(document).ready(function(){  

    Dropzone.autoDiscover = true;
  // "myAwesomeDropzone" is the camelized version of the HTML element's ID
    Dropzone.options.myAwesomeDropzone = {
      autoProcessQueue: false,  
      paramName: "docs", // The name that will be used to transfer the file
      maxFilesize: 2, // MB
      dictDefaultMessage : 'Testing'
    };     
  new Dropzone("#myAwesomeDropzone");
  return mediaDropzone.on("success", function(file, responseText) {
      var imageUrl;
      imageUrl = responseText.docs.url;
  });  

// Dropzone.autoDiscover = false;
// document.addEventListener("turbolinks:load", function () {
//   new Dropzone("#myAwesomeDropzone", {
//     paramName: "file",
//     maxFilesize: 2,
//     dictDefaultMessage: 'Testing'
//   });
// });

// var myDropzone = new Dropzone(dropzoneid,
//   {
//     url: "/files/post",
//     acceptedFiles: 'image/*',
//     paramName: "file", // The name that will be used to transfer the file
//     maxFilesize: 1, // MB
//     maxFiles: 1,
//     init: function () 
//       // Using a closure.
//       var _this = this
//       // Setup the observer for the button.
//       $("#clear-dropzone").on("click", function () {
//           // Using "_this" here, because "this" doesn't point to the dropzone anymore
//           _this.removeAllFiles();
//           // If you want to cancel uploads as well, you
//           // could also call _this.removeAllFiles(true);
//       });
//       //this.on("maxfilesexceeded", function (file)
//       //{
//       //    this.removeFile(file);
//       //});
//     }
//   }

//  Disable auto upload

  // Dropzone.options.myAwesomeDropzone = {
  //   autoProcessQueue: false,
  //   url: 'upload_files.php',
  //   init: function () {

  //       var myDropzone = this;

  //       // Update selector to match your button
  //       $("#button").click(function (e) {
  //           e.preventDefault();
  //           myDropzone.processQueue();
  //       });

  //       this.on('sending', function(file, xhr, formData) {
  //           // Append all form inputs to the formData Dropzone will POST
  //           var data = $('#frmTarget').serializeArray();
  //           $.each(data, function(key, el) {
  //               formData.append(el.name, el.value);
  //           });
  //       });
  //   }
  // }

})