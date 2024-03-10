import express from 'express';
import mongoose from 'mongoose';
import authRouter from './routes/auth_route.js';
import cors from "cors";

const app=express();

app.use(cors());
app.use(express.json());
app.use(authRouter);

mongoose.connect("mongodb://localhost:27017/Login").then(()=>console.log("Connected Successfully")).catch((err)=>console.log(`Some ${err} occured `));
app.listen(8000,"0.0.0.0",()=>{
    console.log(`Server started at port:${8000}`);
})