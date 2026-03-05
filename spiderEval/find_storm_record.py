import json

with open('/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json', 'r') as f:
    data = json.load(f)

for i, entry in enumerate(data):
    if entry.get('db_id') == 'storm_record':
        print(f"Index: {i}")
        print(f"Question: {entry.get('question')}")
        print(f"Query: {entry.get('query')}")
        print("---")
