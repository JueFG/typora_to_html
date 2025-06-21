# Project Description
This script is an enhanced version of the open-source project [pandoc-toc-sidebar](https://github.com/Mushiyo/pandoc-toc-sidebar), designed to convert a collection of Markdown (.md) files—such as lecture notes—into HTML files with a sidebar table of contents (TOC). 

Key improvements include:

✅ Added index homepage: Automatically generates an index.html listing all documents, sorted in ascending order (w1 ~ w11) for easy navigation.

🎨 Improved style compatibility with Typora: Uses gothic.css and Google Fonts to resemble Typora's preview mode.

🔗 Enhanced internal anchor link support: Ensures proper intra-document navigation using anchor-style links (e.g., #section-title).

# typora_to_html

1. Put the md files into `typora_to_html` folder.
  ```sh
  cd typora_to_html
  ```

2. Modify the `nav` file to customise sidebar
3. run to export:
  ```sh
  chmod +x export_all.sh
  ./export_all.sh
  ```
4. Then your html files should be in the floder called output. click the index.html to view your note.

# Options
#### Local or self-contained css and JavaScript files
For local css and JavaScript files, or using Pandoc's `--self-contained` option, replace `toc-sidebar.html` with `toc-sidebarL.html` in step 4.  

#### `<table>` styles
The `<table>` styles here are the following Bootstrap table classes: `.table`, `table-bordered` and `table-hover`.
You can change the styles by modifying line 104 in [toc-sidebar.html](toc-sidebar.html#L104) (or [toc-sidebarL.html](toc-sidebarL.html#L104) if local css and js files are used).
For example, if you want `.table-striped`, just replace `table table-bordered table-hover` into `table table-striped`.
Read [Bootstrap documentation](http://getbootstrap.com/css/#tables) for more Bootstrap table styles.

#### No navbar
If you do not want a navbar, you can remove `-B nav` option in step 4. However, for the time being, this will result in a not good looking layout :(   

# Usage Notes
Markdown filenames are suggested to follow the format:

w1 - Title.md, w2 - Title.md, etc., to ensure correct sorting.

When adding internal links within a Markdown file, use the format:

`[Link text](#section-title)`
Note: The heading ID (after #) must be in lowercase, with spaces replaced by dashes, and free of special characters.

For example, if you have a heading:
 `## WD Ross’s 7 basic duties`
Then the correct internal link is:
`[Jump to section](#wd-rosss-7-basic-duties)`
