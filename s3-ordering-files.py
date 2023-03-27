
import boto3
from datetime import datetime, timezone

today = datetime.today()
#today = datetime.utcnow()
today = datetime.now(timezone.utc)
datetoday = today.strftime("%Y%m%d")


s3_client = boto3.client("s3")

bucket_name = "pythons3-bucket-created-terraform"

list_objects_response = s3_client.list_objects_v2(Bucket=bucket_name)
contents = list_objects_response.get("Contents")

#print(contents)
s3_object_folder_names = []

for item in contents:
    s3_object_folder_names.append(item.get("Key"))

s3_dir_name = datetoday + "/"

if s3_dir_name not in s3_object_folder_names:
    s3_client.put_object(Bucket = bucket_name, Key = (s3_dir_name))

for item in contents:
    print("Item is ",item)
    l = item.get("LastModified");
    s3_object_creation_date = item.get("LastModified").strftime("%Y%m%d") + "/"
    get_last_modified = int(l.strftime('%s'))
    print("GET LAST MODIFIED", get_last_modified)
    s3_object_name = item.get("Key")
    print("s3 object name: ", s3_object_name)
    print("s3_object_creation_date", s3_object_creation_date)
    print("s3 dir name", s3_dir_name)
        # Checking if object creation date matches the s3 folder name and also isolating the folders and objects by checking / not in condition
    if(s3_object_creation_date == s3_dir_name and "/" not in s3_object_name):
        s3_client.copy_object(Bucket = bucket_name, CopySource = bucket_name +"/"+s3_object_name , Key = s3_dir_name+s3_object_name)
        s3_client.delete_object(Bucket=bucket_name,Key=s3_object_name)





