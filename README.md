# **GameOfLife**

## **Design Patterns Utilisés**

### **Singleton**
Nous avons employé le design pattern Singleton dans notre projet, en particulier avec la classe `Grid`. Cette classe définit la structure de notre jeu de la vie, incluant les cellules, la taille de la grille, et expose des fonctions permettant de modifier les valeurs dans la grille, passer au tour suivant, changer la taille, etc.

### **State**
Le design pattern State a été utilisé avec une interface nommée `CellState`, accompagnée des états `DeadCellState` et `AliveCellState`. Ces derniers permettent de récupérer l'état actuel d'une cellule et la couleur de la case en fonction du State, en exécutant la fonction appropriée.

### **Command**
Enfin, nous avons intégré le design pattern Command à l'aide de la classe `NeighborsStateCommand`. Cette classe implémente l'interface `Command`, laquelle contient une fonction `execute` permettant d'appeler la fonction `getNeighborsState()` en fonction du type de cellule (bord, coin ou cellule intérieure). Trois classes, `GridBorder`, `GridCorner`, et `GridInside`, qui implémentent l'interface `CellType`, définissent les différents types de cellules. Cette approche nous offre une liste des états des cellules voisines de notre cellule, permettant ainsi de calculer l'état de notre cellule pour le tour suivant en fonction du nombre de cellules vivantes.
