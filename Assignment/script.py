import boto3
import csv

def s3_to_dynamodb(event, context):
    region='eu-west-1'
    recList=[]
    try:
        s3=boto3.client('s3')
        dyndb = boto3.client('dynamodb', region_name=region)
        bucket=event['Records'][0]['s3']['bucket']['name']
        key=event['Records'][0]['s3']['object']['key']
        confile= s3.get_object(Bucket=bucket, Key=key)
        recList = confile['Body'].read().decode('utf-8').split('\n')
        csv_reader = csv.reader(recList, delimiter=',', quotechar='"')
        for row in csv_reader:
            country_name=row[0]
            response = dyndb.put_item(
                    TableName='dynamodb-test',
                    Item={
                    'country': {'S':country_name}
                    }
                )
    except Exception as e:
        print (e)
