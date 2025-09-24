module Text.Markdown.Reading.Aggregator (aggregatingM)
where
-- ⚠

    import Data.List.Tools (dropUntil, takeUntil)
    import Text.Markdown.Domain.AElement (AElement (AEm, APa, AH1, AH2, AH3, AUI, AOI, ATR, ACr, ABO, ABC))

--
    aggregatingM :: [AElement] -> IO [[AElement]]
    aggregatingM = return . aggregating

    aggregating :: [AElement] -> [[AElement]]
    aggregating lines =
        case lines of
            [] -> []
            AEm: rest -> aggregating rest
            APa string: rest -> [APa string]: aggregating rest
            AH1 string: rest -> [AH1 string]: aggregating rest
            AH2 string: rest -> [AH2 string]: aggregating rest
            AH3 string: rest -> [AH3 string]: aggregating rest
            AUI _: _ -> takeWhile isAUI lines: aggregating (dropWhile isAUI lines)
            AOI _: _ -> takeWhile isAOI lines: aggregating (dropWhile isAOI lines)
            ATR _: _ -> takeWhile isATR lines: aggregating (dropWhile isATR lines)
            ACr string: rest -> [ACr string]: aggregating rest
            ABO string: rest -> (ABO string: takeUntil isABC rest): aggregating (drop 1 (dropUntil isABC rest))
            _: rest -> []: aggregating rest

    isAUI :: AElement -> Bool
    isAUI line =
        case line of
            AUI _ -> True
            _ -> False

    isAOI :: AElement -> Bool
    isAOI line =
        case line of
            AOI _ -> True
            _ -> False

    isATR :: AElement -> Bool
    isATR line =
        case line of
            ATR _ -> True
            _ -> False

    isABC :: AElement -> Bool
    isABC line =
        case line of
            ABC -> True
            _ -> False

--
