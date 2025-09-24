-- ⚠
module Text.Markdown.Domain.IElement (IElement (IX, IL, IP, I1, I2, I3, II, IU, IJ, IO, IC, IR, IT, IZ, IB))
where

    import Text.Markdown.Domain.Position (Position)

    data IElement = IX Position String | IL Position String FilePath | IP Position [IElement] | I1 Position [IElement] | I2 Position [IElement] | I3 Position [IElement] | II Position [IElement] | IU Position [IElement] | IJ Position Int [IElement] | IO Position [IElement] | IC Position [IElement] | IR Position [IElement] | IT Position [IElement] | IZ Position [IElement] | IB Position String [String] deriving (Eq, Show, Read)

--
