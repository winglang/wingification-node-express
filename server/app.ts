import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.send("Hello from Express on AWS Lambda!");
});

export default app;
