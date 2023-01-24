const express = require('express');
const app = express();
//initialize DB connection and port
const { PORT } = require('./util/config');
const { connectToDatabase } = require('./util/db');
//import routers
const blogsRouter = require('./controllers/blogs');
const usersRouter = require('./controllers/users');
const loginRouter = require('./controllers/login');
const cors = require('cors');
const summaryRouter = require('./controllers/authorship');
const readingListsRouter = require('./controllers/readinglists');

app.use(express.json());
app.use(cors());

app.use('/api/blogs', blogsRouter);
app.use('/api/users', usersRouter);
app.use('/api/login', loginRouter);
app.use('/api/authorship', summaryRouter);
app.use('/api/readinglist', readingListsRouter);


const start = async () => {
    await connectToDatabase()
    app.listen(PORT, () => {
        console.log(`Server running on port ${PORT}`)
    })
}

start();