const express = require('express')
const User = require('../models/user.model')
const router = express.Router()


router.post('/signup',(req,res)=>{
    User.findOne({email:req.body.email},(err,user)=>{
     
            if(user==null){
                const user = User({
                    name : req.body.name,
                    email:req.body.email,
                    password:req.body.password,
                    university:req.body.university,
                    department:req.body.department})
                user.save().then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(user)
                        res.json(user)
                    }
                })
            }else{
            res.json({message:'email is avilable'})}
            
            
        
    })
    
})

router.post('/signin',(req,res)=>{
    User.findOne({email:req.body.email,password:req.body.password},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            res.json(user)   
        }
    })
})
module.exports = router