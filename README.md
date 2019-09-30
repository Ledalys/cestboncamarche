# C'EST BON ÇA MARCHE

Permet de tout faire marcher du premier coup en une commande.

## Prérequis

```shell
sudo apt install imagemagick
```

## Utilisation

- cloner le dépot (ou juste télécharger `index.sh`)
- faire marcher ce qui ne marchait pas

  - avec une photo ou un screen:

    ```shell
    bash index.sh --screen path/to/my/screen.jpg /tmp
    ```

  - avec un texte

    ```shell
    bash index.sh --text "Ça marche pas !" /tmp
    ```
