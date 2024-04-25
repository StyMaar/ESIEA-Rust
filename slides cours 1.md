
name: inverse
class: center, middle, inverse
---
name: kevin_splash
class: center, middle
---
template: inverse

# Introduction au langage Rust

![Rust logo and Ferris the unofficial Rust mascot](rust cover.png)

---
template: inverse

## Présentation + déroulement du cours
---
.left-column[
  ## Moi
]
.right-column[
- Kevin Canévet
- développeur Rust depuis 2016 (en freelance)
]

---
template: kevin_splash

## Et vous ?

---

.left-column[
  ## Déroulement du cours
]
.right-column[
3 séances:
- 26 avril (aujourd'hui) toute la journée
- 31 mai, matin
- 14 juin (après-midi)
]
???

Langage puissant, donc difficile, et enseignement très court, il va falloir s'accrocher.

Je vais me concentrer sur les aspects **durs** et conceptuels en cours

Posez-moi des questions !!!

Il y a plein de documents sur les fonctionalités un peu basiques du langage sur internet

---

.left-column[
  ## Ressources
]
.right-column[
- Le site du cours : [https://stymaar.github.io/ESIEA-Rust/](https://stymaar.github.io/ESIEA-Rust/)
- le forum officiel : [https://users.rust-lang.org/](https://users.rust-lang.org/)
- **Le Discord: [https://discord.gg/hUfEpjwQ](https://discord.gg/hUfEpjwQ) et particulièrement le channel `#beginners`**
- [le subreddit](https://reddit.com/r/rust)
]

???

Je poste les slides sur le site du cours

Ne pas négliger le discord, c'est une mine d'or.

C'est comme ChatGPT vous posez une question et vous avez la réponse presque immédiatement

Sauf que, contrairement à ChatGPT, les réponses sont correctes …

---

.left-column[
  ## Évaluation
]
.right-column[
Évaluation en 3 parties:
- un devoir sur table (aujourd'hui)
- votre participation pendant les séances (cours et TP) et sur le chat
- **Un projet** et une présentation / démo
]

---
template: inverse
## Le projet
---

.left-column[
  ## Le projet
]
.right-column[
### Est-ce que vous êtes tous inscrits?
[liste des projets](https://stymaar.github.io/ESIEA-Rust/projets.html) et le [tableur de formation des groupes](https://lite.framacalc.org/vjzts0h8lk-a7cx)
]
---


.left-column[
  ## Le projet
]
.right-column[
Déroulement du projet:

- D'ici au 31 mai: vous travaillez sur votre projet et vous posez des questions sur le chat
- séance du 31 mai: réponse aux questions et apports théoriques liées à vos projet
- Lundi 10 juin 23h59: deadline de soumission de vos projets
- séance du 14 juin: démo des projets
]

???

D'ici au 31 mai, n'hésitez pas à poser vos question sur le chat, 

je suis payé pour 

et vos camarades aussi (points de participation pour ceux qui posent des questions pertinentes et ceux qui y répondent)

---
template: inverse
# Il n'y a pas de question idiote
### Les idiots ne posent pas de questions

---
template: kevin_splash
## Qui a déjà entendu parlé de Rust ?

## Qui a déjà utilisé Rust ?

???

Maintenant qu'on a fait le tour des aspects logistiques
on peut entrer dans le vif du sujet

---
template: inverse
# Qu'est-ce que Rust

---


.left-column[
  ## Qu'est-ce que Rust
]
.right-column[
### Deux problèmes
- la gestion de la mémoire
- le multithreading
]

---
.left-column[
  ## Deux problèmes
  ### La gestion de la mémoire
]
.right-column[
- Les programmes ont besoin de mémoire pendant un certain temps.
- La mémoire n'est pas infinie.
- Donc quand ils n'en ont plus besoin il faut la désallouer.
]

???
Exception des missiles

---
.left-column[
  ## Deux problèmes
  ### Langage natif vs language managé
]
.right-column[
2 options:
- Le développeur est en charge de désallouer sa mémoire lui-même (langage «natif»)
- un sous-programme tourne en tâche de fond et libère la mémoire quand elle n'est plus nécessaire (langage «managé»)

]
???

le terme «langage managé» vient de Microsoft

Avec un langage managé le développeur peut faire «comme si» la mémoire était infinie

---

.left-column[
  ### Langage natif vs language managé
]
.right-column[
### Langages natifs
- historiquement C et C++
- le développeur gère sa mémoire lui-même
- résultat: [70% des failles de sécurité](https://www.chromium.org/Home/chromium-security/memory-safety/) viennent d'une [mauvaise gestion de la mémoire](https://msrc.microsoft.com/blog/2019/07/a-proactive-approach-to-more-secure-code/)
]
???

Le chiffre de 70% vient de Microsoft et de l'équipe Chromium de Google (j'ai mis les 2 liens)

---


.left-column[
  ## Deux problèmes
  ### Langage natif vs language managé
]
.right-column[
### Langages managés
- la mémoire est gérée par un «ramasse-miettes» (“garbage collector”)
- moins de travail pour les développeurs
- moins de risques de sécurité

### Mais
- impacts en terme de performances
- gros runtime/VM
- mauvaise intéropérabilité (avec l'OS/le hardware et **entre langages**)
]
        
???

trade-off entre latency et throughtput du GC

La JVM fait 180Mo

Utiliser une lib Java depuis JavaScript n'est pas une option réaliste
---


.left-column[
  ## Deux problèmes
  ### Langage natif vs language managé
]
.right-column[
Dans les années 90, tentative de basculement vers 100% langage managé
- poussé par Sun (Java)
- des CPU fait spécialement pour ([Jazelle](https://en.wikipedia.org/wiki/Jazelle))
Échec
- perf pas au niveau
- absence d'intéropérabilité => devoir repartir de zéro
]

---


.left-column[
  ## Deux problèmes
  ### Le multithreading
]
.right-column[
Les CPU ont plein de cœurs.
Mais la programmation multi-threads est compliquée:
- “_data race_” et “_race conditions_“
- les bugs sont non-déterministes
- donc dur à débuguer
- les langages managés n'aident pas tant que ça
]

???

Un ADM Threadripper monte à 96 cœurs, et 192 avec hyperthreading
Un samsung haut de gamme en a 10

Est-ce que vous avez eu des cours de programmation concurrente / parallèle ?

---
template: kevin_splash

The deadlock empire:
[http://deadlockempire.github.io/](http://deadlockempire.github.io/)

---
## Rust

- Créé en 2006 par Graydon Hoare, pour résoudre le problème du multithreading.
- À l'origine il avait un “_garbage collector_”
- puis l'équipe s'est rendu compte qu'ils pouvaient se débarrasser du GC

---
## Success story

Sorti en version stable en 2015

Utilisé par:
- Mozilla (Firefox)
- Dropbox (client, backend)
- Google (Chrome, Android)
- Microsoft (Windows, VSCode)
- Facebook (backend)
- Amazon (backend)
- Apple (?)
- [Promus par la Maison Blanche](https://www.whitehouse.gov/oncd/briefing-room/2024/02/26/press-release-technical-report/) ! 

---
## Comment ça marche ?

Le langage est divisé deux ensembles:
- le _“unsafe Rust”_
- le _“safe Rust”_

---
.left-column[
  ## Unsafe Rust
]
.right-column[
- a exactement les mêmes pouvoir que le C.
- pose les mêmes problèmes du point de vue de la gestion de la mémoire.
- s'utilise via le mot clé `unsafe`
- ne sert que très rarement
- ne sera pas étudié dans ce cours
]


???

- je ne l'ai jamais utilisé en 8 ans
- il existe des choses comparables dans d'autres languages quand il s'agit d'interagir avec l'OS
- utilisé par des librairies bas niveau, pour intéragir avec l'OS ou le hardware
- utilisé pour implémenter un grand nom de fonctions de la stdlib, 
- elles nous offrent une abstraction `safe`, qui ne risque pas de poser de problèmes mémoire
- elles sont étendue au fil du temps, pour remplacer toujours plus d'usage de code `unsafe` dans les codebases
---


.left-column[
  ## Safe Rust
]
.right-column[
- sous-ensemble du premier
- ne permet de faire **que 99%** de ce que le C peut faire
- n'a pas de problème mémoire
- même lorsqu'on développe un OS ou des bibliothèques de très bas niveau, 95-99% du code est du code `safe`
]

???

immense avantage de Rust: on peut faire strictement la même chose qu'en C, avec 95%+ de code safe et seulement quelques pourcents de code unsafe
on peut passer beaucoup plus de temps à auditer le code `unsafe` que l'ensemble du code C.
on peut même utiliser des méthodes formelles, qui sont très couteuse en temps, puisque la quantité de code à couvrir est largement réduite
les fonctions de la stdlib font l'objet de vérification formelle

---


.left-column[
  ## Comment ça marche
]
.right-column[
- Chaque object a un unique _propriétaire_ (“ownership”)
- Les _références_ à cet objet sont **partagées XOR mutable** (“borrowing rules”)
]

---


.left-column[
  ## Ownership
]
.right-column[
- un objet est possédé par **une et une seule** variable
- quand cette variable sort du scope, l'objet est désalloué
]

???

C'est cette règle qui permet de se passer de garbage collector

---


.left-column[
  ## Ownership
]
.right-column[
Quand on passe une variable _par valeur_ à une fonction ou à un autre objet, la propriété est transférée et la variable n'est plus utilisable
```Rust
    let a = String::new();
    my_function(a);
    let b = a; // ERROR: use of moved value: `a`
```

On parle de _“move semantics”_

]

???

On dit que l'object est `move`d

---


.left-column[
  ## Ownership
]
.right-column[
Pour utiliser l'objet à plusieurs endroit, vous devez:
- utiliser une référence
- `clone`r l'objet.

```Rust
    let a = String::new();
    my_func_ref(&a);
    let b = a; // works
    let b_clone = b.clone();
    my_function(b_clone);
    let c = b; // works as well
```
]
---


.left-column[
  ## Ownership
]
.right-column[
- Cette règle a un énorme impact dans la manière d'écrire le code
- contraint à une structure spécifique
- source de frustration importante chez les débutants (“fighting the borrow checker”)
- mais cette structure fait du code plus lisible et compréhensible, dans tous les langages
]

???

Si vous prenez l'habitude de structurer votre code avec un propriété claire de la donnée, ça rend tout votre code plus lisible et plus robuste
S'adapte à tous les langages


---


.left-column[
  ## Borrowing
]
.right-column[
2 types de références:
- `&`: “reference” ou “shared reference” 
- `&mut` “mutable reference” ou “exclusive reference”
]
???

---


.left-column[
  ## Borrowing
]
.right-column[
3 règles:
1. Vous pouvez avoir autant de références (`&`) à un objet en même temps
2. Vous ne pouvez pas avoir une référence mutable (`&mut`) en même temps qu'une autre référence (mutable ou non)
3. les références doivent vivre moins longtemps que l'objet qu'elles référencent (on parle de **“lifetime”**)
]
???

---


.left-column[
  ## Borrowing
  ## Exemples
]
.right-column[
### 1. Vous pouvez avoir autant de références (`&`) à un objet en même temps
```Rust
    let a = 42;
    let b = &a;
    let c = &a;
```
]
???

---


.left-column[
  ## Borrowing
  ## Exemples
]
.right-column[
### 2. Vous ne pouvez pas avoir une référence mutable (`&mut`) en même temps qu'une autre référence immutable

Immutable + mutable => Erreur
```Rust
    let mut a = 42;
    let b = &a;
    let c = &mut a; // cannot borrow `a` as mutable because it is also borrowed as immutable
```
]
???

Quelque soit l'ordre
---


.left-column[
  ## Borrowing
  ## Exemples
]
.right-column[
### 2. Vous ne pouvez pas avoir une référence mutable (`&mut`) en même temps qu'une autre référence immutable

Mutable + immutable => Erreur
```Rust
    let mut a = 42;
    let b = &mut a;
    let c = &a; // cannot borrow `a` as immutable because it is also borrowed as mutable
```
]
???
---


.left-column[
  ## Borrowing
  ## Exemples
]
.right-column[
### 2. Vous ne pouvez pas avoir une référence mutable (`&mut`) en même temps qu'une autre référence mutable

Mutable + mutable => Erreur
```Rust
    let mut a = 42;
    let b = &mut a;
    let c = &mut a; // cannot borrow `a` as mutable more than once at a time
```
]
???

C'est cette règle d'exclusivité qui garantie qu'il n'y ait pas de data-race

---


.left-column[
  ## Borrowing
  ## Exemples: lifetime
]
.right-column[
### 3. les références doivent vivre moins longtemps que l'objet qu'elles référencent (on parle de **“lifetime”**)

Lifetime
```Rust

    let a_ref: &u32 = {
        let a = 42;
        &a
    };
    // ERROR: `a` does not live long enough
```
]
???
---
.left-column[
  ## Borrowing
  ## Exemples: lifetime
]
.right-column[
### 3. les références doivent vivre moins longtemps que l'objet qu'elles référencent (on parle de **“lifetime”**)

Cette régle existe aussi en C et en C++. Mais:
- En Rust, le compilateur rejette le code incorrect
- En C ou en C++: use-after-free (UAF) à l'éxecution => [36% des failles de sécurité dans Chrome](https://www.chromium.org/Home/chromium-security/memory-safety/).
]

???

À eux tous seuls [36% des failles de sécurité](https://www.chromium.org/Home/chromium-security/memory-safety/)

---


.left-column[
  ## Borrowing
  ## Exemples: lifetime
]
.right-column[
### 3. les références doivent vivre moins longtemps que l'objet qu'elles référencent (on parle de **“lifetime”**)

Exemple de Use-after-free en C:

```c
#include <stdio.h>
#include <stdlib.h>
int main() 
{ 
    int* ptr = (int*)malloc(sizeof(int));
    *ptr = 10;
    free(ptr);
    printf("Value: %d\n", *ptr); // This is a use-after-free 
    return 0;
}
```

]
???

En C et C++, un UAF est un “Undefined Behavior”

---


.left-column[
## Ownership & borrowing
]
.right-column[
## Des questions ?
]

???

Demander à un élève de passer au tableau et de ré-expliquer en 2 minutes

---

## TP

???

Un peu de pratique pour se changer les idées
Pour ne pas vous assommer

---


.left-column[
## TP
]
.right-column[
Écrire un programme qui écoute les connexions TCP, et pour chaque connexion reçue, affiche ce qui est envoyé sur le réseau.

Documentations à regarder:
- `std::net::TcpListener`
- `std::net::TcpStream`
- `std::io::Read`
- `String::from_utf8_lossy` pour convertir les octets en string
]

???

Conseil de ne pas utiliser de LLM pour les TPs.

(Et de se méfier de ChatGPT de manière général pour Rust)

Comment vous pouvez tester que votre code marche comme il faut ? `netcat` ou coder votre propre truc!

---


.left-column[
## TP (corrigé)
]
.right-column[
```Rust
    use std::net::{TcpListener, TcpStream};
    use std::io::Read;

    fn handle_client(mut stream: TcpStream) {
        let mut buffer = [0; 50];
        while let Ok(bytes_read) = stream.read(&mut buffer) {
            if bytes_read == 0 {
                break;
            }
            println!("Received: {}", String::from_utf8_lossy(&buffer[..bytes_read]));
        }
    }

    fn main() -> std::io::Result<()> {
        let listener = TcpListener::bind("127.0.0.1:8080")?;
        println!("Server listening on port 8080...");

        for stream in listener.incoming() {
            match stream {
                Ok(stream) => handle_client(stream),
                Err(err) => println!("Error {}", err),
            }
        }
        println!("TCP listener ended");
        Ok(())
    }
```
]

???

Quel est le problème avec ce code ?

---


.left-column[
## TP (corrigé)
]
.right-column[
```Rust
    use std::net::{TcpListener, TcpStream};
    use std::io::Read;

    fn handle_client(mut stream: TcpStream) {
        let mut buffer = [0; 50];
        while let Ok(bytes_read) = stream.read(&mut buffer) {
            if bytes_read == 0 {
                break;
            }
            println!("Received: {}", String::from_utf8_lossy(&buffer[..bytes_read]));
        }
    }

    fn main() -> std::io::Result<()> {
        let listener = TcpListener::bind("127.0.0.1:8080")?;
        println!("Server listening on port 8080...");

        for stream in listener.incoming() {
            match stream {
                Ok(stream) => {
                    std::thread::spawn(move || {
                        handle_client(stream);
                    });
                },
                Err(err) => println!("Error {}", err),
            }
        }
        println!("TCP listener ended");
        Ok(())
    }
```
]

???

Le `thread::spawn` on utilise désormais un thread par connexion


---
template: inverse

## Les aménagements au système d'ownership et aux règles de borrowing

---
template: inverse

## Les règles de borrowing et le système d'ownership imposent des contraintes sur la façon d'écrire le code
## Parfois il faut pouvoir contourner ces règles

???

Comment on a dit qu'on pouvait contourner les règles déjà?

---

.left-column[
  ## Les aménagements
  ## Ownership
]
.right-column[
Le trait  `Copy`:

Pour certains types d'objets, l'opération `move` est remplacée par une copie automatique:

```rust
fn square(x: i32) -> i32 {
    x * x
}
```

Marche, parce que les entiers implémentent [le trait `Copy`](https://doc.rust-lang.org/std/marker/trait.Copy.html).

]
???
---
.left-column[
  ## Le trait Copy 
]
.right-column[
Seuls quelques objets «simples» implémentent `Copy` par défault. 
- les entiers
- les floats
- les références `&` (non mutables !)
]
???
---


.left-column[
  ## Le trait Copy 
]
.right-column[
- On peut implémenter `Copy` sur nos propres types
- mais seulement s'ils sont entièrement stockés sur la pile (_“stack”_)
- et si pour les dupliquer il suffit de faire une **simple copie bit à bit**

```Rust
#[derive(Clone, Copy)]
struct Point{
    x: f64,
    y: f64,
}
```
    
]
???
---
template: inverse

## Apparté: la pile / le tas

???

Est-ce que vous êtes familiers avec ces concepts ?

---

.left-column[
## Apparté: la pile / le tas
]
.right-column[
La pile (_“stack”_):
- zone mémoire associée à une fonction en particulier
- c'est là que se trouvent les **variables locales**
- désalloué automatiquement quand on quite une fonction
- allocation et désallocation très rapide (juste une incrémentation / décrémentation d'indice)
- ne peut contenir que des objets de taille fixe*

]
???

*pas tout à fait vrai en théorie, mais en pratique c'est tout comme, et c'est vrai en Rust
---


.left-column[
  ## Apparté: la pile / le tas
]
.right-column[
La tas (_“heap”_):
- zone mémoire valable toute la durée du programme
- gérée par un **«allocateur»**
- allocation et désallocation relativement lente
- peut contenir que des objets de taille variable (string, tableau dynamique, hashmap)
- on peut y mettre n'importe quoi (y compris des objets qui tiendrait sur la pile)
]
---
## Apparté: `#[derive()]`

- permet d'implémenter automatiquement certains traits sur une struct
- sous réserve que tous les champs implémentent eux même ce trait

```Rust
#[derive(Clone, Copy)]
struct Point{
    x: f64,
    y: f64,
}
```

---
.left-column[
  ## Le trait Copy
]
.right-column[

Une fois qu'on a implémenté `Copy` sur notre objet, il est cloné automatiquement au lieu d'être `move`

```Rust
let a = Point{ x: 0.0, y: 1.0};
let b = a;

assert_eq!(a.x, b.x); // a est toujours disponible, l'objet a été copié pour former l'objet `b`

```

]
???
---

.left-column[
  ## Le trait Copy
]
.right-column[

Si on a au moins un champs de notre `struct` qui est stocké sur le tas, on n'utilise pas `Copy`, mais seulement le trait `Clone`, qui donne accès à la methode `.clone()`:

```Rust
#[derive(Clone)]
struct Eleve {
    nom: String, // une string est stockée sur le tas
    note: u8
}

let bob = Eleve {
    nom: String::from("Bob"),
    note: 10,
};

let bob2 = bob.clone();
```

]
---

.left-column[
  ## Le trait Copy
]
.right-column[

Idem si copier l'objet implique une opération qui n'est pas **seulement une copie bit à bit**.

]

???

Remarque: il est possible de tricher et d'implémenter `Copy` sur un objet qui ne respecte pas ses règles

Mais ça va à l'encontre des conventions de Rust (ce qui est coûteux en termes de performances doit être explicite dans le code)

---


.left-column[
  ## Le trait Copy
]
.right-column[
Le trait `Copy` est ce qui s'appelle un _“marker trait”_, il n'a pas de méthode associée.

Sa définition dans `std::marker::Copy`

```Rust
pub trait Copy: Clone { }
```

Il est juste là pour “marquer” qu'un type possède une certaine propriété.

]

???

Quand on «copie» un objet c'est la méthode clone qui est appelée implicitement.

Ici c'est la propriété: peut être cloné sans impact pour les performances, et de manières implicite


---


.left-column[
  ## Les aménagements
  ## Ownership
]
.right-column[
- dans certains cas, il est nécessaire d'avoir plusieurs propriétaires (_“shared ownership”_) d'un objet
- mais dans ce cas là, comment gérer la désallocation de l'objet?

]
???
Demander aux élèves
---
## Reference-counting

On va utiliser un type de _“smart-pointers”_, qui contiennent à la fois:
- un _pointeur_ vers l'objet qui nous intéresse
- un compteur, qui tient le compte du nombre de propriétaires de la donnée

Quand le nombre tombe à zéro, l'objet sous-jacent est désalloué.

???

C'est un type de garbage collection
C'est le fonctionnement de la gestion de la mémoire en Objectif-C, ou Swift

Les smart pointeurs sont présents directement dans la stdlib
on ne peut pas en coder un nous-même sans utiliser la variante `unsafe` du langage
---


.left-column[
  ## Reference-counting
  ## Les avantages
]
.right-column[
- Ça permet de relacher la contraite des règles d'ownership dans les cas où cette règle nous empêche de coder ce qu'on veut.
- Sans avoir à utiliser du code `unsafe`, et donc sans prendre le risque d'avoir un problème de gestion mémoire.
]
???

---


.left-column[
  ## Reference-counting
  ## Les inconvénients
]
.right-column[
- Les objets sont nécessairement alloués sur le tas
- L'incrémentation du compteur peut être coûteuse dans le cas d'un `Arc` (c.f. ci-dessous)
- peut provoquer des fuites de mémoire s'il y a des cycles
]
???

Performance
---


.left-column[
  ## Reference-counting
  ## Les cycles
]
.right-column[
    
Que se passe-t-il dans le cas suivant ?

```Rust

    struct Obj {
        sp: Option<Rc<Obj>>
    }

    fn main(){
        let mut a = Obj {sp: None};
        let b = Obj {sp: Some(a)};
        a.sp = b;
    }

```
]
???

---

.left-column[
  ## Reference-counting
  ## Les cycles
]
.right-column[

```Rust

    struct Obj {
        sp: Option<Rc<Obj>>
    }

    fn main(){
        let mut a = Obj {sp: None};
        let b = Obj {sp: Some(a)};
        a.sp = b;

        // aucun des deux objets n'est jamais désalloué
        // car le compteur reste à 1 pour les deux
    }

```
]
???

En pratique ce cas arrive très rarement, mais il faut l'avoir en tête pour ne pas se faire avoir

---


.left-column[
  ## Reference-counting
  ## Les différents types
]
.right-column[
Il y a deux types de _smart-pointers_ qui font du _reference counting_:
- `Rc`, qui n'est pas thread-safe, et sert rarement
- `Arc`, qui est thread-safe, et qui sert beaucoup plus souvent
]
???

Q: Ça veut dire quoi être thread-safe pour un reference-counting pointer?

---
.left-column[
  ## Reference-counting
  ## `Arc`
]
.right-column[

```Rust
    let variable = std::sync::Arc::new(String::from("Some shared variable"));
    {
        let variable = variable.clone(); 
        std::thread::spawn(move || { 
            println!("variable from thread 1: {}", variable);
        });
    };
    std::thread::spawn(move || { 
        println!("variable: from thread 2: {}", variable);
    });
```

]
???

On expliquera plus tard ce que sont les `move ||`

---
.left-column[
  ## Reference-counting
  ## `Arc`
]
.right-column[

```Rust
    let variable = std::sync::Arc::new(String::from("Some shared variable"));
    {
        let variable = variable.clone(); 
        std::thread::spawn(move || { 
            println!("variable from thread 1: {}", variable);
        });
    };
    std::thread::spawn(move || { 
        println!("variable: from thread 2: {}", variable);
    });
```

- On a besoin d'un `Arc` ici, parce qu'on ne sait pas quel thread se terminera en premier.
- On ne sais donc pas lequel doit avoir le droit de libérer la mémoire allouée pour la String
]
???

Cas de figure super classique: si on a une donnée partagée entre plusieurs threads, en général on n'a pas de garantie sur le thread qui vit le plus longtemps

---
.left-column[
  ## Reference-counting
  ## `Arc`
]
.right-column[

Mais parfois on peut laisser le thread parent conserver la propriété de la mémoire **si celui-ci attend que les threads enfants soient finis** avant de continuer son execution, grâce aux _“scoped threads”_

```Rust
    use std::thread;

    fn main() {
        let variable = String::from("Some shared variable");
        thread::scope(|s| {
            s.spawn(|| {
                println!("variable from thread 1: {}", &variable);
            });
            s.spawn(|| {
                println!("variable: from thread 2: {}", &variable);
            });
        });
    }
```
]
???

---
.left-column[
  ## Aménagements à l'ownership
]
.right-column[
## Des questions ?
]

???

Demander à un élève de passer au tableau et de ré-expliquer en 2 minutes

---
.left-column[
  ## TP (suite)
]
.right-column[
- Maintenant on veut pouvoir prendre argument en entrée du programme (en CLI)
- Et envoyer celui-ci à la machine distante lors de chaque connection.

Doc à regard: 
- `std::env`
- `std::io::Write`
]

???


---
.left-column[
  ## TP (Suite)
]
.right-column[
    
```Rust
use std::thread;
use std::net::{TcpStream, TcpListener};
use std::io::{Read, Write};
use std::env;

fn main() -> std::io::Result<()> {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <message>", args[0]);
        return Ok(());
    }
    let message = &args[1];
    let listener = TcpListener::bind("127.0.0.1:8080")?;
    println!("Listening on 127.0.0.1:8080");
    thread::scope(|s| {
        for stream in listener.incoming() {
            match stream {
                Ok(stream) => {
                    s.spawn(|| {
                        handle_connection(stream, message)
                    });
                }
                Err(e) => {
                    eprintln!("Error accepting connection: {}", e);
                }
            }
        }
    });
    Ok(())
}

fn handle_connection(mut stream: TcpStream, message: &str) {
    
    stream.write(message.as_bytes()); // error handling missing here

    let mut buffer = [0; 512]; 
     while let Ok(bytes_read) = stream.read(&mut buffer) {
        if bytes_read == 0 {
            break;
        }
        println!("Received: {}", String::from_utf8_lossy(&buffer[..bytes_read]));
    }
}
```

]
???

Ici on utilise thread::scope => pas de problème d'ownership

---
.left-column[
  ## TP (suite)
]
.right-column[
    
```Rust

use std::thread;
use std::net::{TcpStream, TcpListener};
use std::io::{Read, Write};
use std::env;
use std::sync::Arc;


fn main() -> std::io::Result<()> {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <message>", args[0]);
        return Ok(());
    }
    let message = Arc::new(String::from(&args[1]));
    let listener = TcpListener::bind("127.0.0.1:8080")?;
    println!("Listening on 127.0.0.1:8080");
    for stream in listener.incoming() {
        let message = message.clone();
        match stream {
            Ok(stream) => {
                thread::spawn(move || {
                    handle_connection(stream, &message)
                });
            }
            Err(e) => {
                eprintln!("Error accepting connection: {}", e);
            }
        }
    }
    Ok(())
}

```

]
???

Si on veut utiliser thread::spawn, il faut utiliser Arc.

Remarque: `move` closure et `String::from` => on verra ça après

---
.left-column[
## Les aménagements
]
.right-column[
## Aménagements aux règles de borrowing
]
???
---
.left-column[
## Les aménagements
## Borrowing
]
.right-column[
Parfois, on voudrait aussi avoir plusieurs références mutables à un objet.

Mais il ne faut pas que ça remette en question la garantie du Rust contre les data-race.
]
???
---
.left-column[
## Les aménagements
## Borrowing
]
.right-column[
### La solution
_“Interior mutability”_
]
???
---
.left-column[
  ## _Interior mutability_
]
.right-column[
Encore des _“smart-pointers”_

Ils garantissent **à l'éxecution** que la variable n'est pas lue et écrite en même temps
]
???

De la même manière que les reference-counted pointed garantissent que la variable sera bien désalouée une et une seule fois.
???

---
.left-column[
  ## _Interior mutability_
]
.right-column[
Deux variantes:
- `RefCell`, pour un partage à l'intérieur d'un même thread
- les _“locks”_, `Mutex` et `RWLock` pour un partage entre plusieurs thread
]
???

Les RefCell ne servent presque jamais, les locks servent très souvent.

---

.left-column[
  ## _Interior mutability_
  ## `Mutex` et `RWLock`
]
.right-column[
- [`std::sync::Mutex`](https://doc.rust-lang.org/std/sync/struct.Mutex.html): par défaut
- [`std::sync::RwLock`](https://doc.rust-lang.org/std/sync/struct.RwLock.html): plus performant si déséquilibre entre nombre de lecture et d'écriture
]
???

---
.left-column[
  ## TP (suite)
]
.right-column[
- On veut maintenant que notre programme compte le nombre d'octets qu'il a reçu sur le réseau, toute connection confondue
- Et écrire dans la console ce nombre toute les 3 secondes

Doc utile: 
- `std::thread::sleep`
]

???


---


.left-column[
  ## TP (suite)
]
.right-column[
```Rust
    use std::thread;
    use std::net::{TcpStream, TcpListener};
    use std::io::{Read, Write};
    use std::env;
    use std::sync::Arc;
    use std::time::Duration;
    use std::sync::Mutex;


    fn main() -> std::io::Result<()> {
        let args: Vec<String> = env::args().collect();
        if args.len() != 2 {
            eprintln!("Usage: {} <message>", args[0]);
            return Ok(());
        }

        let bytes_received = Arc::new(Mutex::new(0));

        let b = bytes_received.clone();

        thread::spawn(move ||{
            loop {
                thread::sleep(Duration::from_secs(3));
                let bytes_received = b.lock().expect("Mutex is poisoned");
                println!("We have received {bytes_received} bytes so far");
            }
        });

        let message = Arc::new(String::from(&args[1]));
        let listener = TcpListener::bind("127.0.0.1:8080")?;
        println!("Listening on 127.0.0.1:8080");
        for stream in listener.incoming() {
            let message = message.clone();
            let bytes_received = bytes_received.clone();
            match stream {
                Ok(stream) => {
                    thread::spawn(move || {
                        handle_connection(stream, &message, bytes_received)
                    });
                }
                Err(e) => {
                    eprintln!("Error accepting connection: {}", e);
                }
            }
        }
        Ok(())
    }

    fn handle_connection(mut stream: TcpStream, message: &str, bytes_received: Arc<Mutex<usize>>) {
        
        stream.write(message.as_bytes()); // error handling missing here

        let mut buffer = [0; 512]; 
        while let Ok(bytes_read) = stream.read(&mut buffer) {
            if bytes_read == 0 {
                break;
            }

            let mut bytes_received = bytes_received.lock().expect("Mutex is poisoned");

            *bytes_received += bytes_read;

            println!("Received: {}", String::from_utf8_lossy(&buffer[..bytes_read]));
        }
    }
```
]

???


---
template: inverse
## Les chaines de caractères

---

Il y a deux objets principaux pour manipuler des chaines de caractères en Rust.
- les `String`, qui sont des chaines de caractères allouées sur le tas
- les _“string slices”_ `&str`, qui sont une référence à une chaine de caractère allouée ailleurs

???

---
## Les “string slices”

`str` désigne un morceau dans une chaine de caractères allouée quelque part.

```Rust
  let s = String::from("hello world");

  // s[0..5] est un «morceau» de chaine de caractère
  let hello = &s[0..5];
  let world = &s[6..11];
```

On ne peut pas le manipuler directement.

On le manipule nécessairement derrière une référence: `&str`.

???

On ne peut pas en changer le contenu ou la taille.

On peut en théorie aussi utiliser une slice _mutable_ de string, mais ça ne sert presque jamais.
c.f. https://users.rust-lang.org/t/can-we-make-a-mut-str/93448/3


---

## `String`

Ce sont des chaines de caractère dynamiques.

Elles sont allouées sur le tas, et peuvent donc être redimensionnées.

```Rust
let mut s = String::new();

s.push('h');
s.push('e');
s.push('l');
s.push('l');
s.push('o');

assert_eq!("hello", s);
```
---

## `String`

Elles peuvent être transformée en `&str`.

```Rust
let string = String::from("Aaaaah");
let s: &str = string.as_str();
// ou
let ss: &str = string[..];
```

---
Mais en général, on n'a pas besoin de faire ça.

```Rust
fn toto(s: &str){
  //do something here
}

let string = String::from("Aaaaah");

toto(&string); // ça marche alors que le type de &string est `&String`
```

---


[_“deref coercion”_](https://doc.rust-lang.org/book/ch15-02-deref.html)

```Rust

let arc_str = Arc::new(String::from("C'est magique"));

toto(&string); // margique &Arc<String> => &str

toto(&(*string)[..]); // sans la “deref coercion”
```

???

Magie pour éviter de nous emmerder

Ça marche pour tous les smart pointers!

---

## Qu'est-ce que c'est

```Rust
let hello = "Hello world";
```

???

Quel est le type de `hello`?
Où est-ce que la donnée est stockée en mémoire?
---

## _“String litteral”_

- Les chaines de caractères écrites en dur dans le code sont des _“string litteral”_.
- La donnée est directement stockées dans le fichier exécutable (section `.data`)
- elles sont de type `&str`
- Ce sont des références qui vivent aussi longtemps que le programme lui-même (leur lifetime est «infinie»)

???

On parlera des lifetimes plus tards
---

## Variantes

```Rust
let s = "Hello".to_string(); // <= le plus classique
let t = "Bonjour".to_owned();
let u = String::from("Hallo"); // mon favoris
let v = "Hola".into(); // From/Into traits
```
---

## “Raw” string litteral

```Rust
let string: &str = r#"Ceci est une chaîne de caractère 
sur plusieurs lignes
Et qui peut contenir des guillemets " sans avoir besoin d'être échapées.
"#;
```

Et si on veut mettre  `"#` dans la chaine de caractère: on augmente le nombre de `#` dans le délimiteur

```Rust
let s = r##"Ceci est Un "raw string litteral": 
r#"Hello"# 
"##;
```
---

## Mise en forme de chaîne de caractères

```Rust
let name = "Victor";
let age = 20;

let caption: String = format!("{} a {} ans", name, age); // Victor a 20 ans.
```

Pour les variables on peut même écrire:

```Rust
let name = "Rudy";
let age = 31;

let caption: String = format!("{name} a {age} ans"); // Rudy a 31 ans.
```

???

Mais pas un truc plus compliqué

C'est quoi le bug dans mes deux exemples ?

---
### Ça marche aussi avec les _“raw string litterals”_

```Rust
let title = "Ut velit mauris, egestas sed, gravida nec";
let paragraph = " Lorem ipsum dolor sit amet, consectetur adipiscing.";
let html = format!(r#"
  <article>
    <h1>{title}<h1>
    <p>
      {paragraph}
    </p>
  </article>"#);
```

## ⚠️ NE FAITES JAMAIS ÇA EN VRAI ! 😱😱😱

C'est la recette parfaite pour une attaque XSS

???

On ne formate jamais du HTML, du JSON, du SQL ou **n'importe quoi qui a vocation à être lu par une machine**
parce que ça ne fait aucun échapement.
C'est aussi idiot que de pousser un truc dans un mixeur avec ses doigts

---

## `Display`

Pour pouvoir utiliser une variable dans une mise en forme de chaîne de caractère, il faut que le type de celle-ci implémente le [trait `std::fmt::Display`](https://doc.rust-lang.org/std/fmt/trait.Display.html)

Remarque: ce trait ne se `#[derive]` pas, il faut l'implémenter à la main.

???

Ce trait est destiné à l'affichage à destination d'un utilisateur

---
### `Debug`

Parfois on n'a besoin d'afficher le contenu d'un objet dans une chaîne de caractère uniquement pour raison technique.

Et dans ce cas on n'a besoin que du trait `Debug`, qui lui se dérive.

On l'utilise avec `{:?}` ou `{ma_variable:?}`

```Rust
#[derive(Debug)]
struct Point2D {
  x: f32,
  y: f32
}

fn main(){
  let p = Point2D{ x: 0.0, y: 1.0};

  println!("Debug string for Point p: {p:?}");
}
// Debug string for Point p: Point2D { x: 0.0, y: 1.0 }
```

???

Logs, rapports d'erreurs, println! de débug

En pratique, en carricaturant pratiquement toutes vos structs auront un #[derive(Debug)]

---
## UTF-8

Les `String` et `&str` sont nécessairement des chaîne de caractère correctement encodée en UTF-8.

Si vous recevez des `Vec<u8>` ou `&[u8]` qui représentent de l'UTF-8 (sur le réseau par exemple), les convertir en `String` nécessite une validation.

```Rust
String::from_utf8(vec: Vec<u8>) -> Result<String, FromUtf8Error>
```

Il existe aussi d'autres types de chaines de caractères qui répondent à des usages spécifiques
- `&CStr`/`CString`: pour intéragir avec du C
- `OsStr` / `OsString`: pour intéragir avec l'OS
- `Path`/`PathBuf`: pour les chemins de fichier
- `Cow<'a, str>`: pour des chaînes de caractères copy-on-write

???

Il y a aussi le `from_utf8_lossy` qu'on a utilisé plus haut

Path et PathBuf sont des wrapper au dessus de OsStr avec des fonctionalités en plus

Je vous le dit en passant mais vous n'en aurez pas besoin ;)


---
template: inverse
## Gestion d'erreur
---
template: kevin_splash
## Les erreurs «irrécupérables»
## Les erreurs «gérables»

---
### Les erreurs «irrecupérables»: `panic`

```Rust
fn main() {
  panic!("Fait planter le programme");
}
```

```
thread 'main' panicked at src/main.rs:2:5:
Fait planter le programme
```

???

Si un panic se produit dans le thread principal

---
### Les erreurs «irrecupérables»: `panic`

Une `panic` se comporte comme une exception dans d'autre langages:
- elle est invisible dans la signature de la fonction
- elle se propage vers le haut de la pile d'appel et interrompt toute les fonctions
- ⚠️ elle s'arrête au niveau du thread où elle est déclenchée

???

Si un mutex est locké au moment ou elle se déclenche le mutex devient «empoisonné»

---
template: kevin_splash
## Ils servent à matérialiser des erreurs peu fréquentes mais susceptibles d'arriver dans presque toutes les fonctions.

???

Et pour lesquelles on ne veut pas polluer tous les types de retours des fonctions

---

### Exemples
Les tentative d'accès à un tableau au delà de la longueur du tableau

```Rust
let t = vec![1,2,3,6,14,21];
let x = t[6]; // panique
```
Les overflows lors d'opérations arithmétique (seulement en mode debug)

```Rust
// si je passe n = 250, il y a un overflow
fn add_35(n: u8) -> u8{
  n + 35
}
```

???
Et on ne veut pas poluer toutes les fonctions avec des `Result` pour autant
---

### La plupart des opérations susceptibles de `panic` ont un équivalent «faillible»

La [méthode `get`](https://doc.rust-lang.org/std/primitive.slice.html#method.get) pour accéder aux élements d'un tableau

```Rust
let t = vec![1,2,3,6,14,21];
let Some(x) = t.get(6) else{
  //do something if we don't find the element
};
```

La [methode `checked_add`](https://doc.rust-lang.org/std/primitive.u32.html#method.checked_add) pour additionner des entiers

```Rust
// si je passe n = 250, il y a un overflow et la fonction retourn None
fn add_35(n: u8) -> Option<u8>{
  n.check_add(35)
}
```

???

Mais si on devait faire que ça, ça serait chiant
---
template: inverse
# Les `panic` ne sont pas un mécanisme de gestion d'erreur normal en Rust

???

Il existe un mécanisme pour les attraper et en bloquer la propagation
pas fait pour remplacer des exceptions
fait pour éviter qu'un panic ne foute la merde dans du code natif qui appelle du code Rust

---
template: inverse
## Ils ne doivent se produire que s'il y a un BUG dans un programme

---

## Les erreurs gérables: `Result<T,E>`

En Rust, une fonction susceptible de retourner un erreur retourne un objet de type `Result<T,E>`.

Un `Result` est une `enum` a qui deux variants:

```Rust
enum Result<T,E>{
  Ok(T),
  Err(E),
}
```

???

On peut ainsi savoir quelle fonction est susceptible de générer une erreur ou non

C'est la définition de la stdlib

---
### Les erreurs

Le type d'erreur dans un result peut être n'importe quoi.

Souvent c'est une `enum`:

```Rust

enum MyError {
  InvalidPassword,
  UnknownUser,
  Timeout,
}

```
---
### Les erreurs

Le type d'erreur dans un result peut être n'importe quoi.

Ça peut-être une `struct`

```Rust
struct MyError{
  error_code: u32,
  error_message: String
}
```
---
### Les erreurs

Le type d'erreur dans un result peut être n'importe quoi.

Ou simplement une chaîne de caractère

```Rust
fn add_without_overflow(a: u32, b: u32) -> Result<u32, String> {
  let Some(sum) = a.checked_add(b) else {
    Err(format!("Trying to add {a} and {b} resulted in an overflow"));
  }
  Ok(sum)
}
```

---
### Les erreurs

Bonne pratique:
- une `enum`
- qui implémente le [trait `std::error::Error`](https://doc.rust-lang.org/std/error/trait.Error.html)

???

On va voir juste après comment on fait ça

---
template: inverse
## Comment gérer les erreurs

---
### Niveau 0: `unwrap()`

```Rust

fn get_something() -> Result<String, String> {
  todo!()
}

fn ma_fonction(){
  let string = get_something().unwrap(); 
}

```

`unwrap` transforme une erreur en `panic`

todo!()

---
### Niveau 0: `unwrap()`

C'est la version _“quick n'dirty”_ **pendant le développement**.

Vous ne livrez **jamais ça** en l'état.

???

Quand vous êtes en train d'itérer sur votre proto
Comme ça vous ne vous embêtez pas avec la gestion d'erreur
et vous avez le même type de fonctionnement que pratiquement tous les langages

---
### La gestion d'erreur correcte

On fait le tour des `unwrap()` qu'on a laissé et on avise:
- si c'est une situation qui ne doit pas se produire => `expect()` + justification
- si on peut agir pour compenser l'erreur => on le fait (retry, plan B, etc.)
- sinon, on remonte l'erreur au niveau du dessus

???

Cette étape est inédite dans les autres langages: 
puisque vous avez du mettre `unwrap()` partout, vous pouvez ensuite faire un ctrl-F 
et vous poser les bonnes question sur ce que vous devez faire de cette erreur
Là où dans la plupart des langages, les erreurs sont généralement invisibles à cause des exceptions

---

### Situation qui ne doit pas se produire

On sait qu'une situation ne se produira pas (sauf si jamais on a raté un bug ailleurs).

Exemples:

Vous savez qu'un tableau ne peut pas être vide à un moment donné

```Rust
let last_element = vec.last()
    .expect("the vector is not empty");
```

Vous savez qu'une chaîne de caractère est forcément un UUID valide

```Rust
let uuid = string.into_uui().expect("the string is always a valid uuid");
```

???

UUID: parce que ça vient de votre base de données
On parle de situation où ça ne sert à rien d'avoir une gestion d'erreur dédiée, puisque ça **ne peut pas** arriver

---

### Situation qui ne doit pas se produire

Autre cas d'utilisation: un mutex est «empoisonné».

```Rust
b.lock().expect("Mutex is poisoned");
```

???

Si un autre thread a paniqué pendant qu'il détenait le lock sur le mutex.
Ce n'est pas censé arriver puisque vous n'êtes pas censé avoir de panic dans vos autres threads…
C'est utile pour faire des systèmes critiques haute disponibilité, mais pas pour vous!

---
### On peut agir pour compenser l'erreur

Dans certains cas, il y a un moyen simple d'agit pour compenser l'erreur:
- on essaye de renvoyer la requête
- on affiche un message d'erreur à l'utilisateur en lui demandant de corriger son erreur
- on envoie la requête à un serveur de _“failover”_
- utiliser une valeur par défaut
- on cherche le fichier à un autre endroit
- on essaie un autre format de désérialisation
- etc.

???

---

### On peut agir pour compenser l'erreur

Exemple: utiliser une valeur par défaut

```Rust
fn main(){
  let response = match fetch_something() {
    Ok(res) => res,
    Err(err) => {
      eprintln!("Could not get a response from the server, using default value");
      String::from("This is the default value")
    }
  }
}

```
---

### On peut agir pour compenser l'erreur

On peut écrire ça plus simplement:

```Rust
fn main(){
  let Ok(response) = fetch_something() else {
      eprintln!("Could not get a response from the server, using default value");
      String::from("This is the default value")
  };
}
```

ou encore (si on ne veut pas afficher de logs d'erreur)

```Rust
fn main(){
  let response = fetch_something().unwrap_or(String::from("This is the default value"));
}
```

[https://jethrogb.github.io/rust-combinators/](https://jethrogb.github.io/rust-combinators/)

???

`eprintln!` c'est comme `println` mais ça affiche dans stderr et pas stdout

C'est une mine d'or

---
### Remonter l'erreur

Dans la majorité des cas, la fonction où se produit l'erreur ne sait pas quelle est l'opération de compensation à mener.

???

Le module qui gère l'accès au réseau ne sais pas comment afficher une erreur à l'utilisateur pour lui dire de vérifier sa connexion internet.
---
### Remonter l'erreur

```Rust
fn ma_fonction() {
  let string = get_something().unwrap(); 
}
```

devient

```Rust
fn ma_fonction() -> Result<(), String>{
  let string = get_something()?; // note the `?`
}
```

???

Result<(), E> veut dire que la fonction n'a pas de valeur de retour, mais qu'elle a une erreur

---
### Remonter l'erreur

Le symbole `?` est un «sucre syntaxique» pour:

```Rust
fn ma_fonction() -> Result<(), String>{
  
  let string = match get_something(){
    Ok(string) => string,
    Err(error) => return Err(error.into()),
  };
}
```

---
class: inverse
## Comment faire s'il y a plusieurs types d'erreurs

```Rust

fn foo()-> Result<String, FooError>{
  todo!();
}
fn bar(s: &str)-> Result<String, BarError>{
  todo!();
}

fn ma_fonction() -> Result<String, ??? >{ // Qu'est-ce qu'on met dans le type d'erreur ici
  let first_string = foo()?;
  let second_string = bar(&first_string)?;
}
```

???

Des idées?

---
### Conversion d'erreur

Le symbole `?` effectue une conversion automatique de l'erreur source vers l'erreur de destination, via le trait `Into`.

C'est à dire:

```Rust

enum OuterError{
  FooErr,
  BarErr,
};

impl Into<OuterError> for FooError {
    fn into(self) -> OuterError {
        OuterError::FooErr
    }
}

impl Into<OuterError> for BarError {
    fn into(self) -> OuterError {
        OuterError::BarErr
    }
}


fn foo()-> Result<String, FooError>{
  todo!();
}
fn bar(s: &str)-> Result<String, BarError>{
  todo!();
}

fn ma_fonction() -> Result<String, OuterError >{ 
  let first_string = foo()?;
  let second_string = bar(&first_string)?;
}

```
???

En pratique on n'implémente pas `Into` nous-même: 
- orphan rule + trait `From`

---
### Conversion d'erreur

```Rust

enum OuterError{
  FooErr,
  BarErr,
};

impl From<FooError> for OuterError {
    fn into(err: FooError) -> OuterError {
        OuterError::FooErr
    }
}

impl From<BarError> for OuterError {
    fn into(err: FooError) -> OuterError {
        OuterError::BarErr
    }
}

fn foo()-> Result<String, FooError>{
  todo!();
}
fn bar(s: &str)-> Result<String, BarError>{
  todo!();
}

fn ma_fonction() -> Result<String, OuterError >{ 
  let first_string = foo()?;
  let second_string = bar(&first_string)?;
}

```
???

Comme c'est un peu chiant on utilise this_error pour le faire à notre place

 et surtout on utilise une lib pour le faire comme on veut
---
### Conversion d'erreur automatique

La [crate `thiserror`](https://lib.rs/crates/thiserror) permet d'implémenter les conversions automatiquement!

```bash
cargo add thiserror
```

```Rust
use thiserror::Error;

#[derive(Error, Debug)]
pub enum OuterError {
    #[error("An error occured in function foo")]
    FooErr(#[from] FooError),
    #[error("An error occured in function bar")]
    FooErr(#[from] BarError),
}
```

???
Ça implémente la conversion + les traits `Display` et `Error`

---
.left-column[
  ## TP (suite)
]
.right-column[
Implémenter la gestion d'erreur
]

???

---
template: inverse
# Retour sur l'ownership et le borrowing

???

Maintenant qu'on a vu des trucs plus appliqués, on peut repartir un peu dans les concepts

---
### Moving out of a struct

Si on prend l'_“ownership”_ d'un champs d'une structure, on bloque l'_“ownership”_ de toute la structure.

```Rust
#[derive(Debug)]
struct Player {
  name: String,
  age: u8,
}

let steph = Player{name: String::from("Curry"), age: 36};
let name = steph.name;

println!("{:?}", steph); // ERROR: borrow of partially moved value: `steph`
```

???

On peut toujours prendre des champs individuels, au sein de la fonction, mais la structure elle-même est bloquée

---
### Moving out of a struct

Sauf si le type en question implémente `Copy`

```Rust
#[derive(Debug)]
struct Player {
  name: String,
  age: u8,
}

let steph = Player{name: String::from("Curry"), age: 36};
let age = steph.age;

println!("{:?}", steph); // Ça marche
```

???

Ici ça marche, parce qu'on a just **copié** l'age, on ne l'a pas **move**

---
### Moving out a reference

Pour la même raison, on ne peut pas **prendre** un champs d'une référence à une struct

```Rust
fn toto(player: &Player){
  let name = player.name; // cannot move out of `player.name` which is behind a shared reference
}
```

On peut simplement prendre une référence à cet objet

```Rust
fn toto(player: &Player){
  let name = &player.name;
}
```

???

Est-ce qu'il n'y a pas une exeption à cette règle ?


---
### Moving out a reference

Sauf, encore une fois, si le type implémente Copy

```Rust
fn toto(player: &Player){
  let age = player.age; // l'age est simplement copié, donc ça marche
}
```

---
### Le compilateur est d'une grande aide

Si on reprend l'exemple ci-dessus:

```Rust
fn toto(player: &Player){
  let name = player.name;
}
```
l'erreur renvoyé par le compilateur est celle-ci

```
error[E0507]: cannot move out of `player.name` which is behind a shared reference
  --> src/main.rs:17:14
   |
17 |   let name = player.name;
   |              ^^^^^^^^^^^ move occurs because `player.name` has type `String`, which does not implement the `Copy` trait
   |
help: consider borrowing here
   |
17 |   let name = &player.name;
```

???

Le compilateur est un assistant virtuel
les erreurs sont généralement de grande qualité
lisez-les!

---
template: inverse
## Arc/Rc, quelle différence

???

Si vous vous souvenez, plus tôt je vous ai dit qu'il y avait 2 types de reference counting smart pointer
c'est quoi la différence entre les deux ?
Arc est thread-safe parce que le compteur est atomique
Et si Rc n'est pas thread-safe, qu'est-ce qui se passe si on l'utilise dans un context multi-thread?

---
### Faisons le test

```Rust
use std::rc::Rc;
use std::thread;


fn main(){
    let p = Rc::new(String::from("Toto"));

    let p2 = p.clone();
    thread::spawn(move ||{
        println!("{}", &p2)
    });
}
```

```
error[E0277]: `Rc<String>` cannot be sent between threads safely
```

---
### Plus précisemment

```
error[E0277]: `Rc<String>` cannot be sent between threads safely
   --> src/main.rs:9:19
    |
9   |       thread::spawn(move ||{
    |       ------------- ^------
    |       |             |
    |  _____|_____________within this `{closure@src/main.rs:9:19: 9:26}`
    | |     |
    | |     required by a bound introduced by this call
10  | |         println!("{}", &p2)
11  | |     });
    | |_____^ `Rc<String>` cannot be sent between threads safely
    |
    = help: within `{closure@src/main.rs:9:19: 9:26}`, the trait `Send` is not implemented for `Rc<String>`
```

---
## Les traits `Send` et `Sync`

Pour permettre au compilateur d'assurer que le code qu'on écrit est bien thread-safe.
Rust dispose de deux `trait`s:
- `Send`
- et `Sync`

---
## Send

Permet de dire: «cet objet peut être transféré d'un thread à un autre»
**Presque tous les objets sont `Send` en Rust**

Mais pas `std::rc::Rc`.

???

Est-ce que `Arc` est Send ?
---
### Send

```Rust
use std::sync::Arc;
use std::thread;


fn main(){
    let p = Arc::new(String::from("Toto"));

    let p2 = p.clone();
    thread::spawn(move ||{
        println!("{}", &p2)
    });
}
```

---
### Vraiment ?

```Rust
use std::sync::Arc;
use std::thread;


fn main(){
    let c = RefCell::new(String::from("Toto"));
    let p = Arc::new(c);
    let p2 = p.clone();
    thread::spawn(move ||{
        println!("{}", &p2)
    });
}
```

???

Qu'est-ce qui va se passer ici ?

---
## `Arc` isn't always `Send`

```
error[E0277]: `RefCell<String>` cannot be shared between threads safely
   --> src/main.rs:11:17
    |
11  |           s.spawn(|| {
    |  ___________-----_^
    | |           |
    | |           required by a bound introduced by this call
12  | |             println!("{}", p.borrow())
13  | |         });
    | |_________^ `RefCell<String>` cannot be shared between threads safely
    |
    = help: the trait `Sync` is not implemented for `RefCell<String>`, which is required by `{closure@src/main.rs:11:17: 11:19}: Send`
    = note: if you want to do aliasing and mutation between multiple threads, use `std::sync::RwLock` instead
```

---
## `Sync`

Le trait `Sync` est là pour dire: «partager une référence à cet objet entre plusieurs thread est safe»

**Presque tous les objets sont `Sync` en Rust**

Mais pas `std::cell::RefCell`.

---
### Lien entre `Sync` et `Send`

`Arc<T>` est `Send` si et seulement si `T: Sync`.
`&T` est `Send` si et seulement si `T: Sync`.

---
### Locks are `Sync`

`Mutex` et `RWLock` sont `Sync`.

Et le message d'erreur vous aide:
```
error[E0277]: `RefCell<String>` cannot be shared between threads safely
   --> src/main.rs:11:17
    |
11  |           s.spawn(|| {
    |  ___________-----_^
    | |           |
    | |           required by a bound introduced by this call
12  | |             println!("{}", p.borrow())
13  | |         });
    | |_________^ `RefCell<String>` cannot be shared between threads safely
    |
    = help: the trait `Sync` is not implemented for `RefCell<String>`, which is required by `{closure@src/main.rs:11:17: 11:19}: Send`
    = note: if you want to do aliasing and mutation between multiple threads, use `std::sync::RwLock` instead
```

---
template: inverse
## Des question ?

---
templace: inverse
## Lifetimes
???

Source de confusion fréquente

---
### Lifetime des références

Toute les références ont une lifetime associée, qui est la durée de vie de la variable vers laquelle elle pointe.

```Rust
fn main(){
  let a = 27;
  {
    let x = 42;
  
    let ref_x = &x;
    let ref_a = &a;
  }// la lifetime de ref_x se termine ici
}// la lifetime de ref_a se termine là
```
---
### Lifetime dans des types

Comme on peut avoir des références comme champs d'une `struct` ou variante d'un `enum`, les `struct` et les `enum` peuvent aussi avoir une lifetime.

Il faut la matérialiser dans la déclaration de la `struct`.

```Rust
struct BlaBla<'a>{
  parole: &'a str
}
```

Et recursivement

```Rust
enum Activities<'a>{
  Boulot,
  Dodo,
  Blabla(BlaBla<'a>),
}
```
???

le 'a est un paramètre générique, il ne désigne rien de concret

---
### Tous les types ont une lifetime

En réalité, tous les types ont une lifetime.

Elle est simplement *illimitée* si le type ne contient pas de références.

---
### “Lifetime bound”

Certaines fonctions ont une contrainte (“bound”) sur la lifetime des paramètres qu'elles acceptent.

Par exemple la fonction `thread::spawn`.

```Rust
pub fn spawn<F, T>(f: F) -> JoinHandle<T>
where
    F: FnOnce() -> T + Send + 'static,
    T: Send + 'static,
```

Ici `'static` veut simplement dire que l'objet en question doit avoir une lifetime illimitée.

???

`'static` devrait s'appeler `'unbounded`

---
### La lifetime `'static`

Employé dans une contrainte `'static` = «lifetime illimitée».
En général ça implique:
- qu'on passe l'ownership
- et que l'objet lui-même n'a pas une lifetime limitée par un de ses composants

Mais il existe des références qui ont une lifetime illimitée.

???
Des idées

---
### Les objets statiques

les “string litterals”
```Rust
let s: &'static = "message";
```

les “variables” globales (qui sont en fait constantes)

```Rust
static FOO: [i32; 5] = [1, 2, 3, 4, 5];
```

Les objets «leakés»

```Rust
let s = String::from("I will live forever");
let static_string : &'static mut String = Box::leak(s);
```

---
## Les erreurs liés à `'static`

```Rust
use std::sync::Arc;
use std::thread;
use std::cell::RefCell;

fn main(){
    let c = String::from("Toto");
    thread::spawn(|| {
        println!("{}", &c)
    });
}
```

```
error[E0373]: closure may outlive the current function, but it borrows `c`, which is owned by the current function
 --> src/main.rs:7:19
  |
7 |     thread::spawn(|| {
  |                   ^^ may outlive borrowed value `c`
8 |         println!("{}", &c)
  |                         - `c` is borrowed here
  |
note: function requires argument type to outlive `'static`
```

???

Qu'est-ce qui se passe ici ?

La raison pour laquelle le truc doit avoir une lifetime illimitée ce n'est pour vous faire chier

C'est parce que Rust doit être sur que la variable ne sera pas désallouée avant la fin du thread

TODO ajouter un lien vers l'example ou on utilse thread::scope

`'static` apparait presque qu'uniquement quand il y a des histoires de multithreading

---
## Arc est `'static`

La raison pour laquelle on utilise `Arc` quand on fait un `thread::spawn` c'est que `Arc` a une lifetime illimitée.
Comme s'il possédait l'objet tout seul.

???

C'est un pointeur avec une lifetime illimitée

---
template: inverse
## Des question ?

---
template: inverse
# Les itérateurs

---

## Les itérateurs

Comme la plupart des langages récents, Rust a des itérateurs 

Ça permet d'itérer avec un boucle `for` sur des collections diverse

```Rust
let x = vec![1,2,3,4];
for i in x {
  println!("{i}");
}
```

???

Ça marche sur les vecteurs, les Hashmaps, les tableaux, et tout un tas d'objets qui implémentent la bonne iterface.

---

## Les combinateurs

```Rust
vec![1, 2, 3, 4, 5, 6, 7, 8]
    .iter()
    .map(|x| x + 3)
    .fold(0, |x, y| x + y)
```

[https://jethrogb.github.io/rust-combinators/](https://jethrogb.github.io/rust-combinators/)

???

Vous avez tous déjà vu ce type d'opérations dans d'autres langages?

fold est l'équivalent d'un `.reduce` en Javascript.

---

### Les particularités

```Rust
let v: u32 = vec![1,2,3];

v.iter(); // un itérateur de &u32 
v.iter_mut(); // itérateur de &mut u32
v.into_iter(); // iterateur de u32, prend l'ownership de tout le tableau
```

???

`IntoIterator` et `Iterator`

---

### Passer d'un iterateur à une collection

`.collect`

```Rust
let v = vec![("Georges", 73u32), ("Jean-Michel", 54), ("Guillaume", 34)];

let h: HashMap<&'static str, u32> = vec.into_iter().collect();
```
???
Ça ne marche que si la conversion a un sens.

---
template: inverse
## Retour sur la pile et le tas: `Sized`

???

Qu'est-ce que vous avez retenu sur la stack et le tas?

---
## La pile et la taille

L'allocation sur la pile (stack) => taille connue à la compilation*

Pour tout ce qui de taille variable ou inconnue à la compilation, il faut stocker ça sur la pile (stack).

???

Encore une fois, ce n'est pas strictement vrai (alloca / VLA), mais en Rust ça l'est

---
## `Sized`

Ce qui est de taille connue a le trait `Sized`.

Presque tout en Rust est `Sized`

???

Une idée des exceptions ?
---
## `!Sized`

Ne sont pas `Sized`:
- les slices : `[u8]`
- les string slices : `str`
- les _“trait objects”_ : `dyn MonTrait`

Ce qui n'est pas `Sized` ne peut pas être stocké dans une variable directment.

Il faut forcément que ça passe par un «pointeur».
- `&[u8]` est `Sized` (sa taille vaut 2 fois la taille d'un `usize`)


???
Les variables sont stockées dans la stack

---

```Rust
use std::sync::Arc;

fn main(){
    dbg!(std::mem::size_of::<usize>());
    dbg!(std::mem::size_of::<&str>());
    dbg!(std::mem::size_of::<&[u8]>());
    dbg!(std::mem::size_of::<Box<u8>>());
    dbg!(std::mem::size_of::<Arc<u8>>());
    dbg!(std::mem::size_of::<Vec<u8>>());
    dbg!(std::mem::size_of::<Arc<str>>());
    dbg!(std::mem::size_of::<Box<str>>());
}
```
---

```
[src/main.rs:4:5] std::mem::size_of::<usize>() = 8
[src/main.rs:5:5] std::mem::size_of::<&str>() = 16
[src/main.rs:6:5] std::mem::size_of::<&[u8]>() = 16
[src/main.rs:7:5] std::mem::size_of::<Box<u8>>() = 8
[src/main.rs:8:5] std::mem::size_of::<Arc<u8>>() = 8
[src/main.rs:9:5] std::mem::size_of::<Vec<u8>>() = 24
[src/main.rs:10:5] std::mem::size_of::<Arc<str>>() = 16
[src/main.rs:11:5] std::mem::size_of::<Box<str>>() = 16
```
