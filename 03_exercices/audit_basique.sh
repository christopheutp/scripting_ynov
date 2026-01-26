#!/bin/bash
# audit_basique.sh - Script d'audit de securite

echo "=========================================="
echo "       AUDIT DE SECURITE BASIQUE"
echo "=========================================="
echo "Date : $(date)"
echo ""

# 1. Verification de /etc/shadow
echo "--- Verification de /etc/shadow ---"
if [ -r /etc/shadow ]; then
    echo "[ALERTE] /etc/shadow est lisible par l'utilisateur courant"
else
    echo "[OK] /etc/shadow n'est pas lisible"
fi
echo ""

# 2. Utilisateurs avec shell bash
echo "--- Utilisateurs avec shell /bin/bash ---"
echo "Liste :"
grep '/bin/bash$' /etc/passwd | cut -d: -f1 | while read user; do
    echo "  - $user"
done
echo ""

# 3. Ports TCP en ecoute
echo "--- Ports TCP en ecoute ---"
ss -tln | awk 'NR>1 {print $4}' | while read addr; do
    port=$(echo "$addr" | rev | cut -d: -f1 | rev)
    echo "  - Port $port"
done

echo ""
echo "=== Fin de l'audit ==="