bring aws;
bring cloud;
bring "@cdktf/provider-aws" as tfaws;

class ExternApp {
  pub extern "./app.js" static inflight handler(payload: Json, ctx: aws.ILambdaContext): str?;
}

let fn = new cloud.Function(inflight (payload) => {
  return ExternApp.handler(payload, aws.Function.context()!);
});

if let awsfn = aws.Function.from(fn) {
  let fnUrl = new tfaws.lambdaFunctionUrl.LambdaFunctionUrl(
    functionName: awsfn.functionName,
    authorizationType: "NONE",
  );

  new cloud.Endpoint(fnUrl.functionUrl);
}
