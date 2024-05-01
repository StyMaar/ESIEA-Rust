
TODO: dire à tout le monde qu'ils faut qu'ils installent Rust-analyzer

### 3. Un gestionnaire de mailing-list

**Objectif:** Créer un gestionnaire de mailing-list avec une page d'administration.

Qu'est-ce qu'une mailing list: 

Fonctionnellement: c'est une addresse mail qui va ensuite forwarder automatiquement les mails reçu en direction de toutes les addresses mails des membres de la mailing-list.

Techniquement c'est deux choses:
- un serveur SMTP qui va posséder une base de donnée pour faire le lien entre les différentes listes et leurs membres, et ré-expédier le mail en SMTP à destination des différents destinataires.
- un back-office d'administration qui permet à quelqu'un de créer un compte, pour ensuite de créer et d'administrer ses mailing-list. Une mailing-list étant simplement composée d'un nom (<nom de la liste>@example.org) et d'une liste de membres.

fonctionnalité attendues:

1. **Pour le back-office**
- un endpoint de sign-in pour les gens qui souhaitent créer une mailing list (avec création d'un mdp, éventuellement validation d'un email, etc.)
- un endpoint de log-in 
- un endpoint d'affichage de la liste des mailing list de l'utilisateur 
- un endpoint de création de mailing list (avec une liste de gens à ajouter à la liste dès sa création)
- un endpoint d'ajout d'un utilisateur à la liste
- un endpoint de suppression de la mailing list
- un endpoint de suppression d'une utilisateur inscrit à la mailing list
2. **Pour le serveur SMTP**
- la capacité de forwarder un mail reçu à tous les utilisateurs inscrits à la mailing list en question

Défis:
- comprendre comment utiliser un framework back-end en Rust
- comprendre comment marche l'infrastructure des emails (comment marche SMTP dans les grandes lignes et surtout comment faire en sorte que les mails ne soient pas marqués comme spam).

Ressources:
- [Actix web](https://actix.rs/), le framework web qu'il vous est recommandé d'utiliser
- [https://serde.rs/], la bibliothèque de sérialisation/désérialisation de l'écosystème Rust(dans votre cas, pour le JSON)
- les bibliothèques relative au SMTP sur crates.io: https://lib.rs/search?q=SMTP
- https://www.xomedia.io/a-deep-dive-into-email-deliverability/

- Difficulté: _moyenne_
- Taille de groupe recommandé: **3**

### 6. Un clone local de ChatGTP

- Difficulté: _facile_
- Taille de groupe recommandé: **3**

### 7. Un outil de gestion des bibliothèques photos locales

**Objectif**: réaliser un logiciel permettant de trier ses photos localement sur son PC

#### fonctionnalité attendues

##### Deux modes d'affichage
- un mode «galerie»: permettant d'afficher toutes les photos d'un dossier
- un mode «photo» qui affiche une unique photo

##### fonctionnalités du mode photo
- navigation entre les photos en utilisant les flêches gauche et droite du clavier (en tenant compte des filtres, c.f. mode galerie)
- possibilité de changer l'orientation d'une photo
- possibilité d'ajouter une étiquette de couleur à une photo (fonctionaliété utilisée quand cherche à établir une sélection de photos). Il doit y avoir 5 états possibles (sans couleur, bleu, vert, jaune, rouge). Lorsqu'on ajoute une étiquette à une photo en particulier, la couleur choisie doit apparaître sous forme d'une bordure autour de la photo (dans le mode photo, et aussi dans le mode galerie). Il ne peut y avoir qu'une couleur au maximum par photo.
- possibilité d'ajouter un ou plusieurs tags à la photo: on doit pouvoir utiliser un tag déjà existant ou en créer un nouveau. (regardez sur ce qui se fait pour de l'inspiration en terme d'UI/UX autour de cette fonctionalité)
- possibilité de revenir au mode galerie

##### fonctionnalités du mode galerie
- filtrer par étiquette. Si plusieurs étiquettes sont présentes on veut avoir toutes les photos ayant l'une d'entre-elle (filtre «OU»)
- filtrer par tag. Si plusieurs tags sont renseignés, on veut les photos ayant tous ces tags (filtre «ET»)
- selectionner une photo pour l'ouvrir en mode photo. Lors de l'ouverture alors que des filtres sont actifs, la navigation dans le mode photo doit tenir compte des filtres.

#### Ressources

- Le [site internet de Dioxus](https://dioxuslabs.com/)
- le [Discord officiel](https://discord.com/invite/XgGxMSkvUM)

- Difficulté: _moyenne_
- Taille de groupe recommandé: **3**

### 14. un Tower defense (2D ou 3D)

**Objectif:** réaliser un jeu de tower-defense monojoueur, en 2D ou en 3D, en utilisant le moteur [Bevy](https://bevyengine.org/)

fonctionnalité minimales attendues:
- différent types de tours, avec des effets (graphiques et gameplay) complémentaires
- différents types de monstres

fonctionnalité optionelles (à développer seulement dans un deuxième temps!)
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

- Difficulté: _difficile_
- Taille de groupe recommandé: **4**

### 16. Un FPS (3D)


**Objectif:** réaliser un FPS **multi-joueurs local**, en 3D, en utilisant le moteur [Bevy](https://bevyengine.org/)

fonctionnalité minimales attendues:
- affichage d'une map en 3D
- déplacement sur la map avec

fonctionnalité optionelles (à développer seulement dans un deuxième temps!)
- des armes 
- une UI (menu démarrer, choix , des ressources (💰), UI pour les upgrades de tours) 

## Ressources:
- le site officiel de Bevy (il y a plein de ressources dessus dont [le getting started](https://bevyengine.org/learn/quick-start/getting-started/))
- le [dossier d'exemples](https://github.com/bevyengine/bevy/tree/main/examples) du repo git de Bevy
- le [discord de Bevy](https://discord.gg/s7jbXYh4) (particulièrement les channels #help, #tutorials et #crates)
- [le template Foxtrot](https://github.com/janhohenheim/foxtrot) qui montre comment on fait pas mal de choses avec tout un tas de crates standard de l'écosystème Bevy/Rust
- Le [Bevy cheatbook](https://bevy-cheatbook.github.io/introduction.html)
- [itch.io](https://itch.io/game-assets) pour des assets graphiques du jeu (armes, personages joueur)
- https://nofrag.com/dossier-la-visee-dans-les-fps/

## Conseil
- Essayez de suivre quelques tutos pour vous familiariser avec Bevy, puis répartisser-vous les tâches. Afficher les assets graphiques et la map à l'écran est indépendant du gameplay. Et bevy étant très modulaire, vous pouvez facilement tester l'un sans l'autre (en scriptant des objets sur la map pour travailler sur le rendu sans avoir de gameplay, et en écrivant des tests unitaires sur le gameplay qui n'ont pas besoin d'avoir de rendering).
- regardez bien les bibliothèques/plugin Bevy qui existent et qui peuvent vous aider, notamment en parcourant le channel #crates du Discord de Bevy. N'essayez surtout pas de tout faire vous-même from scratch, par contre il est probable que vous ayez à corriger des bugs dans les libs que vous allez utiliser (puique très peu son production-ready)
- idem, il y a pas mal de gens qui font des protos de FPS en Bevy et qui les montrent dans le channel #showcase. n'hésitez à leur poser des questions, à leur demander s'ils ont un repo github qui peut vous inspirer. Exemples: [ce thread Discord](https://discord.com/channels/691052431525675048/1205028182894313472/1205259028125712414). Autre exemple: ce fps minimaliste https://github.com/DGriffin91/BevyJam2022 (⚠️ le code date d'il y a deux ans, donc pas mal de choses ont changé dans Bevy depuis).
- l'aspect multijoueur est central, c'est en général dur à ajouter après coup donc il faut le penser dès le début. Il y a pas mal de bibliothèque pour gérer ça dans Bevy, le plus dur sera de choisir celle que vous utiliserez (même si vous pourrez éventuellement changer en cours de route si besoin)
- pour la map, soit vous avez envie de vous mettre à Blender (mais je vous le déconseille fortement, vu que vous n'êtes que deux sur le projet), soit vous faites en sorte d'importer une map de FPS existante (n'importe quelle map au format GlTF devrait faire l'affaire). Je sais qu'il est possible d'importer les maps de CSGO dans blender par exemple donc vous devez pouvoir en charger une dans Bevy derrière. Il y a aussi [ce plugin](https://github.com/BrianWiz/qevy) pour importer des maps de Quake.
- n'hésitez pas à solliciter de l'aide sur les Discord de Rust ou de Bevy quand vous êtes bloqués.
- La UI est mise en optionnelle parce que c'est l'aspect le moins aboutis de Bevy pour le moment, donc je ne veux pas que ça vous bloque. Mais dans l'absolu ça marche et des gens y arrivent, donc si vous avez un truc jouable, et que vous avez besoin de UI vous y passer.
- Il est fort probable qu'une nouvelle version de Bevy sortent pendant que vous faites votre projet. **Ne migrez pas vers la nouvelle version!** (il y a toujours quelques semaines où les bibiothèques et plug-in sont en retard et rien ne marche).

- Difficulté: _difficile_
- Taille de groupe recommandé: **4**

### 18. Contribution subtantielle à Bevy (moteur de jeu) ou son ecosystème

**Objectif:** Contribuer à Bevy ou à son écosystème de manière significative.

Vous contriburez soit à Bevy lui-même, soit à un des plugin important au sein de l'écosystème, soit à la documentation.

## Comment s'y prendre:
- Familiarisez-vous avec Bevy en lisant le [le getting started](https://bevyengine.org/learn/quick-start/getting-started/) et en suivant quelques tutos.
- Bevy maintient une liste de [_“good first issues”_](https://github.com/bevyengine/bevy/issues?q=is%3Aopen+is%3Aissue+label%3AD-Good-First-Issue). Vous en choisissez une, vous la résolvez (quitte à poser des questions dans le fil de discussion du ticket en question), puis vous faites une PR, et vous faites ça suffisemment de fois
pour que la contribution puisse être considérée par moi comme étant suffisemment significative. L'idée étant qu'après quelques _“good first issue”_ vous pouvez passer à des issues normales qui demanderont un peu plus de travail.
- vous pouvez aussi faire la même chose avec des plugin Bevy particuliers qui vous attirent.
- Sinon, vous pouvez aussi mettre à jour la documentation: l'une des principales ressources pour les débutants est le [Bevy cheatbook](https://bevy-cheatbook.github.io/introduction.html), mais il est malheureusement obsolète sur plein de sujet ([exemple](https://bevy-cheatbook.github.io/input/keyboard.html) qui indique en haut de page
_“As this page is outdated, please refer to Bevy's official migration guides while reading, to cover the differences: 0.9 to 0.10, 0.10 to 0.11, 0.11 to 0.12, 0.12 to 0.13. I apologize for the inconvenience. I will update the page as soon as I find the time. ”_). Mettre à jour le cheatbook (ou du moins un certain nombre de pages) est une bonne façon de contribuer à l'écosystème Bevy. La mise à jour se fait en forkant [le repo du cheatbook](https://github.com/bevy-cheatbook/bevy-cheatbook) et en soumettant une PR.

## Ressources:
- le site officiel de Bevy (il y a plein de ressources dessus dont [le getting started](https://bevyengine.org/learn/quick-start/getting-started/))
- le [dossier d'exemples](https://github.com/bevyengine/bevy/tree/main/examples) du repo git de Bevy, pour aller plus loin dans la compréhénsion de comment ça marche
- le [discord de Bevy](https://discord.gg/s7jbXYh4) (particulièrement les channels #help, #tutorials, mais aussi les channels thématiques aux issues auxquelles vous souhaiterez contribuer (ex: #networking, #rendering, etc.))
- Le [Bevy cheatbook](https://bevy-cheatbook.github.io/introduction.html)

- Difficulté: _difficile_
- Taille de groupe recommandé: **2**

### 19. Une boite à musique avec un raspberry Pi pico
    
- Difficulté: _moyenne_
- Taille de groupe recommandé: **2**
