# README


bundle install

rails server

Routes:

#POST /player , creo nuevos jugadores

#POST /game , creo nuevo juego

#PUT /game/id , hago los movimientos en el juego creado



## Documentacion 
1. [POST /player] (#new-players)

Body
 ```
{
  "name":"{nombre player}"
}
```
2. [POST /game ](#new-games)
Body
 ```
{
  "name":"{nombre juego}"
}
```

3. [Generar movimientos en el juego creado](#movements)
 ```
{
  "position":"{posicion del arreglo}"
  "symbol":"{simbolo 'X' o 'O'}
}
```
