export default interface extern {
  handler: (appDirectory: string) => (arg0: Readonly<any>, arg1: ILambdaContext) => Promise<string | void>,
}
/** The AWS Lambda context object. */
export interface ILambdaContext {
}