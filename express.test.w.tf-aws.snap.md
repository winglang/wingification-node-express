# `express.test.w.tf-aws.snap.md`

## main.tf.json

```json
{
  "//": {
    "metadata": {
      "backend": "local",
      "stackName": "root",
      "version": "0.20.7"
    },
    "outputs": {
      "root": {
        "Default": {
          "Default": {
            "ExpressApp": {
              "Endpoint": {
                "Url": "ExpressApp_Endpoint_Url_F396A178"
              }
            }
          }
        }
      }
    }
  },
  "output": {
    "ExpressApp_Endpoint_Url_F396A178": {
      "value": "${aws_lambda_function_url.ExpressApp_LambdaFunctionUrl_1A19E2A3.function_url}"
    }
  },
  "provider": {
    "aws": [
      {
      }
    ]
  },
  "resource": {
    "aws_cloudwatch_log_group": {
      "ExpressApp_Function_CloudwatchLogGroup_F0B5C777": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/Function/CloudwatchLogGroup",
            "uniqueId": "ExpressApp_Function_CloudwatchLogGroup_F0B5C777"
          }
        },
        "name": "/aws/lambda/Function-c8bfefab",
        "retention_in_days": 30
      }
    },
    "aws_iam_role": {
      "ExpressApp_Function_IamRole_8403E3ED": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/Function/IamRole",
            "uniqueId": "ExpressApp_Function_IamRole_8403E3ED"
          }
        },
        "assume_role_policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Effect\":\"Allow\"}]}"
      }
    },
    "aws_iam_role_policy": {
      "ExpressApp_Function_IamRolePolicy_3262781A": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/Function/IamRolePolicy",
            "uniqueId": "ExpressApp_Function_IamRolePolicy_3262781A"
          }
        },
        "policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":\"none:null\",\"Resource\":\"*\"}]}",
        "role": "${aws_iam_role.ExpressApp_Function_IamRole_8403E3ED.name}"
      }
    },
    "aws_iam_role_policy_attachment": {
      "ExpressApp_Function_IamRolePolicyAttachment_0DAD058F": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/Function/IamRolePolicyAttachment",
            "uniqueId": "ExpressApp_Function_IamRolePolicyAttachment_0DAD058F"
          }
        },
        "policy_arn": "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
        "role": "${aws_iam_role.ExpressApp_Function_IamRole_8403E3ED.name}"
      }
    },
    "aws_lambda_function": {
      "ExpressApp_Function_FF953C19": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/Function/Default",
            "uniqueId": "ExpressApp_Function_FF953C19"
          }
        },
        "architectures": [
          "arm64"
        ],
        "environment": {
          "variables": {
            "NODE_OPTIONS": "--enable-source-maps",
            "WING_FUNCTION_NAME": "Function-c8bfefab",
            "WING_TARGET": "tf-aws"
          }
        },
        "function_name": "Function-c8bfefab",
        "handler": "index.handler",
        "logging_config": {
          "log_format": "JSON"
        },
        "memory_size": 1024,
        "publish": true,
        "role": "${aws_iam_role.ExpressApp_Function_IamRole_8403E3ED.arn}",
        "runtime": "nodejs20.x",
        "s3_bucket": "${aws_s3_bucket.Code.bucket}",
        "s3_key": "${aws_s3_object.ExpressApp_Function_S3Object_ADC5E01E.key}",
        "timeout": 60,
        "vpc_config": {
          "security_group_ids": [
          ],
          "subnet_ids": [
          ]
        }
      }
    },
    "aws_lambda_function_url": {
      "ExpressApp_LambdaFunctionUrl_1A19E2A3": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/LambdaFunctionUrl",
            "uniqueId": "ExpressApp_LambdaFunctionUrl_1A19E2A3"
          }
        },
        "authorization_type": "NONE",
        "function_name": "${aws_lambda_function.ExpressApp_Function_FF953C19.function_name}"
      }
    },
    "aws_s3_bucket": {
      "Code": {
        "//": {
          "metadata": {
            "path": "root/Default/Code",
            "uniqueId": "Code"
          }
        },
        "bucket_prefix": "code-c84a50b1-"
      }
    },
    "aws_s3_object": {
      "ExpressApp_Function_S3Object_ADC5E01E": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/ExpressApp/Function/S3Object",
            "uniqueId": "ExpressApp_Function_S3Object_ADC5E01E"
          }
        },
        "bucket": "${aws_s3_bucket.Code.bucket}",
        "key": "asset.c8bfefab3d704f19c29dc7d6530b760cd0d9af8330.66714582ad0932d1670a6596fe84088c.zip",
        "source": "assets/ExpressApp_Function_Asset_485DCEC1/BDAB118AA62D9A510CB31FA29A5209A9/archive.zip"
      }
    }
  },
  "terraform": {
    "backend": {
      "local": {
        "path": "./terraform.tfstate"
      }
    },
    "required_providers": {
      "aws": {
        "source": "aws",
        "version": "5.56.1"
      }
    }
  }
}
```
