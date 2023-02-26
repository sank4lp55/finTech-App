const sendGridMail = require('@sendgrid/mail');
sendGridMail.setApiKey(process.env.SENDGRID_API_KEY);

const getLoginConfirmationTemplate = require('../emailTemplates/loginConfirmation')

/**
 * @description function to sending login successfully message to users email
 * @param {Object} emailParams - Attendee Form Data Object
 * @returns {Object} this object include, to, from, subject, text, html
*/
function sendLoginConfirmationMail(emailParams) {
    return {
        to: emailParams.email,
        from: 'vrijraj.s@agprop.in',
        subject: process.env.NODE_ENV == 'development' ? '[Testing]' : '' + 'Testing Login mail using template',
        text: `Hey ${emailParams.name}, You login succesfully`,
        html: getLoginConfirmationTemplate.loginConfirmation(emailParams.email),
    };
}
module.exports = { sendLoginConfirmation }