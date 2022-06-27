const express = require('express')
const app = express()
const port = 3000 || process.env.PORT
const cors = require('cors')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const {MongoClient} = require('mongodb')


const uri=  "mongodb+srv://test:DLrYmTVlZdg7IkwZ@cluster0.qu7oo.mongodb.net/mydatabase?retryWrites=true&w=majority";
const client = new MongoClient(uri);
async function run() {
    try {
        await client.connect();
        const db = client.db("mydb");
        const coll = db.collection("works");
        const cursor = coll.find();
        await cursor.forEach(console.dir);
        console.log("Connected correctly to server");
    }finally{
     await client.close();
    }
}
run().catch(console.dir);



mongoose.connect("mongodb://localhost:27017/mydb",{
     useNewUrlParser: true,
      useUnifiedTopology: true 
    })
.catch(err=>{   
    console.log("database error",err)
}
)
//database connection

app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/',require('./routes/user.route'))
app.use('/',require('./routes/work.route'))


const server = app.listen(port, () => {
    console.log(`Listening on port ${port}`)
}
)
const io = require('socket.io')(server);
const connectUser = new Set();
io.on('connection', (socket) => {
    console.log("Connected Successfully", socket.id);
    connectUser.add(socket.id);
    io.emit('connected-user',connectUser.size);
    socket.on('disconnect', () => {
        console.log("Disconnected Successfully", socket.id);
        connectUser.delete(socket.id);
        io.emit('connected-user',connectUser.size);
    }
    
    )
    socket.on('message', (data) => {
        console.log(data);
        socket.broadcast.emit('message-receive', data);
    })


                                }
    )
