const express = require('express')
const db = require('./db-conection')
const app = express()
let id;

  //create the middleware
  const corsValidation = (req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    next(); // Calling this function invokes the next middleware function in the app 
  }

  app.use(corsValidation);

  // Primary path
  app.get('/', (request, response) => {
    response.send("Primary page")
  })

  // Get all films
  app.get('/films/:pagina?', async (request, response) => {
    try {
      let params = 0;
      if (request.params.pagina !== undefined) {
        params = request.params.pagina;
      }

      const result = await db.query(`SELECT * FROM films LIMIT 5 offset ${params}`);

      response.json(result.rows);
    } catch (error) {
        console.error(error);
        response.status(500).send('Internal Server Error'); 
    }
  });

  app.get('/films/:id', async (request, response) => {
    try {
        const result = await db.query(`SELECT * FROM films where i_film=${request.params.id}`);
        response.json(result.rows);
    } catch (error) {
        console.error(error);                                                     
        response.status(500).send('Internal Server Error'); 
    }
  });


  // Genres
  app.get('/genre/:genre', async (request, response) => {
    try {
        const genre = await db.query(`SELECT i_genre FROM genres where name='${request.params.genre}'`);
        const films = await db.query(`SELECT * FROM films where i_film=${genre.rows[0].i_genre}`)

        response.json(films.rows);  
    } catch (error) {
        console.error(error);                                                     
        response.status(500).send('Internal Server Error'); 
    }
  });

  app.get('/genre', async (request, response) => {
    try {
      const result = await db.query(`SELECT * FROM genres`);

      response.json(result.rows);
    } catch (error) {
      console.error(error);                                                     
      response.status(500).send('Internal Server Error'); 
    }
  });


  // Reviews
  app.get('/reviews', async (request, response) => {
    try {
        const result = await db.query('SELECT * FROM reviews');
        response.json(result.rows);
    } catch (error) {
        console.error(error);
        response.status(500).send('Internal Server Error'); 
    }
  });

  app.get('/films/:id', async (request, response) => {
    try {
        const result = await db.query(`SELECT * FROM films where i_film=${request.params.id}`);
        response.json(result.rows);
    } catch (error) {
        console.error(error);
        response.status(500).send('Internal Server Error'); 
    }
  });

  const PORT = 8000
  app.listen(PORT, () => {
    console.log(`Project run in port: ${PORT}`)
  });