bring aws;
bring cloud;
bring "@cdktf/provider-aws" as tfaws;

pub class ExpressApp {
  extern "./app.js" static handler(appDirectory: str): inflight (Json, aws.ILambdaContext): str?;
  pub url: str;
  new (appDirectory: str) {
    let handler = ExpressApp.handler(appDirectory);

    let fn = new cloud.Function(inflight (payload) => {
      return handler(payload, aws.Function.context()!);
    });

    if let awsfn = aws.Function.from(fn) {
      let fnUrl = new tfaws.lambdaFunctionUrl.LambdaFunctionUrl(
        functionName: awsfn.functionName,
        authorizationType: "NONE",
      );

    this.url = fnUrl.functionUrl;
    new cloud.Endpoint(this.url);
    }
  }
}

