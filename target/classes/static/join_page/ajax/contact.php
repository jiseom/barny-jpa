<?php
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$email = $_POST['email'];
$message = $_POST['message'];

$to = 'support@gigagit.com';
$message_from = sprintf('%1$s %2$s &lt;%3$s&gt;', $firstname, $lastname, $email);
$subject = 'Contact Email Sample';
$message .= '<br /><hr />'.$message_from;

// To send HTML mail, the Content-type header must be set
$headers[] = 'MIME-Version: 1.0';
$headers[] = 'Content-type: text/html; charset=iso-8859-1';
$headers[] = 'From: '.$email;

try {
    $result = mail($to, $subject, $message, implode(PHP_EOL, $headers));

    if($result) {
        echo json_encode( array(
                                    'status' => 'success',
                                    'message' => sprintf( 'contact successful. You entered<br />First Name: %1$s<br />Last Name: %2$s<br />Email: %3$s<br />Message: %4$s',
                                                           $firstname,
                                                           $lastname,
                                                           $email,
                                                           $message
                                                        ),
                               )
                        );
    } else {
        echo json_encode( array(
                                    'status' => 'error',
                                    'message' => error_get_last()['message']
                               )
                        );
    }
} 
catch(Exception $e) {
    echo json_encode( array(
                                'status' => 'error',
                                'message' => $e->getMessage()
                           )
                    );
}

?>