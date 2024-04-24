name: inverse
class: center, middle, inverse
---
name: kevin_splash
class: center, middle, inverse
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
[liste des projets](TODO) et le [tableur de formation des groupes](https://lite.framacalc.org/vjzts0h8lk-a7cx)
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
- le schisme entre les languages natifs et les languages «managés»
- le problème du multithreading
]

---


.left-column[
  ## Deux problèmes
  ### Langage natif vs language managé
]
.right-column[
### Langages natifs
- historiquement C et C++
- le développeur gère sa mémoire lui-même
- résultat: [70% des failles de sécurité](https://www.chromium.org/Home/chromium-security/memory-safety/) viennent d'une [mauvaise gestion de la mémoire](https://msrc.microsoft.com/blog/2019/07/a-proactive-approach-to-more-secure-code/)
]
???

le terme «langage managé» vient de Microsoft

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
template: kevin_splash
## Rust

- Créé en 2006 par Graydon Hoare, pour résoudre le problème du multithreading.
- À l'origine il avait un “_garbage collector_”
- puis l'équipe s'est rendu compte qu'ils pouvaient se débarrasser du GC

---
template: kevin_splash
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
template: kevin_splash
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
template: inverse
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

Idem si copier l'objet implique une opération qui n'est pas seulement une copie bit à bit.

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

On a besoin d'un `Arc` ici, parce qu'on ne sait pas quel thread se terminera en premier.
On ne sais donc pas lequel doit avoir le droit de libérer la mémoire allouée pour la String
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
Maintenant on veut pouvoir prendre argument en entrée du programme (en CLI)
Et envoyer celui-ci à la machine distante lors de chaque connection.

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
On veut maintenant que notre programme compte le nombre d'octets qu'il a reçu sur le réseau, toute connection confondue
Et écrire dans la console ce nombre toute les 3 secondes

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


