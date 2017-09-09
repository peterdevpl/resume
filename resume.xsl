<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="resume">
        <html>
            <head>
                <title>CV - <xsl:value-of select="name" /></title>
                <link rel="stylesheet" href="resume.css" />
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,latin-ext" />
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="name" /></h1>
                </header>

                <section id="basicData">
                    <div class="row">
                        <div class="label">Born</div>
                        <div class="value"><xsl:value-of select="birthday" /></div>
                    </div>
                    <div class="row">
                        <div class="label">Place of living</div>
                        <div class="value"><xsl:value-of select="city" /></div>
                    </div>
                    <div class="row">
                        <div class="label">Phone number</div>
                        <div class="value"><xsl:value-of select="phone" /></div>
                    </div>
                    <div class="row">
                        <div class="label">E-mail</div>
                        <div class="value"><xsl:apply-templates select="email" /></div>
                    </div>
                    <div class="row">
                        <div class="label">Links</div>
                        <div class="value">
                            <xsl:for-each select="links/link">
                                <a href="{.}"><xsl:value-of select="." /></a><br />
                            </xsl:for-each>
                        </div>
                    </div>
                </section>

                <section class="history">
                    <h2>Education</h2>
                    <xsl:for-each select="education/*">
                        <div class="row">
                            <div class="dateRange"><xsl:value-of select="startYear" /> – <xsl:value-of select="endYear" /></div>
                            <div class="value"><xsl:value-of select="name" /> – <xsl:value-of select="title" /><br /><xsl:value-of select="division" /></div>
                        </div>
                    </xsl:for-each>
                </section>

                <section class="history">
                    <h2>Work experience</h2>
                    <xsl:for-each select="employment/job">
                        <div class="row">
                            <div class="dateRange">
                                <xsl:value-of select="startDate" /> – <xsl:value-of select="endDate" />
                                <xsl:if test="not(endDate)">
                                    now
                                </xsl:if>
                            </div>
                            <div class="value"><xsl:value-of select="company" /> – <xsl:value-of select="duties" /></div>
                        </div>
                    </xsl:for-each>
                </section>
                
                <section>
                    <h2>Technologies</h2>
                    <ul class="skills">
                        <xsl:for-each select="skills/skill">
                            <li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                </section>
                
                <section id="conferences">
                    <h2>Conferences</h2>
                    <ul>
                        <xsl:for-each select="conferences/conference">
                            <li>
                                <xsl:value-of select="name" /> – <xsl:value-of select="date" /> – <em><xsl:value-of select="title" /></em>
                                <xsl:if test="link"> – <a href="{link}"><xsl:value-of select="link" /></a></xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </section>

                <section>
                    <h2>Would like to know better</h2>
                    <ul class="skills">
                        <xsl:for-each select="dreams/dream">
                            <li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                </section>
                
                <section>
                    <h2>Interests</h2>
                    <ul>
                        <xsl:for-each select="interests/interest">
                            <li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                </section>
                
                <footer>
                    This document was written in XML and converted to HTML with an XSLT sheet. PDF generated using headless Google Chrome<br />
                    Source code is available at <a href="https://github.com/phorzycki/resume">https://github.com/phorzycki/resume</a>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="email">
        <a href="mailto:{username}@{domain}"><xsl:value-of select="username" />@<xsl:value-of select="domain" /></a>
    </xsl:template>
</xsl:stylesheet>
