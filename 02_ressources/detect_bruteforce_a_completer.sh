#!/bin/bash
# detect_bruteforce.sh 
# Usage : ./detect_bruteforce.sh [fichier] [seuil]

# TODO Q1: Accepter le seuil en parametre (defaut : 10)
# TODO Q2: Analyser le fichier auth.log fourni (parametre optionnel, defaut auth.log)
LOG_FILE="${1:-____}"
SEUIL="${2:-____}"
RAPPORT="rapport_incident.txt"

# Verification
# TODO Q2: Verifier que le fichier de log existe sinon quitter avec un message d'erreur


# TODO Q1: Verifier que le seuil est un nombre sinon quitter avec un message d'erreur


# Fichier temporaire
# TODO Q3: Creer un fichier temporaire pour stocker le comptage des IP


# Extraction des IP et comptage
# TODO Q3: Identifier les IP ayant des tentatives (Failed password) et compter les occurrences


# Debut du rapport
# TODO Q4: Generer rapport_incident.txt avec la date, liste IP suspectes + nb tentatives, et periode
{
    echo "=========================================="
    echo "   RAPPORT D'INCIDENT - BRUTEFORCE SSH"
    echo "=========================================="
    echo ""
    # TODO Q4: Afficher la date du rapport
    echo "Date du rapport : $(____)"
    echo "Fichier analyse : $LOG_FILE"
    echo "Seuil           : $SEUIL tentatives"
    echo ""

    echo "--- ADRESSES IP SUSPECTES ---"
    echo ""
    
    # TODO Q3: Ne garder que les IP avec un nombre de tentatives >= seuil
    # TODO Q4: Determiner le premier et dernier evenement pour cette IP (periode)
    
    echo ""
    echo "=== FIN DU RAPPORT ==="
} > "____"

# TODO Q4: Nettoyer le fichier temporaire

