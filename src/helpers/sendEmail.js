const mailer = require('nodemailer')
// const fs = require('fs')
// const mustache = require('mustache')
const userModel = require('../models/users')
// const path = require('path')
const { EMAIL_USER, EMAIL_PASS } = process.env

module.exports = async (id, subject) => {
  // id, url, subject, message
  // const template = fs.readFileSync(path.resolve(__dirname, './template.html'), 'utf-8')

  const transporter = mailer.createTransport({
    // hostname: 'smtp.gmail.com',
    // service: 'Gmail',
    hostname: 'smtp.gmail.email',
    port: 465,
    secure: true,
    auth: {
      user: EMAIL_USER,
      pass: EMAIL_PASS
    },
    tls: {
      // do not fail on invalid certs
      rejectUnauthorized: false
    }
  })

  const getUserEmail = await userModel.getUsersByCondition({ id })
  // const results = {
  //   url: url,
  //   subject: subject,
  //   message: message
  // }

  const mailOptions = {
    from: EMAIL_USER,
    to: getUserEmail[0].email,
    subject: subject,
    text: 'Hello world?'
    // html: mustache.render(template, { ...results })
  }

  transporter.sendMail(mailOptions, (err, info) => {
    if (err) throw err
    console.log('Email sent: ' + info.response)
  })
  transporter.verify(function (error, success) {
    if (error) {
      console.log(error)
    } else {
      console.log('Server is ready to take our messages')
    }
  })
}
