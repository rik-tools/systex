module System.Filer.Fiso.ModeThinker (isFisoMode)
where
-- ⚠

    import System.Filer.Domain (FisoMode)

--
    isFisoMode :: FisoMode -> Bool
    isFisoMode fisoMode =
        length fisoMode == 3
        && foldr (&&) True (map (contains octalDigits) fisoMode)

    octalDigits :: String
    octalDigits = "01234567"

    contains :: Eq a => [a] -> a -> Bool
    contains container containee =
        elem containee container

--
