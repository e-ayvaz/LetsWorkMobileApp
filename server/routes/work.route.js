const express = require('express')
const Work = require('../models/work.model')
const router = express.Router()


router.post('/createWork',(req,res)=>{
    Work.findOne({description:req.body.description},(err,work)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(work==null){
                const work = Work({
                    
                    workName : req.body.workName,
                    className:req.body.className,
                    date:req.body.date,
                    time:req.body.time,
                    place:req.body.place,
                    description:req.body.description,
                    university:req.body.university,
                    depatment:req.body.depatment
                    
                    
                })
                work.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(work)
                        res.json(work)
                    }
                    
                })
            }else{

            res.json({
                message:'Work is avilable'
            })   
            }
        }
    })
    
})
router.get('/',function(req,res){
    res.json("work.json");
    });

//Get user by ObjectID
router.get('/getWork/:id', (request, response) => {
    Work.findById(request.params.id)
    .then(data => response.json(data))
    .catch(error => response.json(error))
});


module.exports = router