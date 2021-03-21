const db = require('../helpers/db')

exports.getUsersByCondition = (cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT * FROM users WHERE ${Object.keys(cond).map(item => `${item}="${cond[item]}"`).join(' AND ')}
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.createUser = (data) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO users
    (${Object.keys(data).join()})
    VALUES
    (${Object.values(data).map(item => `"${item}"`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.updateUser = (id, data) => {
  return new Promise((resolve, reject) => {
    const key = Object.keys(data)
    const value = Object.values(data)
    const query = db.query(`
      UPDATE users
      SET ${key.map((item, index) => `${item}="${value[index]}"`)}
      WHERE id=${id}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}
exports.deletePicture = (id) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
      UPDATE users
      SET picture=NULL
      WHERE id=${id}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getAllContactByCondition = (id, cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT id, CONCAT(firstname, ' ', lastname) AS name, email, phoneNumber, picture 
    FROM users
    WHERE CONCAT(firstname, ' ', lastname) LIKE "%${cond.search}%" AND id NOT IN (${id})
    ORDER BY ${cond.sort} ${cond.order}
    LIMIT ${cond.limit} OFFSET ${cond.offset}
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getCountContactByCondition = (id, cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT COUNT(id) as totalData 
    FROM users 
    WHERE CONCAT(firstname, ' ', lastname) LIKE "%${cond.search}%"  AND id NOT IN (${id})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getCountContact = (id, cond) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT COUNT(id) as totalData 
    FROM users 
    WHERE id NOT IN (${id})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}
