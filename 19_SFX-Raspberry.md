# 19. Un système de SFX pour le FPS sur un raspberry Pi (pico)

**Objectif**: permettre au FPS du projet n°16 de jouer des sons sur une enceinte située à distance.

## Fonctionnalités attendues
- le logiciel tourne sur un Rasberry
- il écoute sur le réseau et joue des sons, parmi une liste pré-enregistrée, quand il reçoit certain messages.
- latence suffisamment faible pour ne pas nuire à l'effet recherché

## Ressources
- Les bibliothèques [rodio](https://lib.rs/crates/rodio) ou [cpal](https://lib.rs/crates/cpal) pour jouer de l'audio. Rodio étant plus haut niveau que cpal (et cpal est une dépendance de rodio)
- pour la cross-compilation vers le Raspberry: [Cross](https://github.com/cross-rs/cross)

## Note
Vous pouvez envisager d'utiliser une API HTTP, mais il est possible que ça génère une latence trop importante. Utiliser une simple connexion UDP peut être plus approprié, ou protocole comme QUIC par dessus UDP si vous avez des besoins spécifiques.
Des bibliothèques qui peuvent vous être utiles:
- [Actix web](https://actix.rs/) si vous voulez faire de l'HTTP
- [Quiche](https://lib.rs/crates/quiche) ou [Quinn](https://lib.rs/crates/quinn) si vous voulez utiliser le protocole QUIC.


