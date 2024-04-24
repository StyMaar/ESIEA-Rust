# Introduction to the Rust syntax

_note_ this document took **heavy** inspiration (with lots of copy-paste) from Fasterthanlime's [Half hour to learn Rust](https://fasterthanli.me/articles/a-half-hour-to-learn-rust).

## Contents

*   [Variable bindings](#variable-bindings)
    *   [The `let` keyword](#the-let-keyword)
    *   [Uninitialized variables](#uninitialized-variables)
    *   [Type annotation](#type-annotation)
    *   [Statements](#statements)
    *   [Throwing values away](#throwing-values-away)
    *   [Shadowing bindings](#shadowing-bindings)
    *   [Immutability](#immutability)
*   [Control flow](#control-flow)
    *   [If/else](#if-else)
    *   [Match](#match)
    *   [Loops, iterators](#loops-iterators)
    *   [While loops](#while-loops)
    *   [Loop loops](#loop-loops)
    *   [For loops](#for-loops)
    *   [Ranges](#ranges)
*   [Types](#types)
    *   [Base types](#base-types)
    *   [Structs](#structs)
    *   [Struct literal assignment shorthand](#struct-literal-assignment-shorthand)
    *   [Struct update syntax](#struct-update-syntax)
    *   [Enums (sum types)](#enums-sum-types)
    *   [Tuples](#tuples)
*   [Functions](#functions)
    *   [Passing argument by value or by reference](#values-and-reference)
    *   [Dereferencing](#dereferencing)
    *   [Methods](#methods)
    *   [The `Self` type](#the-self-type)
*   [Blocks](#blocks)
    *   [Blocks are expressions](#blocks-are-expressions)
    *   [Implicit return](#implicit-return)
    *   [Everything is an expression](#everything-is-an-expression)
*   [Patterns and destructuring](#patterns-and-destructuring)
    *   [Destructuring tuples](#destructuring-tuples)
    *   [Destructuring structs](#destructuring-structs)
    *   [Destructuring with `if let`](#destructuring-with-if-let)
    *   [Match arms are patterns](#match-arms-are-patterns)
*   [Macros](#macros)
    *   [The `println!` and `format!` macros](#the-println-and-format-macros)
    *   [The `panic!` macro](#the-panic-macro)
    *   [Functions that panic](#functions-that-panic)
*   [Generics](#generics)
    *   [Generic structs](#generic-structs)
    *   [Generic functions](#generic-functions)
    *   [Traits](#traits)
    *   [Type parameter constraints (trait bounds)](#type-parameter-constraints-trait-bounds)
*   [Modules](#modules)
    *   [`use` syntax](#use-syntax)
    *   [Types are namespaces too](#types-are-namespaces-too)
    *   [The libstd prelude](#the-libstd-prelude)


<a name="variable-bindings"></a>Variable bindings
---------------------------------------

### <a name="the-let-keyword"></a>The `let` keyword

`let` introduces a variable binding:


```Rust

let x; // declare "x"
x = 42; // assign 42 to "x"
```

This can also be written as a single line:

```Rust
let x = 42;
```

### <a name="uninitialized-variables"></a>Uninitialized variables

If you declare a name and initialize it later, the compiler will prevent you from using it before it's initialized.

```Rust
let x;
foobar(x); // error:-uninitialized variable: `x`
x = 42;
```

However, doing this is completely fine:

```Rust
let x;
x = 42;
foobar(x); // the type of `x` will be inferred from here
```


### <a name="type-annotation"></a>Type annotation

Rust performs **type inference**, so you don't usually have to spell out the type of a variable explicitly, but you can specify it explicitly if you want, using `:`, that's a type annotation:

```Rust
let x: i32; // `i32` is a signed 32-bit integer
x = 42;
```

This can also be written as a single line:

```Rust
let x: i32 = 42;
```


### <a name="statements"></a>Statements

The semi-colon marks the end of a statement:

```Rust
let x = 3;
let y = 5;
let z = y + x;
```

Which means statements can span multiple lines:

```Rust

let x = vec![1, 2, 3, 4, 5, 6, 7, 8]
    .iter()
    .map(|x| x + 3)
    .fold(0, |x, y| x + y); // (We'll go over what those actually mean later).
```


### <a name="throwing-values-away"></a>Throwing values away

The underscore `_` is a special name - or rather, a "lack of name". It basically means to throw away something:

```Rust
// this does *nothing* because 42 is a constant
let _ = 42;

// this calls `get_thing` but throws away its result
let _ = get_thing();
```

Names that _start_ with an underscore are regular names, it's just that the **compiler won't warn** about them being unused:

```Rust
// we may use `_x` eventually, but our code is a work-in-progress
// and we just wanted to get rid of a compiler warning for now.
let _x = 42;
```

### <a name="shadowing-bindings"></a>Shadowing bindings

Separate bindings with the same name can be introduced - you can _shadow_ a variable binding:

```Rust
let x = 13;
let x = x + 3;
// using `x` after that line only refers to the second `x`
```
### <a name="immutability"></a>Immutability

Variable bindings are immutable by default, which means they cannot be assigned to:

```Rust
fn main() {
    let n = 17;
    n = 27; // error: cannot assign twice to immutable variable `n`
}
```

And also that their interior can't be mutated::

```Rust
fn main() {
    let n = Number {
        odd: true,
        value: 17,
    };
    n.odd = false; // error: cannot assign to `n.odd`,
                   // as `n` is not declared to be mutable
}
```

`mut` makes a variable binding mutable:

```Rust
fn main() {
    let mut n = Number {
        odd: true,
        value: 17,
    };
    n.value = 19; // all good
}
```

<a name="control-flow"></a>Control flow
-----------------------------

### <a name="if-else"></a>If/else

Like all programming languages, Rust has `if` conditions. But unlike most other languages, there's no parentheses around the condition:

```Rust

if is_valid {
    // do something
}else{
    // do something else
}
```

If/else can be chained together without a particular “elseif” keyword:

```Rust

if is_blue {

}else if is_green {

}else if is_red {

}else{

}
```

### <a name="match"></a>Match

For complex matching, Rust has the `match` keyword, which works a bit like `switch` in other languages:

```Rust

match name {
    "Alice" => {
        println!("Hey, Alice what's up ?");
    },
    "Bob" => {
        println!("Oh no it's Bob, let's move");
    },
    _ => {
        println!("Hello, nice to meet you");
    }
}

```

It works a bit differently than switch in most languages though.

First of all there's no “fall-through” between arms, take this JavaScript example:

```JavaScript

switch(number){
        case 0:
            console.log("It's case number 0");
            // Oh no, we forgot the `break` statement here
        case 1:
            console.log("It's case number 1"); // Or it could be case n°0 since there's no `break` in case zero
            break;
   }
```

If you want multiple cases to go to the same arm, you need to make it explicit with a `|` symbol:

```Rust
match sport {
    "Football" | "Rugby" => {
        println!("We play on a grass field");
    },
    "Basketball" => {
        println!("We play on parquet floors");
    },
    _ => {
        println!("I don't know where other sports play");
    }
}
```

Another difference with `switch` from other languages is the exhaustiveness requirement: A `match` has to be exhaustive: at least one arm needs to match.

```Rust
match n {
    1 => println!("One"),
    2 => println!("Two"), 
    // error: non-exhaustive patterns:`0` and `>3` not covered 
}
```

The following code fixes the error, by assigning the value that did not match the previous arm to a new variable called `value`:

```Rust
match n {
    1 => println!("One"),
    2 => println!("Two"),
    value => println!("{}", value),
}
```

If you don't need the value, `_` can be used as the "catch-all" pattern, like in the examples above.

### <a name="loops-iterators"></a>Loops, iterators

Rust has three different kinds of loops.

### <a name="while-loops"></a>While loops

While loops are pretty straightfoward, it's just the `while` keyword, followed by a boolean condition not surounded in parentheses (exactly like `if`):

```Rust
while condition {
    // do something repeatedly
}
```

Like with most programming languages, you can either skip the current round of the loop with the `continue` keyword, or break out of the loop entirely with the `break` keyword.


### <a name="loop-loops"></a>Loop loops

For the special situation where the program is supposed to loop forever, with no particular condition, there's the `loop` keyword.

```Rust

loop {
    // do something
}

```

Is exactly equivalent to 

```Rust

while true {

}

```

### <a name="for-loops"></a>For loops

The most common type of loops is the `for` loop.

Unlike most programming languages out there, Rust only accepts a single syntax for `for` loop, which is based on iterators.

Anything that is iterable can be used in a `for` loop.

For instance, here's how it works when iterating over a vector:

```Rust
fn main() {
    for i in vec![52, 49, 21] { 
        println!("I like the number {}", i); 
    }
}
```

### <a name="ranges"></a>Ranges

If you want to iterate between `0` and `n`, you need to use ranges.

```Rust

for i in 0..n {

}

```

There are two kinds of ranges, **exclusive** ranges `a..b` which go from `a` to `b-1`.

And **inclusive** ranges `a..=b` which go from `a` to `b` included. 

<a name="types"></a>Types
-------------------------

### <a name="base-types"></a>Base types

Rust has a bunch of basic types.

Different size of _signed_ integer:

- `i8`
- `i16`
- `i32`
- `i64`

Also _unsigned_ integer:

- `u8`
- `u16`
- `u32`
- `u64`

It also has pointer-sized integer, whose specific type depends on the platform you compile for:

- `isize`
- `usize`

If you're compiling for a 32 bits platform, then usize is going to be 32 bits long, like u32, whereas if you are targeting a 64-bits plateform then it's going to be 64 bits long.

`isize` is not very common, but `usize` is the type to use for indexing (like indexing over an array, a string or a vector).

You can cast from one type to another with the `as` keyword. But be careful, overflows can happen when you do so.

```Rust
fn main(){
    let a: i8 = 4;
    let b = a as usize; // b is equal to 4, but stored as a usize

    let x: u8 = 129;
    let y = b as i8; // y == -127
}
```

Rust also has floating points numbers, in two different precisions:

- `f32`
- `f64`

Boolean: `bool` that can be either `true` or `false`.

Characters: `char` which are written between simple quotes (`'`)

```Rust
let v = 'v';
```

And strings, that come in two different shapes:

- `String`, that is allocated on the heap and growable, akin to Java's StringBuilder
- `str`, also called “string slice”, whose size is fixed, akin to Java's String. `str` can almost never be used directly, and will almost always come behind a reference: `&str` (see [below](#values-and-reference)).

String _litterals_ are being written between double quotes (`"`) and they are references to a string slice:

```Rust
let hello_world: &str = "Hello, World!";
```


### <a name="structs"></a>Structs

Structs are the equivalent of classes in other langages, they are declared with the `struct` keyword:

Rust code
```Rust
struct Vec2 {
    x: f64, // 64-bit floating point, aka "double precision"
    y: f64,
}
```

They can be initialized using struct literals:

```Rust
let v1 = Vec2 { x: 1.0, y: 3.0 };
let v2 = Vec2 { y: 2.0, x: 4.0 };
// the order does not matter, only the names do
```

You can access to the fields of a struct with a dot `.`, like in many other programming languages:

```Rust
v.x 
```

By convention, in Rust structs, and every other _types_ are spelled out in _PascalCase_ (like camelCase, but with an upper case letter at the begining)

### <a name="struct-literal-assignment-shorthand"></a>Struct literal assignment shorthand

Speaking of: in a struct literal, when a field is set to a variable binding of the same name:

```Rust
let p = Person { name: name };
```

It can be shortened like this:

```Rust
let p = Person { name };
```

Tools like [clippy](https://doc.rust-lang.org/stable/clippy/usage.html) will suggest making those changes, and even apply the fix programmatically if you let it.


### <a name="struct-update-syntax"></a>Struct update syntax

There is a shortcut for initializing the _rest of the fields_ from another struct:

```Rust
let v3 = Vec2 {
    x: 14.0,
    ..v2
};
```

This is called "struct update syntax", can only happen in last position, and cannot be followed by a comma.

Note that _the rest of the fields_ can mean _all the fields_:

```Rust
let v4 = Vec2 { ..v3 };
```


### <a name="tuples"></a>Tuples

Rust has tuples, which you can think of as "fixed-length collections of values of different types". Tuples are kind of “anonymous structs” were fields are also anonymous.

```Rust
let pair = ('a', 17);
pair.0; // this is 'a'
pair.1; // this is 17
```

If we really wanted to annotate the type of `pair`, we would write:

```Rust
let pair: (char, i32) = ('a', 17);
```

There's also the concept of _“Tuple Struct”_, which are _named_, like structs, but fields are anonymous like tuples. They are defined with the `struct` keyword, but uses parentheses like normal tuples.

```Rust
struct Foo(u32, u32);
```

### <a name="enums-sum-types"></a>Enums (sum types)

When you want to express `alternatives`, you can use enums.

```Rust
enum Side {
    Left,
    Right,
}

fn name_side(side: &Side){
    match side {
        Side::Left => println!("Le côté gauche"),
        Side::Right => prinln!("Le côté droit"),
    }
}
```

Enums can also contain data, and the variant behaves like a struct or a tuple struct.

```Rust

enum Flavor{
    Vanilla,
    Chocolate,
    Strawberry,
    Lemon,
}

enum IceCream{
    Simple(Flavor),
    Double(Flavor, Flavor),
    Triple{
        first_scoop: Flavor,
        second_scoop: Flavor,
        third_scoop: Flavor,
    },
}

```

<a name="functions"></a>Functions
-----------------------

`fn` declares a function.

Here's a void function:

```Rust
fn greet() {
    println!("Hi there!");
}
```

Now here's a function that takes an input parameter

```Rust
fn greet_someone(name: &str) {
    println!("Hi {name}!");
}
```

And here's a function that returns a 32-bit signed integer. The arrow indicates its return type:

```Rust
fn fair_dice_roll() -> i32 {
    4
}
```

For functions parameters and return value, the type must be written down explicitly, there's no type inference here.

And by convention, in Rust functions are spelled with _snake_case_: It's `fair_dice_roll()` not `fairDiceRoll()`.

### <a name="values-and-reference"></a>Passing argument by value or by reference

Unlike some other programming languages, Rust doesn't have an implicit “this kinds of things pass by values and these other passes by reference”, it must be spelled in the type of the parameter. References are written using the `&` symbol.

```Rust

fn by_value(i: u32){
    // do something with i
}

fn by_reference(i: &u32){
    // do something with i
}
```

Rust actually has two types of references: basic references `&` which are read-only, and mutable references `&mut` which allow mutations:

```Rust
fn by_ref(i: &u32){
    // you can only **read** i
}

fn by_mut_ref(i: &mut u32){
    // you can **both read and write** to i
}
```

When calling a function that requires a parameter passed by reference, you need to take a reference to the variable you're calling the function with:

```Rust

let x = 43;

by_ref(&x);
```
 
And to take a mutable reference to a variable, your variable needs to be mutable as well:

```Rust
let x = 43;

by_ref_mut(&mut x); // error: x needs to be mutable

let mut y = 34;

by_ref_mut(&mut y);

```

### <a name="dereferencing"></a>Dereferencing

To access an item behind a reference, you need to **dereference** it, with the `*` symbol:

```Rust
fn foo(i: &mut u32){
    *i = 42; // updates the value pointed by the reference to 42
}
```

### <a name="methods"></a>Methods

You can declare methods on any of the types you've defined, be it a struct, an enum or a tupple struct (but not regular tuples, because you don't “define” them).

As with most programming languages, there're two kinds of methods: “regular methods”, that are being run on the object itself, and what object oriented programming languages call “static methods” which are methods of the type itself. “Regular methods” are called with a dot (`.`) on the object whereas “static methods” are called with a double colon (`::`) on the type:

```Rust

struct MyType{
    // fields here
}

// we'll see how we implement the methods later

fn toto(){

    let t = MyType{
        // fields here
    };

    t.method(); // this is a “regular method” call on the object `t`

    MyType::static_method(); // this is a call to a “static method”
}

```

Methods for a type are declared in an `impl` block:

```Rust 

impl MyType{

}

```

You can declare methods on your own types, but not on external types.


```Rust
impl u8 { // error: you can't implement methods on a foreign type

}
```

A “static method” is just a regular function defined in a `impl` block.

```Rust 

impl MyType{
    // this method return a newly created MyType object
    // there's no specific constructor in Rust, you just create a static method called  `new()` (or any name, really)
    fn new() -> MyType{
        MyType{
            // fields here
        }
    }
}

fn toto(){
    let t = MyType::new();
}

```

A “regular method” is a function with a special `self` parameter as first parameter

```Rust

struct Person{
    height: f32,
    weight: f32,
}

impl Person {
    fn body_mass_index(&self) -> f32{
        self.weight / (self.height*self.height)
    }
}

fn main(){

    let victor = Person {
        height: 2.24,
        weight: 95.,
    };

    let bmi = victor.body_mass_index();

}
```

Like any parameters of any function, the `self` parameter can be passed by value, by reference or by mutable reference.

### <a name="the-self-type"></a>The `Self` type

An `impl` block is always _for_ a type, so, inside that block, `Self` means that type:

```Rust
struct ComplexNumper{
    real: f64,
    imaginary: f64,
}

impl ComplexNumber {
    fn neg(self) -> Self { // Self represents ComplexNumber here
        Self {
            real: -self.real,
            imaginary: -self.imaginary,
        }
    }
}
```


<a name="blocks"></a>Blocks
-----------------

A pair of brackets declares a block, which has its own scope:

```Rust
// This prints "in", then "out"
fn main() {
    let x = "out";
    {
        // this is a different `x`
        let x = "in";
        println!("{}", x);
        // prints "in"
    }
    println!("{}", x);
    // prints "out"
}
```

### <a name="blocks-are-expressions"></a>Blocks are expressions

Blocks are also expressions, which mean they evaluate to a value.

```Rust
// this:
let x = 42;

// is equivalent to this:
let x = { 42 };
```

Inside a block, there can be multiple statements:

```Rust
let x = {
    let y = 1; // first statement
    let z = 2; // second statement
    y + z // this is the *tail* - what the whole block will evaluate to
};
// here x is equal to 3
```

### <a name="implicit-return"></a>Implicit return

Because blocks can return value, you don't need the `return` keyword at the end of a function either, these are equivalent:

```Rust
fn fair_dice_roll() -> i32 {
    return 4;
}

fn fair_dice_roll() -> i32 {
    4
}
```

### <a name="everything-is-an-expression"></a>Everything is an expression

`if` conditionals are also expressions:

```Rust
let num = if feeling_lucky {
    6
} else {
    4
};
```

And `match` is also an expression:

```Rust
fn fair_dice_roll(feeling_lucky: bool) -> i32 {
    match feeling_lucky {
        true => 6,
        false => 4,
    }
} // the return value of the function is either 6 or 4 depending on the value of feeling lucky
```
The function above is equivalent to

```Rust
fn fair_dice_roll(feeling_lucky: bool) -> i32 {
    match feeling_lucky {
        true => return 6,
        false => return 4,
    }
} 
```


<a name="patterns-and-destructuring"></a>Patterns and destructuring
---------------------------------------------------------

### <a name="destructuring-tuples"></a>Destructuring tuples

Tuples can be _destructured_ when doing an assignment, which means they're broken down into their individual fields:

```Rust
let (some_char, some_int) = ('a', 17);
// now, `some_char` is 'a', and `some_int` is 17
```

This is especially useful when a function returns a tuple:

Rust code
```Rust
let (left, right) = slice.split_at(middle);
```
Of course, when destructuring a tuple, `_` can be used to throw away part of it:

```Rust
let (_, right) = slice.split_at(middle);
```

### <a name="destructuring-structs"></a>Destructuring structs


```Rust
let v = Vec2 { x: 3.0, y: 6.0 };
let Vec2 { x, y } = v; // `x` is now 3.0, `y` is now `6.0`
```

And this:

```Rust
let Vec2 { x, .. } = v; // this throws away `v.y`
```


### <a name="destructuring-with-if-let"></a>Destructuring with `if let`

Because enums have multiple variants, you cannot simply destructure like you'd do for struct. But `let` patterns can be used as conditions in `if`:

```Rust

```Rust

enum Flavor{
    Vanilla,
    Chocolate,
    Strawberry,
    Lemon,
}

enum IceCream{
    Simple(Flavor),
    Double(Flavor, Flavor),
    Triple{
        first_scoop: Flavor,
        second_scoop: Flavor,
        third_scoop: Flavor,
    },
}

fn print_ice_cream(ice_cream: IceCream){
    if let IceCream::Simple(flavor) = ice_cream {
        println!("An ice cream with a single scoop of {flavor}");
    }else {
        println!("An ice cream with multiple flavors");
    }
}
```

And `if let` patterns can also be used for things other than enum, like struct with boolean condition inside

```Rust
struct Number {
    odd: bool,
    value: i32,
}

fn main() {
    let one = Number { odd: true, value: 1 };
    let two = Number { odd: false, value: 2 };
    print_number(one);
    print_number(two);
}

fn print_number(n: Number) {
    if let Number { odd: true, value } = n {
        println!("Odd number: {}", value);
    } else if let Number { odd: false, value } = n {
        println!("Even number: {}", value);
    }
}
// this prints:
// Odd number: 1
// Even number: 2
```


### <a name="match-arms-are-patterns"></a>Match arms are patterns

`match` arms are also patterns, just like `if let`:

```Rust
fn print_all_flavor(i: IceCrean) {
    match i {
        Simple(flavor) => println!(" An ice cream with a single scoop of {flavor}"),
        Double(flavor_1, flavor_2) => println!(" An ice cream with {flavor_1} and {flavor_2}"),
        Triple{ first_scoop, second_scoop, third_scoop } => {
            println!("An ice creamn with {first_scoop},{second_scoop} and {third_scoop}");
        }
    }
}
```

<a name="macros"></a>Macros
-----------------

Macros are kind of like functions, but with an exclamation mark at the end. Unlike functions, that aren't called at run time, with some parameters. They are **expanded** at compile time into normal code. Macros are being used to reduce boilerplate in repetitive code. 

For instance, `println!` is a macro: 

```Rust
fn main() { 
    println!("Hello {}!", "Bob"); 
} 
```
This expands to something that has the same effect as: 

```Rust 
fn main() { 
    use std::io::{self, Write}; io::stdout().lock().write_all(b"Hello there!\\n").unwrap(); 
}
```

While functions only take a fixed number of arguments, macros can accept arbitrary number of them, and are often used for that reason.

For instance, it's the reason why we need `println!` to be a macro.

```Rust
fn main() { 
    println!("Hello {} and {}!", "Alice", "Bob"); 
} 
```

It's also used to initialize vectors with an arbitrary number of elements:

```Rust
let v = vec![1,2,3,4,5];
```

As you can see above, unlike functions where you always use `()`, you can use either `()` or `[]` or `{}` whne calling a macro. The following three macro invocations are strictly equivalent:

```Rust 
let v = vec![1,2,3,4,5];
let v = vec!(1,2,3,4,5);
let v = vec!{1,2,3,4,5};
```

By _convention_ macros that behaves like a simple function are being called with `()`, `[]` is used with the only for the `vec!` macro, and macros that do more fancy stuff use `{}`.

Using macros is very common, most of the time the macros come from the standard library (`println!`, `vec!`, `assert_eq!`, for example), but they can also come from a library or you can define your own, even though this is much rarer.

### <a name="the-println-and-format-macros"></a>The `println!` and `format!` macros

For text formatting, there's a very common macro called `format!` which is internally being used in a lot of other macros, including the `println!` one that prints line to the terminal.

In can print variables if you include their name directly in the format string between curly brakets like this:

```Rust
let x = 4;
format!("{x}");
```

But if you need to print not a variable but a struct field for instance, then you cannot include it in the format string, and need to append it at the end of the macro, as formatting parameter:

```Rust

struct Person{
    name: String,
}

fn main(){
    let steph = Person{ name: "Stephen"};
    // you can't do `{steph.name}`
    println!("His name is {}", steph.name);
}

```

### <a name="the-panic-macro"></a>The `panic!` macro

`panic` is also a macro. It violently stops execution with an error message, and the file name / line number of the error, if enabled:

```Rust
fn main() {
    panic!("This panics");
}
// output: thread 'main' panicked at 'This panics', src/main.rs:3:5
```

### <a name="functions-that-panic"></a>Functions that panic

Some methods also panic. For example, the `Option` type can contain something, or it can contain nothing. If `.unwrap()` is called on it, and it contains nothing, it panics:

```Rust
fn main() {
    let o1: Option<i32> = Some(128);
    o1.unwrap(); // this is fine

    let o2: Option<i32> = None;
    o2.unwrap(); // this panics!
}

// output: thread 'main' panicked at 'called `Option::unwrap()` on a `None` value', src/libcore/option.rs:378:21
```

<a name="generics"></a>Generics
---------------------

### <a name="generic-structs"></a>Generic structs

Structs can be generic, that is: they can exist in various forms, thanks to the generic (that is, variable) type they contain.

The standard library type `Vec` (~ a heap-allocated, growable, array), is generic over the type of elements it contains:

```Rust

fn main() {
    let mut v1 = Vec::new();
    v1.push(1);
    // v1 is a Vec of integer.

    let mut v2 = Vec::new();
    v2.push(false);
    // v2 is a Vec of bool

    v2.push(2); // error: every elements in a vector must be the same type.
}
```

Enum can be generics too. Here are two enums that Rust uses to get null-able types (the `Option` enum), and to express the fact that some functions can fail (the `Result` enum).

`Option` can either contain something (of any type, hence the generic parameter `T`), or be `None`.

```Rust
enum Option<T> {
    Some(T),
    None,
}
```

`Result` is also an enum, it can either contain something, or an error. The error itself can be of any type: it can be an integer error code, or a string message, or some more structured error type, hence the generic parameter `E` in addition to the generic parameter `T` for the non-error return value.

```Rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

### <a name="generic-functions"></a>Generic functions

Functions can also be generic:

```Rust
fn foobar<T>(arg: T) {
    // do something with `arg`
}
```

### <a name="traits"></a>Traits

Traits are the Rust equivalent of an “interface” in other languages, they are something multiple types can have in common:

```Rust
trait Signed {
    fn is_strictly_negative(self) -> bool;
}
```

### <a name="type-parameter-constraints-trait-bounds"></a>Type parameter constraints (trait bounds)

Generic type parameters usually have _constraints_, so you can actually do something with them.

The simplest constraints are just trait names:

```Rust
fn print<T: Signed>(value: T) {
    if value.is_strictly_negative() {
        println!("value is strictly negative");
    }
}
```

There's a longer syntax for type parameter constraints:

```Rust
fn print<T>(value: T) where T: Signed {
    if value.is_strictly_negative() {
        println!("value is strictly negative");
    }
}
```

The two syntaxes above are strictly equivalent, the first one is the most common for simple situation, and the second gets used when the traits constraints are getting hairier.


<a name="modules"></a>Modules
--------------------------------------------

Rust code is organised in _crates_(~ a library), which contains _modules_. Modules can be nested, so you have modules that belongs to other modules. The standard library is a _crate_, that's included by default in your projects, then there's the _crates_ you added as dependencies, and there's your own crate. All of these crates contains modules, that contains the types, traits and function you're going to use on your project.

### <a name="use-syntax"></a>`use` syntax

To use types and functions defined outside of your current model, like in the standard library or in your dependencies, you need to use their full namespace path to refer to them: In this example, `std` is the _crate_ , `cmp` is the _module_, and `min` is the _function_:

```Rust
let least = std::cmp::min(3, 8); // the min function computes the minimum between two number, so the result is 3
```

To avoid repeating the same path over and over again, the `use` directives can be used to "bring in scope" names from other namespace, so that you can use them without writing down the full path.

```Rust
// at the top of the module (which, in practice is itself a source code file)
use std::cmp::min;

[…]

// then everywhere in the file, you can use `min` directly without the full path

let least = min(7, 1); // this is 1
```

If we want to import both `min` and `max`, we can do any of these:

```Rust
// this works:
use std::cmp::min;
use std::cmp::max;

// this also works:
use std::cmp::{min, max};

// this also works!
use std::{cmp::min, cmp::max};
```

A wildcard (`*`) lets you import every symbol from a namespace:

```Rust
// this brings `min` and `max` in scope, and many other things
use std::cmp::*;
```

### <a name="the-libstd-prelude"></a>The libstd prelude

`str` is a primitive type, but many non-primitive types are also in scope by default.

```Rust
// `Vec` is a regular struct, not a primitive type
let v = Vec::new();

// this is exactly the same code, but with the *full* path to `Vec`
let v = std::vec::Vec::new();
```

This works because Rust inserts this at the beginning of every module:

```Rust
use std::prelude::v1::*;
```
(Which in turns re-exports a lot of symbols, like `Vec`, `String`, `Option` and `Result`).

### <a name="crates"></a>Crates

Crates are the rust name for external libraries. They can be found on [crates.io](https://crates.io) or [lib.rs](lib.rs) (which is just an alternative front-end for crates.io).

To install a crate you can either edit your `Cargo.toml` file manually:

```Toml
[dependencies]
rand = "0.8.3"
```

This add the version `0.8.3` (or next semver-compile version) of the `rand` crate to your project.

Or you can use the `cargo` cli

```bash
cargo add rand
```

It will automatically update your `Cargo.toml` file with the latest version of the rand library.