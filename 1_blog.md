# Un moteur de blog

## Aperçu

Le moteur de blog est une application web qui permet aux utilisateurs de créer, de gérer et de publier des blogs. Le moteur doit fournir une interface conviviale permettant aux auteurs de rédiger, d'éditer et de publier des articles de blog. Les données relatives au blog seront stockées dans une base de données SQLite.

## Fonctionnalités attendues

1. **Gestion des utilisateurs**
	- Utilisateurs enregistrés : l'auteur se crée un compte via la ligne de commande, lors du premier démarrage du serveur.
	- Rôles des utilisateurs : auteur et invités (utilisateurs anonymes).
	- Profils d'utilisateurs : affichage des informations sur l'auteur, y compris le nom, l'adresse électronique (optionnelle) et la biographie.
2. **Gestion du blog**
	- Configurer les paramètres du blog : titre, description, mots-clés. Au choix: soit depuis une interface web, soit depuis la ligne de commande ou un fichier de config.
3. **Gestion des billets**
	- Créez, modifiez et supprimez des articles de blog.
	- Métadonnées de l'article : titre, contenu, date, auteur et catégories.
4. **Gestion du contenu**
	- Editeur WYSIWYG (avec [ProseMirror](https://prosemirror.net/)) pour la création et l'édition d'articles de blog.
	- Prise en charge des images, des vidéos et d'autres contenus multimédias (ça implique d'être capable d'uploader lesdits contenus sur le blog directement depuis la )
5. **Catégories et balises**
	- Créer, modifier et supprimer des catégories (tags).
	- Attribuer des catégories aux articles de blog.
6. **SEO**
	- Optimiser les articles de blog pour les moteurs de recherche (SEO) en utilisant des balises meta, des titres et des descriptions.
	- Générer des sitemaps pour les moteurs de recherche.
7. **Statistiques et analyses**
	- Les statistiques minimalistes: les pages vues et les visiteurs uniques (via l'adresse IP)
8. **Sécurité**
	- Chiffrement (HTTPS) via let's encrypt (ACME).
	- Prévention des attaques de type XSS et CSRF.
9. **Documentation**
    - fournir une documentation de déploiement

## Ressources:
- [Actix web](https://actix.rs/), le framework web qu'il vous est recommandé d'utiliser
- [ProseMirror](https://prosemirror.net/), pour l'éditeur WYSIWYG