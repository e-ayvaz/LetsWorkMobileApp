const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const workSchema= new mongoose.Schema({
    'user_id': { type: Schema.Types.ObjectId, ref: 'User' },
    'name': { type: String, ref: 'User' },
    workName: String,
    className: String,
    date: String,
    time: String,
    place: String,
    description: String,
    'university': {type:String, ref:'User'},
    'depatment': {type:String, ref:'User'},
    
});
module.exports = mongoose.model('work', workSchema);
