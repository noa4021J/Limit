const functions = require('firebase-functions');

const nodemailer = require("nodemailer");
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;
const adminEmail = functions.config().admin.email;

// 送信に使用するメールサーバーの設定
const mailTransport = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: gmailEmail,
    pass: gmailPassword
  }
});

// 管理者用のメールテンプレート
const adminContents = data => {
  return `
以下内容でユーザーよりお問い合わせを受けました。
数日以内に返信するようお願い致します。

お名前：
${data.name}

返信用メールアドレス：
${data.email}

お問い合わせ内容：
${data.contents}
`;
};

const supportContents = data => {
    return `
Limitへお問い合わせ頂きありがとうございます！

頂戴致しました内容を確認し、順次ご対応をさせていただきます。
内容によっては調査、回答にお時間を要する場合がございます事を予めご了承くださいませ。

【お問い合わせ内容】

お名前：
${data.name}

返信用メールアドレス：
${data.email}

お問い合わせ内容：
${data.contents}

`;
};

exports.sendMail = functions.https.onCall((data, context) => {
  // メール設定
  let adminMail = {
    from: gmailEmail,
    to: adminEmail,
    subject: "【Limit】ユーザーよりお問い合わせを受け付けました。返信をお願いします。",
    text: adminContents(data)
  };
    
  let supportMail = {
      from: gmailEmail,
      to: data.email,
      subject: "【自動返信】Limitへのお問い合わせを受け付けました。",
      text: supportContents(data)
  };

  // 管理者へのメール送信
  mailTransport.sendMail(adminMail, (err, info) => {
    if (err) {
      return console.error(`send failed. ${err}`);
    }
    return console.log("send success.");
  });
    
  //ユーザーへの自動返信
  mailTransport.sendMail(supportMail, (err, info) => {
    if (err) {
      return console.error(`send failed. ${err}`);
    }
    return console.log("send success.");
  });
});