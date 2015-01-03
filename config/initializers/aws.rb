 AWS.config({
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    :dynamo_db_endpoint => 'dynamodb.us-east-1.amazonaws.com'
    :ses => { :region => 'us-east-1' }
  })
