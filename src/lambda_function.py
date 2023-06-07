def lambda_handler(event, context):
    """
    Serverless process.

    :param event: An event is a JSON-formatted document that contains data
                  for a Lambda function to process. The Lambda runtime converts
                  the event to an object and passes it to your function code.
                  It is usually of the Python dict type. It can also be list,
                  str, int, float, or the NoneType type.
    :param context: A context object is passed to your function by Lambda at
                    runtime. This object provides methods and properties that
                    provide information about the invocation, function, and
                    runtime environment.
    :return: If event is present (an asynchronous invocation), the value is discarded.
    """
    return {
        "message": "Hello from AWS Lambda."
    }
