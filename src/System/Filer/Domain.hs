-- ⚠
module System.Filer.Domain (FisoMode, FileCont, LinkCont, FisoType (None, Null, PFold, PFile, VFold, VFile))
where

    type FisoMode = String
    type FileCont = String
    type LinkCont = String

    data FisoType = None | Null | PFold | PFile | VFold | VFile deriving (Eq, Show, Read)

--
