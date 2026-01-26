
# Solution exercice 1


## 1. Nombre total de tentatives echouees

```bash
grep -c 'Failed password' auth.log
```

## 2. Liste des IP sources uniques

```bash
grep 'Failed password' auth.log \
  | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' \
  | sort -u
```

## 3. IP avec le plus de tentatives

```bash
grep 'Failed password' auth.log \
  | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' \
  | sort | uniq -c | sort -rn | head -1
```
