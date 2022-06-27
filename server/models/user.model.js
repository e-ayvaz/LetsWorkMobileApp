const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    'id': { type: Schema.Types.ObjectId, ref: 'User' },
    name: String,
    email: {type:String, unique: true},
    password:String,
    university:String,
    department:String,
    token:String,
})

module.exports = mongoose.model('User',newSchema)