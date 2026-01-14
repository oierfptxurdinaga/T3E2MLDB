<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">


        <h1 class="taldeak-titulua"> 
            Federazioaren <span>Taldeak</span>
        </h1>


        <xsl:for-each select="boleibol_federazioa/taldeak/taldea">

            <!-- ===== TARJETA DEL EQUIPO ===== -->
            <section class="jokalari-card" id="tald">
                <article class="talde_kont">
                    <img src="irudiak/{taldeLogoa}" alt="{taldeIzena}" />
                    <h2>
                        <xsl:value-of select="taldeIzena" />
                    </h2>

                    <ul>
                        <li>Nor dira? <xsl:value-of select="taldeDeskribapena" /></li>
                        <li><xsl:value-of select="taldeSorrera" /> urtean sortu zen.</li>
                        <li>Bere lehendakaria: <xsl:value-of select="taldeLehendakaria" /></li>
                        <li>Zelaia: <xsl:value-of select="taldeZelaia" /></li>
                    </ul>

                    <div>
                        <button class="jokalariak">Jokalariak ikusi</button>
                        <button class="ezkutatu" style="display:none;">Itxi</button>
                    </div>
                </article>

                <!-- ===== JUGADORES DEL EQUIPO ===== -->

                <div class="jokalari-full" style="display:none;">
                    <article class="jokalari_kont">
                        <h3>Jokalariak</h3>

                        <ul>
                            <xsl:for-each select="jokalariak/jokalaria">
                                <li>
                                    <strong>#<xsl:value-of select="jokalariZbk" /></strong> - <xsl:value-of
                                        select="jokalariIzenAbizena" /> (<xsl:value-of
                                        select="jokalariPosizioa" />, <xsl:value-of
                                        select="jokalariAdina" /> urte) </li>
                            </xsl:for-each>
                        </ul>
                    </article>

                </div>


            </section>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>