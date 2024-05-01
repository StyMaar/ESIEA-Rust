# Un clone local de ChatGPT

**Objectif**: réaliser un logiciel permettant de converser avec un *Large language model* tournant en local sur notre PC

## fonctionnalités attendues

- Une interface de chat, avec une zone de saisie de texte et une zone d'affichage de la réponse.
- une page de préférence, permettant de modifier le prompt «système» passé au LLM
- un historique des discussions précédentes avec l'assistant
- intégration du LLM open-source [Llama3](https://huggingface.co/meta-llama/Meta-Llama-3-8B) via la bibliothèque [llama-cpp](https://lib.rs/crates/llama_cpp) (qui est just un binding Rust vers la librairie C++ du même nom). Remarque: pour pouvoir utiliser le modèle, il faudra convertir le modèle du format `safetensor` au format `gguf` ou trouver le modèle déjà converti sur internet (exemple: https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q6_K.gguf?download=true).

## Note

Comme `llama.cpp` est une dépendance en C++, il faut installer des dépendances dédiées qui ne sont pas gérées par `cargo` (sous linux `sudo apt install build-essential libclang-dev`)


## Ressources

- Le [site internet de Dioxus](https://dioxuslabs.com/)
- le [Discord officiel](https://discord.com/invite/XgGxMSkvUM)
- La [présentation de Llama3](https://huggingface.co/blog/llama3) sur hugginface
- le subreddit [LocalLLaMa](https://www.reddit.com/r/LocalLLaMA/)