const db = require('../helpers/db')

exports.createTransaction = (data = {}) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO transactions
    (${Object.keys(data).join()})
    VALUES
    (${Object.values(data).map(item => `'${item}'`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.createAmountTransaction = (data = {}) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO amount_transaction
    (${Object.keys(data).join()})
    VALUES
    (${Object.values(data).map(item => `${item}`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getAmountByUser = (cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT * FROM amount_transaction WHERE ${Object.keys(cond).map(item => `${item}="${cond[item]}"`).join(' AND ')}
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.updateAmountTransaction = (id, data) => {
  return new Promise((resolve, reject) => {
    const key = Object.keys(data)
    const value = Object.values(data)
    const query = db.query(`
      UPDATE amount_transaction
      SET ${key.map((item, index) => `${item}="${value[index]}"`)}
      WHERE idUser=${id}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getUserTransactionById = (id) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`SELECT t.id, t.amount, t.idSender, u.balance, t.dateTransaction, t.notes, t.idReceiver FROM transactions t
    LEFT JOIN users u on u.id = t.idSender
    WHERE t.id=${id}`, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getAmountTransactionByIdUser = (id) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`SELECT * FROM amount_transaction
    WHERE idUser=${id}`, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getTransactionHistory = (id, cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT t.*, u.id as idUser, picture, CONCAT(u.firstname, ' ', u.lastname) as name, email, phoneNumber
    FROM transactions t
    INNER JOIN users u ON u.id=idSender OR u.id = idReceiver
    WHERE (idSender=${id} OR idReceiver=${id})
    AND CONCAT(u.firstname, ' ', u.lastname) LIKE "%${cond.search}%"
    AND u.id NOT IN (${id})
    ORDER BY ${cond.sort} ${cond.order}
    LIMIT ${cond.limit} OFFSET ${cond.offset}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getCountTransactionHistory = (id, cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT COUNT(t.id) as totalData 
    FROM transactions t
    INNER JOIN users u ON u.id=idSender OR u.id = idReceiver
    WHERE (idSender=${id} OR idReceiver=${id})
    AND CONCAT(u.firstname, ' ', u.lastname) LIKE "%${cond.search}%"
    AND u.id NOT IN (${id})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getTransactionLastWeek = (id, dateNow, lastWeekDate) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT * FROM transactions
    WHERE (idSender=${id} OR idReceiver=${id})
    AND dateTransaction >= '${lastWeekDate}' AND '${dateNow}' >= dateTransaction
    ORDER BY dateTransaction ASC
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}
