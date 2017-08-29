<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="resume">
		<html>
			<head>
				<title>CV - <xsl:value-of select="name" /></title>
				<link rel="stylesheet" href="build/resume.css" />
				<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,latin-ext" />
			</head>
			<body>
				<header>
					<h1><xsl:value-of select="name" /></h1>
				</header>

				<section id="basicData">
					<div class="row">
						<div class="label">Urodzony</div>
						<div class="value"><xsl:value-of select="birthday" /></div>
					</div>
					<div class="row">
						<div class="label">Miejsce zamieszkania</div>
						<div class="value"><xsl:value-of select="city" /></div>
					</div>
					<div class="row">
						<div class="label">Numer telefonu</div>
						<div class="value"><xsl:value-of select="phone" /></div>
					</div>
					<div class="row">
						<div class="label">E-mail</div>
						<div class="value"><xsl:apply-templates select="email" /></div>
					</div>
				</section>

				<section class="history">
					<h2>Wykształcenie</h2>
					<xsl:for-each select="education/*">
						<div class="row">
							<div class="dateRange"><xsl:value-of select="startYear" /> – <xsl:value-of select="endYear" /></div>
							<div class="value"><xsl:value-of select="name" /> – <xsl:value-of select="title" /><br /><xsl:value-of select="division" /></div>
						</div>
					</xsl:for-each>
				</section>

				<section class="history">
					<h2>Doświadczenie</h2>
					<xsl:for-each select="employment/job">
						<div class="row">
							<div class="dateRange">
								<xsl:value-of select="startDate" /> – <xsl:value-of select="endDate" />
								<xsl:if test="not(endDate)">
									obecnie
								</xsl:if>
							</div>
							<div class="value"><xsl:value-of select="company" /> – <xsl:value-of select="duties" /></div>
						</div>
					</xsl:for-each>
				</section>
				
				<section>
					<h2>Umiejętności</h2>
					<ul class="skills">
						<xsl:for-each select="skills/skill">
							<li><xsl:value-of select="." /></li>
						</xsl:for-each>
					</ul>
				</section>

				<section>
					<h2>Chciałbym lepiej poznać</h2>
					<ul>
						<xsl:for-each select="dreams/dream">
							<li><xsl:value-of select="." /></li>
						</xsl:for-each>
					</ul>
				</section>

				<section>
					<h2>Zainteresowania</h2>
					<ul>
						<xsl:for-each select="interests/interest">
							<li><xsl:value-of select="." /></li>
						</xsl:for-each>
					</ul>
				</section>
				
				<footer>
					Dokument został napisany w formacie XML, następnie przetworzony na HTML za pomocą arkusza XSLT.<br />
					Końcowy plik PDF wygenerowano za pomocą PhantomJS.<br />
					Kod źródłowy dokumentu jest dostępny pod adresem https://github.com/phorzycki/resume
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="email">
		<xsl:value-of select="username" />@<xsl:value-of select="domain" />
	</xsl:template>
</xsl:stylesheet>
