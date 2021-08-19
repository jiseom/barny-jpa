// initialize validation messages variable
$.validation = {
    messages: {}
};

// add validation templates to show fancy icons with message text
$.extend($.validation.messages, {
    required: '<i class="fa fa-exclamation-circle"></i> required.',
    email: '<i class="fa fa-exclamation-circle"></i> Please enter a valid email.',
});

// call our 'validateContactForm' function when page is ready
$(document).ready(function () {
    validateContactForm();
});

// bind jQuery validation event and form 'submit' event
var validateContactForm = function () {
    var form_contact = $('#form_contact');
    var contact_result = $('#contact_result');

    // bind jQuery validation event
    form_contact.validate({
        rules: {
            contact_firstname: {
                required: true      // firstname field is required
            },
            contact_lastname: {
                required: true      // lastname field is required
            },
            contact_email: {
                required: true,     // email field is required
                email: true         // validate email address
            },
            contact_message: {
                required: true      // message field is required
            }
        },
        messages: {
            contact_firstname: {
                required: $.validation.messages.required
            },
            contact_lastname: {
                required: $.validation.messages.required
            },
            contact_email: {
                required: $.validation.messages.required,
                email: $.validation.messages.email
            },
            contact_message: {
                required: $.validation.messages.required
            }
        },
        errorPlacement: function (error, element) {
            // insert error message after invalid element
            error.insertAfter(element);

            // hide error message on window resize event
            $(window).resize(function () {
                error.remove();
            });
        },
        invalidHandler: function (event, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            } else {
            }
        }
    });

    var contact_firstname = $('#contact_firstname');
    var contact_lastname = $('#contact_lastname');
    var contact_email = $('#contact_email');
    var contact_message = $('#contact_message');

    // bind form submit event
    form_contact.on('submit', function (e) {
        // if form is valid then call AJAX script
        if (form_contact.valid()) {
            var ajaxRequest = $.ajax({
                url: 'ajax/contact.php',
                type: "POST",
                data: {
                    firstname: contact_firstname.val(),
                    lastname: contact_lastname.val(),
                    email: contact_email.val(),
                    message: contact_message.val()
                },
                beforeSend: function () {
                }
            });

            ajaxRequest.fail(function (data, status, errorThrown) {
                // error
                var $message = data.responseText;
                contact_result.html('<div class="alert alert-danger">' + $message + '</div>');
            });

            ajaxRequest.done(function (response) {
                // done
                var $response = $.parseJSON(response);
                contact_result.html('<div class="alert alert-success">' + $response.message + '</div>');
            });
        }

        // stop default submit event of form
        e.preventDefault();
        e.stopPropagation();
    });
}