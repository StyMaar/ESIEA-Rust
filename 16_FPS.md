# FPS (3D)


**Objectif:** réaliser un FPS **multi-joueurs local**, en 3D, en utilisant le moteur [Bevy](https://bevyengine.org/)

Fonctionnalités minimales attendues:
- affichage d'une map en 3D
- déplacement sur la map
- gestion du tir et des points de vie
- gestion de la mort et du respawn

Fonctionnalités optionnelles (à développer seulement dans un deuxième temps!)
- des armes différentes
- une UI (menu démarrer, des ressources (💰), UI pour les scores et les achats d'armes) 
- posibiliter de looter l'arme d'un adversaire 

## Ressources:
- le site officiel de Bevy (il y a plein de ressources dessus dont [le getting started](https://bevyengine.org/learn/quick-start/getting-started/))
- le [dossier d'exemples](https://github.com/bevyengine/bevy/tree/main/examples) du repo git de Bevy
- le [discord de Bevy](https://discord.gg/s7jbXYh4) (particulièrement les channels #help, #tutorials et #crates)
- [le template Foxtrot](https://github.com/janhohenheim/foxtrot) qui montre comment on fait pas mal de choses avec tout un tas de crates standard de l'écosystème Bevy/Rust
- Le [Bevy cheatbook](https://bevy-cheatbook.github.io/introduction.html)
- [itch.io](https://itch.io/game-assets) pour des assets graphiques du jeu (armes, personages joueur)
- https://nofrag.com/dossier-la-visee-dans-les-fps/

## Conseil
- Essayez de suivre quelques tutos pour vous familiariser avec Bevy, puis répartissez-vous les tâches. Afficher les assets graphiques et la map à l'écran est indépendant du gameplay. Et bevy étant très modulaire, vous pouvez facilement tester l'un sans l'autre (en scriptant des objets sur la map pour travailler sur le rendu sans avoir de gameplay, et en écrivant des tests unitaires sur le gameplay qui n'ont pas besoin d'avoir de rendering).
- regardez bien les bibliothèques/plugin Bevy qui existent et qui peuvent vous aider, notamment en parcourant le channel #crates du Discord de Bevy. N'essayez surtout pas de tout faire vous-même from scratch, par contre il est probable que vous ayez à corriger des bugs dans les libs que vous allez utiliser (puisque très peu sont production-ready)
- idem, il y a pas mal de gens qui font des protos de FPS en Bevy et qui les montrent dans le channel #showcase. n'hésitez à leur poser des questions, à leur demander s'ils ont un repo github qui peut vous inspirer. Exemples: [ce thread Discord](https://discord.com/channels/691052431525675048/1205028182894313472/1205259028125712414). Autre exemple: ce fps minimaliste https://github.com/DGriffin91/BevyJam2022 (⚠️ le code date d'il y a deux ans, donc pas mal de choses ont changé dans Bevy depuis).
- l'aspect multijoueur est central, c'est en général dur à ajouter après coup donc il faut le penser dès le début. Il y a pas mal de bibliothèque pour gérer ça dans Bevy, le plus dur sera de choisir celle que vous utiliserez (même si vous pourrez éventuellement changer en cours de route si besoin)
- pour la map, soit vous avez envie de vous mettre à Blender (mais je vous le déconseille fortement, vu que vous n'êtes que deux sur le projet), soit vous faites en sorte d'importer une map de FPS existante (n'importe quelle map au format GlTF devrait faire l'affaire). Je sais qu'il est possible d'importer les maps de CSGO dans blender par exemple donc vous devez pouvoir en charger une dans Bevy derrière. Il y a aussi [ce plugin](https://github.com/BrianWiz/qevy) pour importer des maps de Quake.
- n'hésitez pas à solliciter de l'aide sur les Discord de Rust ou de Bevy quand vous êtes bloqués.
- La UI est mise en optionnelle parce que c'est l'aspect le moins aboutis de Bevy pour le moment, donc je ne veux pas que ça vous bloque. Mais dans l'absolu ça marche et des gens y arrivent, donc si vous avez un truc jouable, et que vous avez besoin de UI vous y passer.
- Il est fort probable qu'une nouvelle version de Bevy sortent pendant que vous faites votre projet. **Ne migrez pas vers la nouvelle version!** (il y a toujours quelques semaines où les bibliothèques et plug-in sont en retard et rien ne marche).
