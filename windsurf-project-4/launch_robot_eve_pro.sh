#!/bin/bash

echo "🤖 Lancement du Robot EVE PRO (Version Avancée)"
echo "================================================"
echo ""
echo "Version avec menu graphique et symboles ASCII!"
echo ""
echo "Émotions (avec symboles ASCII):"
echo "  ESPACE - :-) Sourire"
echo "  C - >:( Colère (YEUX ROUGES qui pulsent!)"
echo "  D - :-P Dégoût"
echo "  T - :-( Triste"
echo "  P - :'( Pleurs"
echo "  R - :-D Rire"
echo "  0 - :-| Normal"
echo ""
echo "Contrôles:"
echo "  O - O_O Ouvrir"
echo "  F - -_- Fermer"
echo "  B - ;-) Cligner"
echo "  ESC - Quitter"
echo ""

# Vérifier si l'environnement virtuel existe
if [ ! -d "venv" ]; then
    echo "❌ Environnement virtuel non trouvé!"
    echo "Veuillez d'abord exécuter: ./install_dependencies.sh"
    exit 1
fi

# Lancer le robot
./venv/bin/python robot_eve_pro.py
