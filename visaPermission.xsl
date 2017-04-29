<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		<head>
			<style>
			table, td{
				border: 1px solid black;
			}
			#main {
				background-color: gray;
			}
			</style>
		</head>
		<body>
		<h1>Czech Foreign Ministry</h1>
		<h2>List of applicants for visa permit in Czech Republic </h2>
		<h3>Selected applicants which have a proofed visa are highlited green color, others with red.</h3>
		<table>
			<tr id="main">
				<th>Last Name</th>
				<th>First Name</th>
				<th>Purpose of stay</th>
				<th>Gender</th>
				<th>Date of Birth</th>
				<th>Proofed</th>
				<th>Phone</th>
				<th>Address</th>
			</tr>
			<xsl:for-each select="applications/applicant">
				<xsl:sort select="lastname" />
				<tr>
					<td>
						<xsl:value-of select="lastname" />
					</td>
					<td>
						<xsl:value-of select="firstname" />
					</td>
					<td>
						<xsl:value-of select="purposeOfstay" />
					</td>
					<td>
						<xsl:value-of select="gender" />
					</td>
					<td>
						<xsl:value-of select="dateOfbirth" />
					</td>
					<xsl:choose>
						<xsl:when test="purposeIsProofed[@proofed1]">
							<td style="background-color:red">
								<xsl:value-of select="purposeIsProofed/dateOfdoc" />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td style="background-color:green">
								<xsl:value-of select="purposeIsProofed/dateOfdoc" />
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<td>
						<xsl:value-of select="temporaryRegistration/phoneNumber" />
					</td>
					<td>
						<xsl:value-of select="temporaryRegistration/street" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>