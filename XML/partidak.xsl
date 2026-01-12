<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <h1 class="partidak-titulua">Partidak</h1>

        <xsl:for-each select="boleibol_federazioa/denboraldiak/denboraldia">
            <section class="denboraldia">
                <h2>
                    <xsl:value-of select="denboraldiIzena" />
                    <xsl:if test="hasieraData">
                        <xsl:value-of select="substring(hasieraData, 1, 4)" /> - <xsl:value-of select="substring(amaieraData, 1, 4)" />
                    </xsl:if>
                </h2>

                <xsl:for-each select="jardunaldiak/jardunaldia">
                    <div class="jardunaldia">
                        <h3>Jardunaldia <xsl:value-of select="jardunaldiZbk" /></h3>
                        <div class="partida-taulak">
                            <xsl:for-each select="partidak/partida">
                                <div class="partida">
                                    <div class="taldeak">
                                        <span class="etxekoa">
                                            <xsl:value-of select="etxekoTaldea" />
                                        </span>
                                        <span class="vs"> vs </span>
                                        <span class="kanpokoa">
                                            <xsl:value-of select="kanpokoTaldea" />
                                        </span>
                                    </div>
                                    <div class="emaitza">
                                        <xsl:choose>
                                            <xsl:when test="emaitza">
                                                <strong><xsl:value-of select="emaitza" /></strong>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <em>Programatuta</em>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </section>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>