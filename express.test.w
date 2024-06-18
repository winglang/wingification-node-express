bring "./express.w" as m;
bring http;
bring expect;
bring fs;


let express = new m.ExpressApp(fs.join(@dirname, "./server/app.ts"));

test "calling express" {
  log(express.url);
  let res = http.get(express.url).body;
  log(res);
  expect.equal(res, "Hello from Express on AWS Lambda!");
}