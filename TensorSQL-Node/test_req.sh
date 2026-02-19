
#!/bin/bash

curl -X POST http://localhost:3005/api/text2sql/generate \
     -H "Content-Type: application/json" \
     -d '{
           "question": "Cho tôi biết danh sách sinh viên học lớp CNTT1",
           "schema": {
             "tables": [
               {
                 "name": "SinhVien",
                 "columns": [
                   { "name": "MaSV", "dataType": "varchar" },
                   { "name": "TenSV", "dataType": "nvarchar" },
                   { "name": "MaLop", "dataType": "varchar" }
                 ]
               },
               {
                 "name": "Lop",
                 "columns": [
                   { "name": "MaLop", "dataType": "varchar" },
                   { "name": "TenLop", "dataType": "nvarchar" }
                 ]
               }
             ]
           }
         }'
