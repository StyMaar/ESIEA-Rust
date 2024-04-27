# Un gestionnaire de mailing-list

**Objectif:** Créer un gestionnaire de mailing-list avec une page d'administration.

Qu'est-ce qu'une mailing list: 

Fonctionnellement: c'est une addresse mail qui va ensuite forwarder automatiquement les mails reçu en direction de toutes les addresses mails des membres de la mailing-list.

Techniquement c'est deux choses:
- un serveur SMTP qui va posséder une base de donnée pour faire le lien entre les différentes listes et leurs membres, et ré-expédier le mail en SMTP à destination des différents destinataires.
- un back-office d'administration qui permet à quelqu'un de créer un compte, pour ensuite de créer et d'administrer ses mailing-list. Une mailing-list étant simplement composée d'un nom (<nom de la liste>@example.org) et d'une liste de membres.

## Fonctionalités attendues:

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

## Défis:
- comprendre comment utiliser un framework back-end en Rust
- comprendre comment marche l'infrastructure des emails (comment marche SMTP dans les grandes lignes et surtout comment faire en sorte que les mails ne soient pas marqués comme spam).

## Ressources:
- [Actix web](https://actix.rs/), le framework web qu'il vous est recommandé d'utiliser
- [https://serde.rs/], la bibliothèque de sérialisation/désérialisation de l'écosystème Rust(dans votre cas, pour le JSON)
- les bibliothèques relative au SMTP sur crates.io: https://lib.rs/search?q=SMTP
- https://www.xomedia.io/a-deep-dive-into-email-deliverability/