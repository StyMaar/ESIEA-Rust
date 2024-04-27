# Tower defense (2D ou 3D)

**Objectif:** réaliser un jeu de tower-defense monojoueur, en 2D ou en 3D, en utilisant le moteur [Bevy](https://bevyengine.org/)

Fonctionalités minimales attendues:
- différent types de tours, avec des effets (graphiques et gameplay) complémentaires
- différents types de monstres

Fonctionalités optionnelles (à développer seulement dans un deuxième temps!)
- une UI (menu démarrer, affichage du temps entre les vagues, de la vague courante, des ressources (💰), UI pour les upgrades de tours) 

## Ressources:
- le site officiel de Bevy (il y a plein de ressources dessus dont [le getting started](https://bevyengine.org/learn/quick-start/getting-started/))
- le [dossier d'exemples](https://github.com/bevyengine/bevy/tree/main/examples) du repo git de Bevy
- le [discord de Bevy](https://discord.gg/s7jbXYh4) (particulièrement les channels #help, #tutorials et #crates)
- si vous voulez le faire en 3D: [le template Foxtrot](https://github.com/janhohenheim/foxtrot) qui montre comment on fait pas mal de choses avec tout un tas de crates standard de l'écosystème Bevy/Rust
- Le [Bevy cheatbook](https://bevy-cheatbook.github.io/introduction.html)
- [itch.io](https://itch.io/game-assets) pour les assets graphiques du jeu (ne vous perdez pas trop à chercher le truc qui vous plait le plus: il y a 29 000 asset packs gratuits sur le site !)

## Conseil
- Essayez de suivre quelques tutos pour vous familiariser avec Bevy, puis répartisser-vous les tâches. Afficher les assets graphiques et la map à l'écran est indépendant du gameplay. Et bevy étant très modulaire, vous pouvez facilement tester l'un sans l'autre (en scriptant des objets sur la map pour travailler sur le rendu sans avoir de gameplay, et en écrivant des tests unitaires sur le gameplay qui n'ont pas besoin d'avoir de rendering).
- n'hésitez pas à solliciter de l'aide sur les Discord de Rust ou de Bevy quand vous êtes bloqués.
- regardez bien les bibliothèques/plugin Bevy qui existent et qui peuvent vous aider, notamment en parcourant le channel #crates du Discord de Bevy. N'essayez surtout pas de tout faire vous-même from scratch, par contre il est probable que vous ayez à corriger des bugs dans les libs que vous allez utiliser (puique très peu son production-ready)
- La UI est mise en optionnelle parce que c'est l'aspect le moins aboutis de Bevy pour le moment, donc je ne veux pas que ça vous bloque. Mais dans l'absolu ça marche et des gens y arrivent, donc si vous avez un truc jouable, et que vous avez besoin de UI vous y passer.
- Il est fort probable qu'une nouvelle version de Bevy sortent pendant que vous faites votre projet. **Ne migrez pas vers la nouvelle version!** (il y a toujours quelques semaines où les bibiothèques et plug-in sont en retard et rien ne marche).