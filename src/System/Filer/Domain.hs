-- ⚠
module System.Filer.Domain (FisoMode, FisoType (None, Null, PFold, PFile, VFold, VFile))
where

    type FisoMode = String

    data FisoType = None | Null | PFold | PFile | VFold | VFile deriving (Eq, Show, Read)

--
