'use strict'

let qs = require('querystring')

const { Client } = require('pg')
const client = new Client()
client
  .connect()
  .then(() => console.log('connected'))
  .catch((err) => console.error('connection error', err.stack))

exports.handler = async (event) => {
  const cpf = event.cpf

  const fetchSimulationQuery = {
    name: 'fetchSimulation',
    text: 'SELECT tax, amount FROM simulation WHERE cpf = $1',
    values: [cpf]
  }

  const query = await client.query(fetchSimulationQuery)

  return {
      statusCode: 200,
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(query.rows)
  }
}
