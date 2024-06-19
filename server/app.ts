import express from "express";

const app = express();

app.get("/", (req, res) => {
  // const reqInfo = {
  //   method: req.method,
  //   headers: req.headers,
  //   query: req.query,
  //   body: req.body,
  // };
  res.send(`Hello from Express on AWS Lambda!`);
  // res.send(`Hello from Express on AWS Lambda! Received event: ${JSON.stringify(reqInfo)}`);
});

export default app;
