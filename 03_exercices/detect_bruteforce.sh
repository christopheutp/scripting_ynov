#!/bin/bash
# detect_bruteforce.sh 
# Usage : ./detect_bruteforce.sh [fichier] [seuil]

LOG_FILE="${1:-auth.log}"
SEUIL="${2:-10}"
RAPPORT="rapport_incident.txt"

# Verification
if [ ! -f "$LOG_FILE" ]; then
    echo "Erreur : $LOG_FILE introuvable"
    exit 1
fi

if ! [[ "$SEUIL" =~ ^[0-9]+$ ]]; then
    echo "Erreur : le seuil doit etre un nombre"
    exit 1
fi

# Fichier temporaire
TEMP=$(mktemp)

# Extraction des IP et comptage
grep 'Failed password' "$LOG_FILE" \
  | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' \
  | sort | uniq -c | sort -rn > "$TEMP"

# Debut du rapport
{
    echo "=========================================="
    echo "   RAPPORT D'INCIDENT - BRUTEFORCE SSH"
    echo "=========================================="
    echo ""
    echo "Date du rapport : $(date)"
    echo "Fichier analyse : $LOG_FILE"
    echo "Seuil           : $SEUIL tentatives"
    echo ""

    echo "--- ADRESSES IP SUSPECTES ---"
    echo ""
    
    while read count ip; do
        if [ "$count" -ge "$SEUIL" ]; then
            premier=$(grep "Failed.*$ip" "$LOG_FILE" | head -1 | cut -c1-15)
            dernier=$(grep "Failed.*$ip" "$LOG_FILE" | tail -1 | cut -c1-15)
            printf "IP: %-15s | Tentatives: %4d | Periode: %s -> %s\n" \
                   "$ip" "$count" "$premier" "$dernier"
        fi
    done < "$TEMP"
    
    echo ""
    echo "=== FIN DU RAPPORT ==="
} > "$RAPPORT"

rm -f "$TEMP"
echo "Rapport genere : $RAPPORT"