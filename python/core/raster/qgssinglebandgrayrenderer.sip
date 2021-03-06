class QgsSingleBandGrayRenderer: QgsRasterRenderer
{
%TypeHeaderCode
    #include "qgssinglebandgrayrenderer.h"
%End
  public:
    enum Gradient
    {
      BlackToWhite,
      WhiteToBlack
    };

    QgsSingleBandGrayRenderer( QgsRasterDataProvider* provider, int grayBand );
    ~QgsSingleBandGrayRenderer();
    virtual QgsSingleBandGrayRenderer * clone() const /Factory/;

    static QgsRasterRenderer* create( const QDomElement& elem, QgsRasterDataProvider* provider ) /Factory/;

    QgsRasterBlock *block( int bandNo, const QgsRectangle & extent, int width, int height, QgsRasterBlockFeedback* feedback = nullptr ) / Factory /;

    int grayBand() const;
    void setGrayBand( int band );
    const QgsContrastEnhancement* contrastEnhancement() const;
    /** Takes ownership*/
    void setContrastEnhancement( QgsContrastEnhancement* ce /Transfer/ );

    void setGradient( Gradient gradient );
    Gradient gradient() const;

    void writeXml( QDomDocument& doc, QDomElement& parentElem ) const;

    void legendSymbologyItems( QList< QPair< QString, QColor > >& symbolItems /Out/ ) const;

    QList<int> usesBands() const;

  private:

    QgsSingleBandGrayRenderer( const QgsSingleBandGrayRenderer& );
    const QgsSingleBandGrayRenderer& operator=( const QgsSingleBandGrayRenderer& );
};
