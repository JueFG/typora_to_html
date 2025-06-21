# pandoc-toc-sidebar


1. Put the md files into `typora_to_html` folder.
  ```sh
  cd typora_to_html
  ```

2. Modify the `nav` file to customise sidebar
5. run to export:
  ```sh
  chmod +x export_all.sh
  ./export_all.sh
  ```


### Options
#### Local or self-contained css and JavaScript files
For local css and JavaScript files, or using Pandoc's `--self-contained` option, replace `toc-sidebar.html` with `toc-sidebarL.html` in step 4.  

#### `<table>` styles
The `<table>` styles here are the following Bootstrap table classes: `.table`, `table-bordered` and `table-hover`.
You can change the styles by modifying line 104 in [toc-sidebar.html](toc-sidebar.html#L104) (or [toc-sidebarL.html](toc-sidebarL.html#L104) if local css and js files are used).
For example, if you want `.table-striped`, just replace `table table-bordered table-hover` into `table table-striped`.
Read [Bootstrap documentation](http://getbootstrap.com/css/#tables) for more Bootstrap table styles.

#### No navbar
If you do not want a navbar, you can remove `-B nav` option in step 4. However, for the time being, this will result in a not good looking layout :(   

