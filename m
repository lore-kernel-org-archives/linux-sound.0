Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92453CC9EB;
	Fri,  6 Mar 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810959; cv=fail; b=DLe4FED4w1Ylj5CL+c9rhY5dIUcQXFzBmyMalJq/BYsWH6eJnDohN++nObzxctRnc7L+1newQ2GaYCUwgJmvYuP7dZmedonV+qPIoNEGlq2rqGYymNUPgHPp5CFj/FMFukMl+yB0z9teom6JdXx3jsUWJPg2XX72jX5VaCFGpOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810959; c=relaxed/simple;
	bh=OC4vjaXbkzsAjGsqbfz9uL350JCfSCxtEg+Gy4Hf1S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmQSQMVxWnniY+Qjx2ODRFIm+xx5IR/bu8l0iR/2XrUFHPJgX7/VFTJ+WWXaj19ABBYOIrqJoRy35qjOMoMyzJqtai7ZT+EFlsyuSjxlSBZS7F6ckwMNgjPEl2Y0LibSSeL+6LV8M94ekaE4HTzkH6za1fUTMERcTHJwh7JLxI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oRJvrmFB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AhfigpXm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oRJvrmFB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AhfigpXm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626D4sdm086000;
	Fri, 6 Mar 2026 09:29:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=enKCZkWDypeedM/B/EckP4dFDCuF7Sj0qSaeM32Tx/k=; b=
	oRJvrmFBv18G7xjd2MUqFZ/jnKM350UHBPn9rJ2uIKQIQKTLlVVoHh35OpT5gpca
	UKQjZHPNJSMWseJPfO9YlOFOufxUVLB7iDFQ4fYLK87IdZudNLs2Loeehre+Asi/
	sW2CGFUB/AF32gv20l112LNwkIyX2c+OB8AerYukJyM5VOd5OeAFJdo7NKE0lxnC
	J46QQfcqY7pdMdS/Exdav8cE7ALJsLeb9i0/nQxGuGdQGqsj57Z8S+pZ4oUX/7Pn
	DEvAsvgNiRqiz7wGnPXQTh0AB6xzqZDqyZjmyLUdGZ8kH/o96xASUmq7otxqJLgu
	Rkxcbiy5lnytPBklZmDkCw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021082.outbound.protection.outlook.com [52.101.57.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cqyg886et-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 09:29:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AApWfMof1gZHpDcjZv2LPwK0hurV4d6HbqeKM+UJXCFxDx8d3SN6uiWDOTgjQjb2kh8peDa25nLo0ojb/RkW5ErKYrQfDC6y1oUX1IZUhpY0EyljFjqKm6GpAIgmt74MD2SebqS+GssLVFSY+IhM/x5XKrtcJtlmlvTGihPA3AyEUYtvPYFcVkmjRaRDBtJeVfrKIBVYTXSCFShm3DS0GLg2QmOrsTOj5DW39zpzgtDzD9RLt7Zm2+PvwkxXi7OLjf/TN7c5PuTd4gRsa8NfoTUB8UMj3EiRMGTKhpcle1iY1iqb/eMWkWb68ALAOah7PuG4xl4jmgn6DWfAA/I8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enKCZkWDypeedM/B/EckP4dFDCuF7Sj0qSaeM32Tx/k=;
 b=dHgAUsEZaUhaasajhFYMf/nuBw0wa/GQ0N1JxXk28FkZtqOzy8WgigzL+2Zjhn9ECCP5HhK1F8SZS8p/3ovScP7dw5DISvVPntmFjqS2KZRRlm4gTgK2JBaV5q+lsldKGjFfJNAguj44hxD5FsOCpGsXYp6RuXkYNkkeQjSscMzw9svpTV1Quy7Kx0WwBPJAVBc4HN6AxzxhBu4yOas3mU3yx2k2GECHoEbFZeoQl9G8DFsf2KNxazg1oV7r3d0veqwZGcfl5pb1TXCXqYU8fq96aPNS1KYsM8r6lfsSMGbGmDq2+xjUzjUxrCfzTrRhsVawdSo2dMJfg8n3v70Oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enKCZkWDypeedM/B/EckP4dFDCuF7Sj0qSaeM32Tx/k=;
 b=AhfigpXmcFYNtUFj3fvrtFYqRLuwP8gBX5fc4D3pXbeOxAWke6aJTLL5ERLuoJx1QaZju63xwxqivW9PWtc/WnxUmoscluEjU70fNH/StUP/y+JQaq8pIZfivL70WxxeXXJZgM5cfwT5WxZcDO8Y8VE3mPZNJZ9WLrA//EoiK84=
Received: from DS2PEPF00004552.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::51a) by PH7PR19MB6460.namprd19.prod.outlook.com
 (2603:10b6:510:1fc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 15:28:51 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:2c:400:0:1001:0:8) by DS2PEPF00004552.outlook.office365.com
 (2603:10b6:f:fc00::51a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.6 via Frontend Transport; Fri, 6
 Mar 2026 15:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 15:28:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26709406550;
	Fri,  6 Mar 2026 15:28:49 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F311D822542;
	Fri,  6 Mar 2026 15:28:48 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v5 3/4] mfd: cs42l43: Add support for the B variant
Date: Fri,  6 Mar 2026 15:28:10 +0000
Message-ID: <20260306152829.3130530-4-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
References: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|PH7PR19MB6460:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 573c1cad-ced5-4454-7ecd-08de7b9511a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|61400799027|376014|82310400026|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info:
	zKAEfX8/bfX97rwdPgbFHx6lyzNmlZanMTH/rKO6ZD2f/xUbtHdJvr5JGUO5ul7a1A81U5XM/WiJKeyTYw0qBP1x/l1M6hdinxT7NyygkUKt44ysRrc2zNLc+yg2KZ9cgc2qOnZCyxTuJM4M0jXnG4e2OntIVbPVSABuIxQFeKtLbpXS6E6uriszCz53pQJ3whChMBkFQGJ4elZVy06ifhAwppAxADNSbTPYtY7btwFUIK/9Qdi461pCUue9o0Np1HkHuUfX36Lbnt2ethzKQu1s5WKYtc5GtdgTMxThuropIqwioJK6a7w/IiKMtCuurx9VvNxgIFNDNeYSfqCi8Xz6//F9CLfNPyyM0o5W76ueiI1G24ewe3rGv+ccyQauWTQSHLTsfx5i3kGQ3SSes+QcJncm/JPhlqLazzfzMSOHDLodklzVAS7T28/cREVyiRgKelw4C/nWLT6WLSVRYy46YgxKLwcdpPCiXVpll/m4ZddClmCuuMoaBhouBnRkOTCB6QWLFv8/8tHn3HIR4eifMB4Po3Kv78aC8UFKMPM4ki8IHRrkIpV4rukHfHbtlZR8W+U9VTbuHW8JtrQxklSukn3UFX1Q+UBcUyJaDOLDyDOU7fA/7qGNt5v+0mODW8wEo7wMhZT1eiQX66mtB7oBdBC4sjxtExGufmlw6qi/dQs9d3rfZrFZ5nWR8ub63muKYe3QfeJWYEYb8Sh1G4vpbQnWvA/jwP2mwLNcLHnzd9HN3asU/4h0EbopgYK5p55bEpWyRpf3Z4sf6GRcww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(61400799027)(376014)(82310400026)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CH7zYmEZ48uqOWcpKKOg5kWcbRfzkaql+EPG/R8NF5504J0+nEAZuVJHm8fMMxpdN4G0JjpGdRi/gANKPxYJjTXA5JL+lokpZFBOWJo/M0UC2zdTJ8Sy4g+5VkLkHxVwBhkhxElbyCy9sRY6X9FKJsTnjsdn+vDdQvXrn4rUmAU87wOgvabN4x08wPhrmDK34JTWYWkCVBV7aHaqpPmDlsHJcAlMlIIyhQZoGRR3tbvDdQGi01HV5Ob0oxTM4YxK6HHhx1AvrNqCpMjL7JEPAhGkvgwdaurbKQPX2xyJAAbsh1OuOQbzJxfqsIAtTCu+0nehM/u2GQxKpZequypDGHZBanh+kXeKEuLQIMSjf9patqcE72rhhCIw3KzIVoSEoUTcl3w2xBgBfUHrHEoUtv0tET15+tHwM0yP4w3gBM6vB3vJo/aj2GpK6BMsJhkb
X-Exchange-RoutingPolicyChecked:
	kYU3gOHLHzd1mpu42eYmWLO1jZDaVelBWyrXMgUEKNvi1A4FCBtwxFbHqRj/XNVgTKoQYsCqTM0tejXNSJTEU2osSpaTtT3yuY+GD23Wjl0eUkJ693dxD9e7PaeAgRpWREXLjWTf19Wq8LSCtuP2DqanPecnu62DOXPifWhMlnhHsEUQ2CZ3TH/KoUr2E8xyyIfJPR68957c6R5vkabFH4Unkuqv5YZBEusdSrJDj5eNKZ6K+3OibHEfvVbOOtk7Q9dCtMRXBd8H+LtJkE+z6XR+FAHZ+S+RsxAnfltCJacbTgH4L1IRkgDGwF/bDE2XeiQa4uhZB6ZtZd3MxjPB2w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:28:50.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573c1cad-ced5-4454-7ecd-08de7b9511a0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6460
X-Proofpoint-GUID: AucwBGNnj7A7UNxHo4ibFSH_mBiLjxqO
X-Proofpoint-ORIG-GUID: AucwBGNnj7A7UNxHo4ibFSH_mBiLjxqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NyBTYWx0ZWRfX7wzuIjc11wKE
 AC83omX7OPHhffjoqTvENhOVjSVUgjYFF5QmwozN9A+KanH7oJTDdUt4zWV5Tq4zQqWt4/sE16X
 jQdX1ZPcY281N1f1ClYbTkHVCD7Bu0nyBJ8ASrBZbPSemdyS0FCy3Q9z6La4yOCCTakUwfJzAvZ
 Ar67s562k4AQNHzDFZOy3HYl72Fxw9uftWAqKDUzVYjRYFCKRw578nP7cLQpijsP36ejk6bEQbJ
 lP72py965m0k3lE8/aRD4lVogSLO6BUTk8X7aazz7AVgCFeCMDnbml49p10R7s4fw48ZIxYnNyM
 Cai4rCRo8ms5tWK/TmbZT95l2jB8VW/GFc1TEWIxywjOnpal4N649m57wrJV0EfeswXO/2KOrTh
 aSmR6qTvxSLCbNPOQyJ+O0vforTupEc6pxRokgGNKyKSLFM03x64vttz51QkGTZ9Zj+tfd8XHg/
 jDFODK5kvGjMJlyH3uw==
X-Authority-Analysis: v=2.4 cv=IIwPywvG c=1 sm=1 tr=0 ts=69aaf2bc cx=c_pps
 a=ub9VQ7IHc6Y/4yCKmbqoEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=XPwATKmoEvXA9jVZorMA:9
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v5
Changes in v4:
 - change variant_id to long int
Changes in v3:
 - fix incorrect type cast (long -> int) in cs42l43-i2c.c
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
---
 drivers/mfd/cs42l43-i2c.c        |  7 ++-
 drivers/mfd/cs42l43-sdw.c        |  4 +-
 drivers/mfd/cs42l43.c            | 93 +++++++++++++++++++++++++++-----
 drivers/mfd/cs42l43.h            |  2 +-
 include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++
 include/linux/mfd/cs42l43.h      |  1 +
 6 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index a2ab001a600ae..0a0ab5e549a5a 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -47,6 +47,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	cs42l43->irq = i2c->irq;
 	/* A device on an I2C is always attached by definition. */
 	cs42l43->attached = true;
+	cs42l43->variant_id = (long)device_get_match_data(cs42l43->dev);

 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -58,7 +59,8 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)

 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id cs42l43_of_match[] = {
-	{ .compatible = "cirrus,cs42l43", },
+	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
+	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
@@ -66,7 +68,8 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);

 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", 0 },
+	{ "CSC4243", CS42L43_DEVID_VAL },
+	{ "CSC2A3B", CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 023f7e1a30f8c..794c983781750 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -178,6 +178,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *

 	cs42l43->dev = dev;
 	cs42l43->sdw = sdw;
+	cs42l43->variant_id = (long)id->driver_data;

 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -188,7 +189,8 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 }

 static const struct sdw_device_id cs42l43_sdw_id[] = {
-	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *) CS42L43_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *) CS42L43B_DEVID_VAL),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec4..166881751e698 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -115,9 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
 	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
 	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
 	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
 	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
@@ -155,8 +160,12 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
 	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
@@ -169,10 +178,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -269,6 +282,8 @@ EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");

 bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 {
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CS42L43_DEVID:
 	case CS42L43_REVID:
@@ -292,7 +307,6 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
 	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
 	case CS42L43_DMIC_PDM_CTRL:
-	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
 	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
 	case CS42L43_AMP1_2_VOL_RAMP:
 	case CS42L43_ASP_CTRL:
@@ -387,8 +401,16 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_BOOT_CONTROL:
 	case CS42L43_BLOCK_EN:
 	case CS42L43_SHUTTER_CONTROL:
-	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
-		return true;
+	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
+		return true; // registers present on all variants
+	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
+	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
+	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
+		return cs42l43->variant_id == CS42L43_DEVID_VAL; // regs only in CS42L43 variant
+	case CS42L43B_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43B_DECIM_HPF_WNF_CTRL6:
+	case CS42L43B_SWIRE_DP3_CH3_INPUT ... CS42L43B_SWIRE_DP4_CH4_INPUT:
+	case CS42L43B_ISRC1DEC3_INPUT1 ... CS42L43B_ISRC2DEC4_INPUT1:
+		return cs42l43->variant_id == CS42L43B_DEVID_VAL; // regs only in CS42L43B variant
 	default:
 		return false;
 	}
@@ -597,15 +619,27 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
 {
 	unsigned int need_reg = CS42L43_NEED_CONFIGS;
+	unsigned int boot_reg;
 	unsigned int val;
 	int ret;

-	if (shadow)
-		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		if (shadow)
+			need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+		boot_reg = CS42L43_BOOT_STATUS;
+		break;
+	case CS42L43B_DEVID_VAL:
+		need_reg = CS42L43B_NEED_CONFIGS;
+		boot_reg = CS42L43B_BOOT_STATUS;
+		break;
+	default:
+		return -EINVAL;
+	}

 	regmap_write(cs42l43->regmap, need_reg, 0);

-	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
+	ret = regmap_read_poll_timeout(cs42l43->regmap, boot_reg,
 				       val, (val == CS42L43_MCU_BOOT_STAGE3),
 				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
@@ -644,13 +678,25 @@ static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
  */
 static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
 {
-	unsigned int val;
+	unsigned int val, cfg_reg, ctrl_reg;
 	int ret;

-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG,
-		     CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION,
-		     CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		cfg_reg = CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	case CS42L43B_DEVID_VAL:
+		cfg_reg = CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(cs42l43->regmap, cfg_reg, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
+	regmap_write(cs42l43->regmap, ctrl_reg, CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);

@@ -740,18 +786,32 @@ static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
 {
 	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
 	bool patched, shadow;
+	int boot_status_reg, mcu_sw_rev_reg;
 	int ret;

+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		boot_status_reg = CS42L43_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43_MCU_SW_REV;
+		break;
+	case CS42L43B_DEVID_VAL:
+		boot_status_reg = CS42L43B_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43B_MCU_SW_REV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	/* Clear any stale software interrupt bits. */
 	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);

-	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
+	ret = regmap_read(cs42l43->regmap, boot_status_reg, &boot_status);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
 		return ret;
 	}

-	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
+	ret = regmap_read(cs42l43->regmap, mcu_sw_rev_reg, &mcu_rev);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
 		return ret;
@@ -918,6 +978,13 @@ static void cs42l43_boot_work(struct work_struct *work)

 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+	case CS42L43B_DEVID_VAL:
+		if (devid != cs42l43->variant_id) {
+			dev_err(cs42l43->dev,
+				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
+				devid, cs42l43->variant_id);
+			goto err;
+		}
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index f3da783930f53..a0068f6572e2c 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -9,7 +9,7 @@
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H

-#define CS42L43_N_DEFAULTS 176
+#define CS42L43_N_DEFAULTS 189

 struct dev_pm_ops;
 struct device;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index c39a49269cb7d..68831f113589d 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1181,4 +1181,80 @@
 /* CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG */
 #define CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL		0xF05AA50F

+/* CS42L43B VARIANT REGISTERS */
+#define CS42L43B_DEVID_VAL					0x0042A43B
+
+#define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
+#define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
+
+#define CS42L43B_DECIM_VOL_CTRL_CH5_CH6				0x00008290
+#define CS42L43B_DECIM_VOL_CTRL_UPDATE				0x0000829C
+
+#define CS42L43B_DECIM_HPF_WNF_CTRL5				0x000082A0
+#define CS42L43B_DECIM_HPF_WNF_CTRL6				0x000082A4
+
+#define CS42L43B_SWIRE_DP3_CH3_INPUT				0x0000C320
+#define CS42L43B_SWIRE_DP3_CH4_INPUT				0x0000C330
+#define CS42L43B_SWIRE_DP4_CH3_INPUT				0x0000C340
+#define CS42L43B_SWIRE_DP4_CH4_INPUT				0x0000C350
+
+#define CS42L43B_ISRC1DEC3_INPUT1				0x0000C780
+#define CS42L43B_ISRC1DEC4_INPUT1				0x0000C790
+#define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
+#define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_SW_REV					0x00117314
+#define CS42L43B_PATCH_START_ADDR				0x00117318
+#define CS42L43B_CONFIG_SELECTION				0x0011731C
+#define CS42L43B_NEED_CONFIGS					0x00117320
+#define CS42L43B_BOOT_STATUS					0x00117330
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_RAM_MAX					0x00117FFF
+
+/* CS42L43B_DECIM_DECIM_VOL_CTRL_CH5_CH6 */
+#define CS42L43B_DECIM6_MUTE_MASK				0x80000000
+#define CS42L43B_DECIM6_MUTE_SHIFT				31
+#define CS42L43B_DECIM6_VOL_MASK				0x3FC00000
+#define CS42L43B_DECIM6_VOL_SHIFT				22
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK		0x00380000
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT		19
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_MASK		0x00070000
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT		16
+#define CS42L43B_DECIM5_MUTE_MASK				0x00008000
+#define CS42L43B_DECIM5_MUTE_SHIFT				15
+#define CS42L43B_DECIM5_VOL_MASK				0x00003FC0
+#define CS42L43B_DECIM5_VOL_SHIFT				6
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK		0x00000038
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT		3
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_MASK		0x00000007
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT		0
+
+/* CS42L43B_DECIM_VOL_CTRL_UPDATE */
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_MASK			0x00000800
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_SHIFT			11
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_MASK			0x00000100
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_SHIFT			8
+#define CS42L43B_DECIM4_VOL_UPDATE_MASK				0x00000020
+#define CS42L43B_DECIM4_VOL_UPDATE_SHIFT			5
+
+/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
+#define CS42L43B_ISRC_DEC4_EN_MASK				0x00000008
+#define CS42L43B_ISRC_DEC4_EN_SHIFT				3
+#define CS42L43B_ISRC_DEC4_EN_WIDTH				1
+#define CS42L43B_ISRC_DEC3_EN_MASK				0x00000004
+#define CS42L43B_ISRC_DEC3_EN_SHIFT				2
+#define CS42L43B_ISRC_DEC3_EN_WIDTH				1
+
 #endif /* CS42L43_CORE_REGS_H */
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 2239d8585e785..ff0f7e365a19f 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -98,6 +98,7 @@ struct cs42l43 {
 	bool sdw_pll_active;
 	bool attached;
 	bool hw_lock;
+	long variant_id;
 };

 #endif /* CS42L43_CORE_EXT_H */
--
2.47.3

