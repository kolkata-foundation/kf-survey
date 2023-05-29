import argparse
import json
import firebase_admin
from firebase_admin import credentials, firestore
import os

parser = argparse.ArgumentParser(description="Update config in firestore DB")

parser.add_argument("--key", default="key.json")
parser.add_argument("--filepath", required=True)

args = parser.parse_args()

with open(args.filepath, "r") as file:
    data = json.load(file)
    filename = os.path.basename(file.name).split('.')[0]


cred = credentials.Certificate(args.key)
firebase_admin.initialize_app(cred)
db = firestore.client()

confirm = input(f"Updating document {filename} in config. Confirm (y/n): ")
if confirm not in ['y','Y','yes','YES']:
    print("Terminating")
    exit()

survey_coll = db.collection('survey').document(filename)
res = survey_coll.set(data)

updated_data = survey_coll.get().to_dict()
print(f"Updated value: {json.dumps(updated_data,indent=4,ensure_ascii=False)}")
