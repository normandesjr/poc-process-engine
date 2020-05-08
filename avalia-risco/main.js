'use strict'

exports.handler = async (event) => {
  const cpf = event.cpf

  let approved = true
  if (cpf === '999') {
    approved = false
  }

  return {
      statusCode: 200,
      headers: {'Content-Type': 'application/json'},
      approved: approved,
      payload: event
  }
}
