exists ramen [if] \\ [then]
true constant ramen

[defined] gforth [if]
    include ~+/afkit/afkit.f  \ AllegroForthKit
[else]
    include afkit/afkit.f  \ AllegroForthKit
[then]

#1 #5 #0 [afkit] [checkver]

\ Low-level
include ramen/variables.f
include ramen/plat.f
[undefined] LIGHTWEIGHT [if]
include afkit/dep/zlib/zlib.f
[then]
include ramen/struct.f
include ramen/color.f
include ramen/fixops.f
include afkit/plat/sf/fixedp.f \ must come after fixops.  we need fixed-point literals ... it's unavoidable
include ramen/stack.f
include ramen/rect.f
include ramen/res.f

\ Assets
include ramen/assets.f
include ramen/image.f
include ramen/font.f
include ramen/buffer.f
include ramen/sample.f

\ Higher level facilities
include ramen/obj.f
include ramen/publish.f

redef off  \ from here on fields only defined if not previously defined

: frmctr  frmctr 1p ;
objlist stage  \ default object list
used @ value baseline
: -stage  stage -objlist ;

[undefined] LIGHTWEIGHT [if]
    include ramen/default.f
[THEN]

: empty
    cr ." Empty!"
    -stage -assets baseline used ! stop empty ;
only forth definitions marker (empty)
