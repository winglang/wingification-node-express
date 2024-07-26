bring aws;
bring cloud;
bring "@cdktf/provider-aws" as tfaws;

pub class ExpressApp {
  extern "./app.js" static handler(appDirectory: str): inflight (Json, aws.ILambdaContext): str?;
  pub url: str;
  new (appDirectory: str) {
    let handler = ExpressApp.handler(appDirectory);

    let fn = new cloud.Function(inflight (payload) => {
      return handler(payload ?? {}, aws.Function.context() ?? unsafeCast({}));
    });

    if let awsfn = aws.Function.from(fn) {
      let fnUrl = new tfaws.lambdaFunctionUrl.LambdaFunctionUrl(
        functionName: awsfn.functionName,
        authorizationType: "NONE",
      );

      this.url = fnUrl.functionUrl;
    } else {
      let api = new cloud.Api();
      // TODO: api.any() instead of api.get() to support all HTTP methods
      api.get("/", inflight (req) => {
        let method: str = unsafeCast(req.method);
        let awsRequest = Json {
          path: req.path,
          queryStringParameters: req.query,
          body: req.body,
          httpMethod: method,
          headers: req.headers,
        };
        return unsafeCast(fn.invoke(awsRequest)!);
      });
      this.url = api.url;
    }

    new cloud.Endpoint(this.url);
  }
}

