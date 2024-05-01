# Service de VPN

**Objectif**: développer le backend d'un service de VPN utilisant [Wireguard](https://www.wireguard.com/)

## Description du projet

La partie VPN en elle-même est assurée par Wireguard, le back-end est simplement là pour permettre de gérer dynamiquement la configuration (qui a accès, depuis quelle IP, quelle clé publique ils utilisent etc).

Du point de vue du développement, il s'agit d'un back-end CRUD extrêmement basique, et il faut en plus comprendre comment fonctionne et se configure Wireguard.

## Fonctionnalités attendues

### Fonctionnalités VPN

- au lancement, le logiciel doit faire en sorte de configurer et de lancer le serveur wireguard. À la clôture du programme, le serveur wireguard doit lui aussi être désactivé.

### Fonctionnalités d'administrations

Nécessitent d'être connectés en tant qu'administrateur

- endpoint d'administration, permettant d'afficher la liste des gens qui ont accès au VPN
- un endpoint de révocation d'accès
- un endpoint de création d'un nouvel accès
- possibilité de couper ou de démarrer le serveur wireguard

### Fonctionnalité de back-office

- endpoint de page d'accueil récapitulant les informations nécessaires à l'utilisateur
- endpoint d'authentification
- endpoint de mise à jour du mot de passe
- endpoint de génération de pair de clés et de mise à jour de la configuration Wireguard

## Fonctionnalités optionnelles
- en plus des endpoint JSON, faire des pages HTML+CSS pour y accéder facilement depuis le navigateur. Idéalement, on veut utiliser le header HTTP `Accept` pour que le back-end sache s'il doit retourner une page HTML ou un JSON

## Ressources:
- [Actix web](https://actix.rs/), le framework web qu'il vous est recommandé d'utiliser
- [https://serde.rs/], la bibliothèque de sérialisation/désérialisation de l'écosystème Rust (pour le JSON, dans votre cas)