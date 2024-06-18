export default interface extern {
  handler: (payload: Readonly<any>, ctx: ILambdaContext$Inflight) => Promise<string | void>,
}
/** The AWS Lambda context object. */
export interface ILambdaContext$Inflight {
  /** The identifier of the invocation request. */
  readonly awsRequestId: string;
  /** The name of the Lambda function. */
  readonly functionName: string;
  /** The version of the function. */
  readonly functionVersion: string;
  /** The Amazon Resource Name (ARN) that's used to invoke the function.
  Indicates if the invoker specified a version number or alias. */
  readonly invokedFunctionArn: string;
  /** The log group for the function. */
  readonly logGroupName: string;
  /** The log stream for the function instance. */
  readonly logStreamName: string;
  /** The amount of memory that's allocated for the function. */
  readonly memoryLimitInMB: string;
  /** Returns the number of milliseconds left before the execution times out. */
  readonly remainingTimeInMillis: () => Promise<number>;
}