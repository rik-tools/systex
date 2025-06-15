


# Systex
Systex is a collection of utility libraries.
* [Artisan](artisan.md)
* [Builder](builder.md)
* [Changes](changes.md)

The functions will behave as tabulated for file paths with the indicated fiso (file system object) types.

| Function     | Null | None | PFold | PFile | VFold | VFile |
|--------------|:----:|:----:|:-----:|:-----:|:-----:|:-----:|
| createFold   |  ·   |  ✓   |   ✓   |   ·   |   ·   |   ·   |
| deleteFold   |  ·   |  ✓   |   ✓   |   ·   |   ·   |   ·   |
| createFile   |  ·   |  ✓   |   ·   |   ·   |   ·   |   ·   |
| deleteFile   |  ·   |  ✓   |   ·   |   ✓   |   ·   |   ·   |
| recreateFile |  ·   |  ✓   |   ·   |   ✓   |   ·   |   ·   |
| fileCont     |  ·   |  ·   |   ·   |   ✓   |   ·   |   ·   |
| updateFile   |  ·   |  ✓   |   ·   |   ○   |   ·   |   ·   |
| createLink   |  ·   |  ✓   |   ·   |   ·   |   ·   |   ·   |
| deleteLink   |  ·   |  ✓   |   ·   |   ·   |   ✓   |   ✓   |
| recreateLink |  ·   |  ✓   |   ·   |   ·   |   ✓   |   ✓   |
| linkCont     |  ·   |  ·   |   ·   |   ·   |   ✓   |   ✓   |
| ...          |  ·   |  ·   |   ·   |   ·   |   ·   |   ·   |

* · throws
* ✓ succeeds
* ○ succeeds but may not do anything

*2025-01-11*
