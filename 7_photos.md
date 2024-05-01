# 7. Un outil de gestion des bibliothèques photos

**Objectif**: réaliser un logiciel permettant de trier ses photos localement sur son PC

## fonctionnalité attendues

### Deux modes d'affichage
- un mode «galerie»: permettant d'afficher toutes les photos d'un dossier
- un mode «photo» qui affiche une unique photo

### fonctionnalités du mode photo
- navigation entre les photos en utilisant les flêches gauche et droite du clavier (en tenant compte des filtres, c.f. mode galerie)
- possibilité de changer l'orientation d'une photo
- possibilité d'ajouter une étiquette de couleur à une photo (fonctionaliété utilisée quand cherche à établir une sélection de photos). Il doit y avoir 5 états possibles (sans couleur, bleu, vert, jaune, rouge). Lorsqu'on ajoute une étiquette à une photo en particulier, la couleur choisie doit apparaître sous forme d'une bordure autour de la photo (dans le mode photo, et aussi dans le mode galerie). Il ne peut y avoir qu'une couleur au maximum par photo.
- possibilité d'ajouter un ou plusieurs tags à la photo: on doit pouvoir utiliser un tag déjà existant ou en créer un nouveau. (regardez sur ce qui se fait pour de l'inspiration en terme d'UI/UX autour de cette fonctionalité)
- possibilité de revenir au mode galerie

### fonctionnalités du mode galerie
- filtrer par étiquette. Si plusieurs étiquettes sont présentes on veut avoir toutes les photos ayant l'une d'entre-elle (filtre «OU»)
- filtrer par tag. Si plusieurs tags sont renseignés, on veut les photos ayant tous ces tags (filtre «ET»)
- selectionner une photo pour l'ouvrir en mode photo. Lors de l'ouverture alors que des filtres sont actifs, la navigation dans le mode photo doit tenir compte des filtres.

## Ressources

- Le [site internet de Dioxus](https://dioxuslabs.com/)
- le [Discord officiel](https://discord.com/invite/XgGxMSkvUM)
