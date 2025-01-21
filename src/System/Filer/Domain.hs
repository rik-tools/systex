-- ⚠
module System.Filer.Domain (FisoMode, FileCont, FisoType (None, Null, PFold, PFile, VFold, VFile))
where

    type FisoMode = String
    type FileCont = String

    data FisoType = None | Null | PFold | PFile | VFold | VFile deriving (Eq, Show, Read)

--
