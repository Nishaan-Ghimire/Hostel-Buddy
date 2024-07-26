function generateEmailTemplate(title, message, username,token,otp) {
    const htmlContent = `
<html>     
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Email Template</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 600px;
    margin: 0 auto;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  h1 {
    color: #333;
  }

  p {
    color: #666;
  }


  .button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #ffffff;
    text-decoration: none;
    border-radius: 3px;
  }
</style>
</head>
<body>
  <div class="container">
    <h1>${title}</h1>
    <p>Hello ${username},</p>
    <p>${message}</p>
    <p>OTP: ${otp}</p>
    <a href="${process.env.URL}/verify/${token}">Verify by clicking this link ${process.env.URL}/verify/${token}</a>

   

    <p>Thank you!</p>
  </div>
</body>


      </html>
    `;

    return htmlContent;
}
 export {generateEmailTemplate};

 
export const generateBookingConfirmationEmail = (title, username, roomNumber, hostelName, token) =>{
  const htmlContent = `
<html>     
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Email Template</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  color: #333;
}

p {
  color: #666;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: #ffffff;
  text-decoration: none;
  border-radius: 3px;
}
</style>
</head>
<body>
<div class="container">
  <h1>${title}</h1>
  <p>Hello ${username},</p>
  <p>Your booking for a seat in ${roomNumber} sitter at ${hostelName} has been successfully made. Please visit the room to confirm your booking.</p>

  <p>Thank you!</p>
</div>
</body>
</html>
  `;

  return htmlContent;
}


export const generateHostelOwnerNotificationEmail = (title, adminName, username, roomNumber, hostelName) =>{
  const htmlContent = `
<html>     
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Email Template</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  color: #333;
}

p {
  color: #666;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: #ffffff;
  text-decoration: none;
  border-radius: 3px;
}
</style>
</head>
<body>
<div class="container">
  <h1>${title}</h1>
  <p>Hello ${adminName},</p>
  <p>We are excited to inform you that there is a new booking in your hostel, ${hostelName}.</p>
  <p>Booking Details:</p>
  <ul>
    <li>User: ${username}</li>
    <li>Room Number: ${roomNumber}</li>
  </ul>
  <p>Please visit the admin panel to review and manage this booking.</p>
  <a href="${process.env.ADMIN_URL}/bookings" class="button">Go to Admin Panel</a>
  <p>If the above button does not work, please copy and paste the following URL into your web browser:</p>
  <p>${process.env.ADMIN_URL}/bookings</p>
  <p>Thank you!</p>
</div>
</body>
</html>
  `;

  return htmlContent;
}


export const generatePasswordRecoveryEmail = (username, password) => {
  const htmlContent = `
<html>     
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password Recovery</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  color: #333;
}

p {
  color: #666;
}

.password-box {
  background-color: #f1f1f1;
  border: 1px solid #ddd;
  padding: 10px;
  border-radius: 3px;
  font-family: monospace;
  color: #333;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: #ffffff;
  text-decoration: none;
  border-radius: 3px;
}
</style>
</head>
<body>
<div class="container">
  <h1>Password Recovery</h1>
  <p>Hello ${username},</p>
  <p>Your password has been successfully recovered. Below is your new password:</p>
  <div class="password-box">
    ${password}
  </div>
  <p>We strongly recommend changing your password after logging in to ensure your account remains secure.</p>
  <p>Click the button below to log in:</p>
  <a href="http://localhost:3000/" class="button">Log In</a>
  <p>If the above button does not work, please copy and paste the following URL into your web browser:</p>
  <p>http://localhost:3000/</p>
  <p>Thank you!</p>
</div>
</body>
</html>
  `;

  return htmlContent;
}


export const generateKYCVerificationSuccessEmail = (username, hostelName) => {
  const htmlContent = `
<html>     
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KYC Verification Success</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  color: #333;
}

p {
  color: #666;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: #ffffff;
  text-decoration: none;
  border-radius: 3px;
}
</style>
</head>
<body>
<div class="container">
  <h1>Congratulations!</h1>
  <p>Hello ${username},</p>
  <p>We are pleased to inform you that your KYC documents for ${hostelName} have been successfully verified.</p>
  <p>Your account is now fully verified and you can proceed with all the services and features we offer.</p>
  <p>If you have any questions or need further assistance, feel free to reach out to our support team.</p>
  <p>Thank you for your patience and cooperation.</p>
  <p>Best Regards,<br/>The Hostel Buddy Team</p>
</div>
</body>
</html>
  `;

  return htmlContent;
}


export const generateKYCVerificationFailureEmail = (username) => {
  const htmlContent = `
<html>     
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KYC Verification Failure</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  color: #333;
}

p {
  color: #666;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: #ffffff;
  text-decoration: none;
  border-radius: 3px;
}
</style>
</head>
<body>
<div class="container">
  <h1>Action Required</h1>
  <p>Hello ${username},</p>
  <p>We regret to inform you that your KYC documents could not be verified due to unclear images or missing information.</p>
  <p>Please reupload your KYC documents through our mobile app</p>
  <p>If you need assistance or have any questions, please reach out to our support team.</p>
  <p>We appreciate your cooperation and understanding.</p>
  <p>Best Regards,<br/>The Hostel Buddy Team</p>
</div>
</body>
</html>
  `;

  return htmlContent;
}
