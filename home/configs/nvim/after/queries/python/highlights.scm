; extends

; Allow `_` in front of constants and types.
((identifier) @type (#lua-match? @type "^_*[A-Z].*[a-z0-9]$"))
((identifier) @constant (#lua-match? @constant "^_*[A-Z][A-Z_0-9]*$"))
