module.exports.handler = (appDirectory) => {
  return {
    _toInflight() {
      return `(async (payload, context) => {
        const serverless = require("serverless-http");
        const handler = serverless(require("${appDirectory}").default);
        return handler(payload, context);
      })`;
    },
  };
};
