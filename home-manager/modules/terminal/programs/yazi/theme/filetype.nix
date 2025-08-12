{ theme, ... }:

{
    rules = [
      # Special files with fg and bg
      {
        name = "*LS_COLORS";
        fg = "#${theme.colorScheme.redHex}";
        bg = "#${theme.colorScheme.background2Hex}";
        bold = true;
        underline = true;
      }
      {
        name = "*diff";
        fg = "#${theme.colorScheme.foreground3Hex}";
        bg = "#${theme.colorScheme.redHex}";
      }
      {
        name = "*.patch";
        fg = "#${theme.colorScheme.foreground3Hex}";
        bg = "#${theme.colorScheme.redHex}";
        bold = true;
      }
      {
        name = "*";
        is = "orphan";
        fg = "#${theme.colorScheme.foreground3Hex}";
        bg = "#${theme.colorScheme.redHex}";
        bold = true;
      }
      {
        name = "*";
        is = "sticky";
        fg = "#${theme.colorScheme.cyanHex}";
        bg = "#${theme.colorScheme.background2Hex}";
      }

      # Text and documentation
      {
        name = "*.txt";
        fg = "#${theme.colorScheme.foreground3Hex}";
      }
      {
        name = "*README|*README.rst|*README.md|*LICENSE|*LICENSE.md|*COPYING|*INSTALL|*COPYRIGHT|*AUTHORS|*HISTORY|*CONTRIBUTORS|*CONTRIBUTING|*CONTRIBUTING.md|*CHANGELOG|*CHANGELOG.md|*CODEOWNERS|*PATENTS|*VERSION|*NOTICE|*CHANGES";
        fg = "#${theme.colorScheme.yellowHex}";
        bold = true;
      }
      {
        name = "*.adoc|*.asciidoc|*.etx|*.info|*.markdown|*.md|*.mkd|*.mdx|*.nfo|*.org|*.norg|*.pod|*.rst|*.tex|*.textile";
        fg = "#${theme.colorScheme.greenHex}";
      }

      # Data and configuration
      {
        name = "*.bib|*.json|*.jsonc|*.json5|*.hjson|*.jsonl|*.jsonnet|*.libsonnet|*.ndjson|*.msg|*.pgn|*.rss|*.xml|*.fxml|*.toml|*.yaml|*.yml|*.RData|*.rdata|*.xsd|*.dtd|*.sgml|*.rng|*.rnc";
        fg = "#${theme.colorScheme.orangeHex}";
      }
      {
        name = "*config|*cfg|*conf|*rc|*authorized_keys|*known_hosts|*.ini|*.plist|*.profile|*.bash_profile|*.bash_login|*.bash_logout|*.zshenv|*.zprofile|*.zlogin|*.zlogout|*.viminfo|*.pcf|*.psf|*.hidden-color-scheme|*.hidden-tmTheme|*.last-run|*.merged-ca-bundle|*.sublime-build|*.sublime-commands|*.sublime-keymap|*.sublime-settings|*.sublime-snippet|*.sublime-project|*.sublime-workspace|*.tmTheme|*.user-ca-bundle|*.rstheme|*.epf";
        bold = true;
      }

      # Database
      {
        name = "*.accdb|*.accde|*.accdr|*.accdt|*.db|*.fmp12|*.fp7|*.localstorage|*.mdb|*.mde|*.sqlite|*.typelib|*.nc";
        fg = "#${theme.colorScheme.blueHex}";
      }

      # Documents and eBooks
      {
        name = "*.cbr|*.cbz|*.chm|*.djvu|*.pdf|*.PDF|*.mobi|*.epub";
        fg = "#${theme.colorScheme.magentaHex}";
      }
      {
        name = "*.docm|*.doc|*.docx|*.odb|*.odt|*.rtf|*.pages";
        fg = "#${theme.colorScheme.blueHex}";
        underline = true;
      }
      {
        name = "*.odp|*.pps|*.ppt|*.pptx|*.ppts|*.pptxm|*.pptsm";
        fg = "#${theme.colorScheme.orangeHex}";
        underline = true;
      }
      {
        name = "*.csv|*.tsv|*.numbers|*.ods|*.xla|*.xls|*.xlsx|*.xlsxm|*.xltm|*.xltx";
        fg = "#${theme.colorScheme.greenHex}";
      }

      # Images
      {
        name = "*.bmp|*.dicom|*.tiff|*.tif|*.TIFF|*.cdr|*.flif|*.gif|*.icns|*.ico|*.jpeg|*.JPG|*.jpg|*.jxl|*.nth|*.png|*.psd|*.pxd|*.pxm|*.xpm|*.webp";
        fg = "#${theme.colorScheme.cyanHex}";
      }
      {
        name = "*.ai|*.eps|*.epsf|*.drw|*.ps|*.svg";
        fg = "#${theme.colorScheme.magentaHex}";
      }

      # Videos
      {
        name = "*.avi|*.divx|*.IFO|*.m2v|*.m4v|*.mkv|*.MOV|*.mov|*.mp4|*.mpeg|*.mpg|*.ogm|*.rmvb|*.sample|*.wmv|*.3g2|*.3gp|*.gp3|*.webm|*.gp4|*.asf|*.flv|*.ogv|*.f4v|*.VOB|*.vob";
        fg = "#${theme.colorScheme.yellowHex}";
      }
      {
        name = "*.ass|*.srt|*.ssa|*.sub|*.sup|*.vtt";
        fg = "#${theme.colorScheme.blueHex}";
      }

      # Audio
      {
        name = "*.3ga|*.S3M|*.aac|*.amr|*.au|*.caf|*.dat|*.dts|*.fcm|*.m4a|*.mod|*.mp3|*.mp4a|*.oga|*.ogg|*.opus|*.s3m|*.sid|*.wma|*.ape|*.aiff|*.cda|*.flac|*.alac|*.mid|*.midi|*.pcm|*.wav|*.wv|*.wvc";
        fg = "#${theme.colorScheme.orangeHex}";
        bold = true;
      }

      # Fonts
      {
        name = "*.afm|*.fon|*.fnt|*.pfb|*.pfm|*.ttf|*.otf|*.woff|*.woff2|*.PFA|*.pfa";
        fg = "#${theme.colorScheme.blueHex}";
      }

      # Archives
      {
        name = "*.7z|*.a|*.arj|*.br|*.bz2|*.cpio|*.gz|*.lrz|*.lz|*.lzma|*.lzo|*.rar|*.s7z|*.sz|*.tar|*.tbz|*.tgz|*.warc|*.WARC|*.xz|*.z|*.zip|*.zipx|*.zoo|*.zpaq|*.zst|*.zstd|*.zz";
        fg = "#${theme.colorScheme.greenHex}";
      }

      # Packages
      {
        name = "*.apk|*.ipa|*.deb|*.rpm|*.jad|*.jar|*.ear|*.war|*.cab|*.pak|*.pk3|*.vdf|*.vpk|*.bsp|*.dmg|*.crx|*.xpi";
        fg = "#${theme.colorScheme.orangeHex}";
      }

      # Disk images
      {
        name = "*.iso|*.img|*.bin|*.nrg|*.qcow|*.fvd|*.sparseimage|*.toast|*.vcd|*.vdi|*.vhd|*.vhdx|*.vfd|*.vmdk";
        fg = "#${theme.colorScheme.redHex}";
      }

      # Programming and scripts
      {
        name = "*.awk|*.bash|*.bat|*.BAT|*.sed|*.sh|*.zsh|*.fish|*.vim|*.kak";
        fg = "#${theme.colorScheme.yellowHex}";
      }
      {
        name = "*.py|*.ipynb|*.xsh|*.rb|*.gemspec";
        fg = "#${theme.colorScheme.greenHex}";
      }
      {
        name = "*.pl|*.PL|*.pm|*.t";
        fg = "#${theme.colorScheme.redHex}";
      }
      {
        name = "*.msql|*.mysql|*.prql|*.pgsql|*.sql";
        fg = "#${theme.colorScheme.yellowHex}";
      }
      {
        name = "*.c|*.C|*.c++|*.cc|*.cs|*.cp|*.cpp|*.cxx|*.cr|*.go|*.f|*.F|*.for|*.ftn|*.f90|*.F90|*.f95|*.F95|*.f03|*.F03|*.f08|*.F08|*.nim|*.nimble|*.rs|*.sx|*.vala|*.vapi|*.hs|*.lhs|*.agda|*.lagda|*.lagda.tex|*.lagda.rst|*.lagda.md|*.zig|*.v";
        fg = "#${theme.colorScheme.blueHex}";
      }
      {
        name = "*.h|*.H|*.tcc|*.h++|*.hpp|*.hxx|*.ii|*.M|*.m|*.agdai";
        fg = "#${theme.colorScheme.foreground2Hex}";
      }

      # Web and markup
      {
        name = "*.css|*.less|*.sass|*.scss";
        fg = "#${theme.colorScheme.blueHex}";
        bold = true;
      }
      {
        name = "*.htm|*.html|*.jhtm|*.mht|*.mustache|*.ejs|*.pug|*.svelte|*.vue|*.astro";
        fg = "#${theme.colorScheme.redHex}";
        bold = true;
      }
      {
        name = "*.js|*.jsx|*.ts|*.tsx|*.mjs|*.cjs|*.coffee|*.java|*.jsm|*.jsp";
        fg = "#${theme.colorScheme.cyanHex}";
        bold = true;
      }

      # Miscellaneous
      {
        name = "*.git|*.github|*.gitignore|*.gitattributes|*.gitmodules";
        fg = "#${theme.colorScheme.redHex}";
      }
      {
        name = "*.swp|*.swo|*.tmp|*.sassc|*.pacnew|*.un~|*.orig|*.BUP|*.bak|*.o|*core|*.mdump|*.rlib|*.dll|*.aria2|*.dump|*.stackdump|*.zcompdump|*.zwc";
        fg = "#${theme.colorScheme.foreground4Hex}";
      }
      {
        name = "*.part|*.r[0-9]{0,2}|*.zx[0-9]{0,2}|*.z[0-9]{0,2}";
        fg = "#${theme.colorScheme.foreground4Hex}";
      }
      {
        name = "*.pid|*.state|*lockfile|*lock";
        fg = "#${theme.colorScheme.foreground3Hex}";
      }
      {
        name = "*.err|*.error|*.stderr";
        fg = "#${theme.colorScheme.redHex}";
        bold = true;
      }
      {
        name = "*.pcap|*.cap|*.dmp";
        fg = "#${theme.colorScheme.greenHex}";
      }
      {
        name = "*.allow";
        fg = "#${theme.colorScheme.greenHex}";
      }
      {
        name = "*.deny";
        fg = "#${theme.colorScheme.redHex}";
      }
      {
        name = "*.service|*@.service|*.socket|*.swap|*.device|*.mount|*.automount|*.target|*.path|*.timer|*.snapshot";
        fg = "#${theme.colorScheme.cyanHex}";
      }
      {
        name = "*.lnk|*.application|*.cue|*.description|*.directory|*.m3u|*.m3u8|*.md5|*.properties|*.sfv|*.theme|*.torrent|*.urlview|*.webloc";
        fg = "#${theme.colorScheme.cyanHex}";
      }
      {
        name = "*.asc|*.bfe|*.enc|*.gpg|*.signature|*.sig|*.p12|*.pem|*.pgp|*.p7s|*id_dsa|*id_rsa|*id_ecdsa|*id_ed25519";
        fg = "#${theme.colorScheme.greenHex}";
      }
      {
        name = "*.32x|*.cdi|*.fm2|*.rom|*.sav|*.st|*.a00|*.a52|*.A64|*.a64|*.a78|*.adf|*.atr|*.gb|*.gba|*.gbc|*.gel|*.gg|*.ggl|*.ipk|*.j64|*.nds|*.nes|*.sms";
        fg = "#${theme.colorScheme.magentaHex}"; # e.g., #b48ead
      }
      {
        name = "*.8xp|*.8eu|*.82p|*.83p|*.8xe";
        fg = "#${theme.colorScheme.greenHex}";
      }
      {
        name = "*.stl|*.dwg|*.ply|*.wrl";
        fg = "#${theme.colorScheme.orangeHex}";
      }
      {
        name = "*.vert|*.comp|*.frag|*.spv|*.wgsl";
        fg = "#${theme.colorScheme.yellowHex}";
      }
      {
        name = "*.xib|*.iml|*.DS_Store|*.localized|*.CFUserTextEncoding|*CodeResources|*PkgInfo|*.nib|*.car";
        fg = "#${theme.colorScheme.foreground4Hex}";
      }
      {
        name = "*.entitlements|*.pbxproj|*.strings|*.storyboard|*.xcconfig|*.xcsettings|*.xcuserstate|*.xcworkspacedata";
        fg = "#${theme.colorScheme.redHex}";
        bold = true;
      }
      {
        name = "*.pot|*.pcb|*.mm|*.gbr|*.scm|*.xcf|*.spl|*.Rproj|*.sis|*.1p|*.3p|*.cnc|*.def|*.ex|*.example|*.feature|*.ger|*.ics|*.map|*.mf|*.mfasl|*.mi|*.mtx|*.pc|*.pi|*.plt|*.rdf|*.ru|*.sch|*.sty|*.sug|*.tdy|*.tfm|*.tfnt|*.tg|*.vcard|*.vcf|*.xln";
        fg = "#${theme.colorScheme.foreground3Hex}";
      }

      # File types
      {
        name = "*";
        is = "block";
        fg = "#${theme.colorScheme.blueHex}";
      }
      {
        name = "*";
        is = "char";
        fg = "#${theme.colorScheme.greenHex}";
        bold = true;
      }
      {
        name = "*/";
        fg = "#${theme.colorScheme.cyanHex}";
      }
      {
        name = "*";
        is = "exec";
        fg = "#${theme.colorScheme.orangeHex}";
        bold = true;
      }
      {
        name = "*";
        is = "fifo";
        fg = "#${theme.colorScheme.magentaHex}";
      }
      {
        name = "*";
        is = "sock";
        fg = "#${theme.colorScheme.redHex}";
      }
    ];

}
