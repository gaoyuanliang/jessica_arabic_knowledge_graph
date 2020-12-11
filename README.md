# jessica_dbpedia_arabic

```bash
docker pull gaoyuanliang/jessica_dbpedia_arabic:1.0.1

docker run -it \
-p 5987:5987 \
-p 4522:4522 \
jessica_dbpedia_arabic:1.0.1 \
bash
```

http://0.0.0.0:5987/browser/


## how to use it

### example 1

input:

```python
{
  "text": "أسافر من جدة إلى مكة"
}
```

output:

<img src="WX20201211-224422@2x.png">

### example 2

input:

```python
{
  "text": "أعيش في بكين"
}
```

output:

<img src="WX20201211-224447@2x.png">

