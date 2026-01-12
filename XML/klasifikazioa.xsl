<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">

        <h1 class="taldeak-titulua"> 
            Federazioaren <span>Klasifikazioa</span>
        </h1>
        <section class="tabla_section">
            <div class="tabla-contenedor temporadas-flex">
                <!-- Denboraldi bakoitzak taula desberdinetan egongo dira -->
                <xsl:for-each select="boleibol_federazioa/denboraldiak/denboraldia">

                    <!-- Título de la temporada -->
                    <h2 class="temporada-titulo">
                        <xsl:value-of select="denboraldiIzena" />
                    </h2>

                    <!-- Tabla de clasificación -->
                    <div class="tabla-contenedor">
                        <div class="temporada-box">
                            <table class="tabla-klasi">
                                <thead>
                                    <tr>
                                        <th class="pos-col">#</th>
                                        <th class="team-col">Taldea</th>
                                        <th>Partidak</th>
                                        <th>Irabaziak</th>
                                        <th>Galdutakoak</th>
                                        <th class="points-col">Puntuak</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <xsl:for-each select="sailkapena/taldeSailkapena">
                                        <tr>
                                            <xsl:attribute name="class">
                                                <xsl:choose>
                                                    <xsl:when test="postua = 1">champions</xsl:when>
                                                    <xsl:when test="postua = 2">europa</xsl:when>
                                                    <xsl:when test="postua &gt;= 4">relegation</xsl:when>
                                                </xsl:choose>
                                            </xsl:attribute>

                                            <td class="position">
                                                <xsl:value-of select="postua" />
                                            </td>

                                            <td class="team">
                                                <div class="team-info">
                                                    <img src="irudiak/{taldeIzena}.png"
                                                        alt="{taldeIzena}" width="32" height="32" />
                                                    <span>
                                                        <xsl:value-of select="taldeIzena" />
                                                    </span>
                                                </div>
                                            </td>

                                            <td>
                                                <xsl:value-of select="jokatutakoPartidak" />
                                            </td>

                                            <td>
                                                <xsl:value-of select="irabazitakoak" />
                                            </td>

                                            <td>
                                                <xsl:value-of select="galduak" />
                                            </td>

                                            <td class="points">
                                                <xsl:value-of select="puntuak" />
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </section>

    </xsl:template>

</xsl:stylesheet>