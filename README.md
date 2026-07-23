# Interros SI

Réécriture en LaTeX des interros de Sciences de l'Ingénieur.

## Structure

- `framework/` : commandes communes au projet ;
- `interros/` : un dossier et un fichier `.tex` par interro ;
- `sources/` : documents originaux de référence ;
- `.github/workflows/compile.yml` : compilation automatique.

## Compilation locale

```bash
make
```

Pour une interro isolée :

```bash
cd interros/I01_AnalyseFonctionnelle
latexmk -pdf I01_AnalyseFonctionnelle.tex
```
