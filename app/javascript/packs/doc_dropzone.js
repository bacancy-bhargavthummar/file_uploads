// $(document).ready(function(){  

  Dropzone.autoDiscover = true;

  Dropzone.options.myAwesomeDropzone = {
    autoProcessQueue: false,
    paramName: 'document[docs]',
    parallelUploads: 5,
    timeout: 0, /*milliseconds => It has a timeout, whenever its exceded, the request gets cancelled, just put */ 
    addRemoveLinks: true,
    maxFiles: 3, 
    maxFilesize: 5, // MB
    // dictDefaultMessage: 'Upload Files Here',

    init: function () {

      var uploadErrors = [];
      var myDropzone = this;

      $("#button").click(function (e) {
          e.preventDefault();
          myDropzone.processQueue();
      });

      this.on('sending', function() {
        $("#button").prop("disabled", true);
      });

      this.on("queuecomplete", function () {
        $("#button").prop("disabled", false);
        if(uploadErrors.length > 0) {
          alert(uploadErrors);
          location.reload();
        }
      }); 

      this.on("success", function(file, response) {
        if (response["docs"].length > 0) {
          alert(file.name + " can not be stored because " + response["docs"])
        }
        location.reload();
      })

      this.on("error", function (file, errorMessage, XMLHttpRequest) {
        // Errors returned by the server
        if (XMLHttpRequest !== undefined) {
          uploadErrors.push(file.name + errorMessage);
        }
      });
    }
  }

// })