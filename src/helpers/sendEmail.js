const mailer = require('nodemailer')
const fs = require('fs')
const mustache = require('mustache')
const userModel = require('../models/users')
const path = require('path')
const { EMAIL_USER, EMAIL_PASS } = process.env

module.exports = async (id, url, subject, message) => {
  const template = fs.readFileSync(path.resolve(__dirname, './template.html'), 'utf-8')

  const transporter = mailer.createTransport({
    service: 'gmail',
    auth: {
      user: EMAIL_USER,
      pass: EMAIL_PASS
    }
  })

  const getUserEmail = await userModel.getUsersByCondition({ id })
  const results = {
    url: url,
    subject: subject,
    message: message
  }

  const mailOptions = {
    from: EMAIL_USER,
    to: getUserEmail[0].email,
    subject: subject,
    html: mustache.render(template, { ...results })
  }

  transporter.sendMail(mailOptions, (err, info) => {
    if (err) throw err
    console.log('Email sent: ' + info.response)
  })
}
