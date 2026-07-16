Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941543F0B4;
	Thu, 16 Jul 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208064; cv=fail; b=A9235E9muOnDSL90LV0xAVpeHO+5JNK04M4xRt8mRVv44q7UFRM00QWD+xOmxuBJ3LzuAKK/JX5wjIvCmBjTFkcn+QemtUBz0JNp1D8/ki4hYoHyOKmsC7ZBAVO00kEe5Yj6mikRk0lsoHiagmrGuS1ElJNaX0drTkQg5FMQ6dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208064; c=relaxed/simple;
	bh=o+jevgT+Zcdmi1baWb5dcMLsrWc2fq5ECSguJodJGxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mk2hQcaj/ItKEuBLnviOA289afF75q8QtxZq3O/tJ0XvR8n6q4txTF75gFcOYKGFgylybjc/p3Q8FKVWbuG5KzaIjLPxSsPMbEVMEasBtEwuLj2XAESB3oQZFK9/+bxSiyx/eXYF7RIXeI/ICTGFF53yfk9Pe1elu5PxnSC1MxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n2NZyBlb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=T85zOIWy; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n2NZyBlb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="T85zOIWy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G5NiNG191002;
	Thu, 16 Jul 2026 08:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/AjZdlBRghr0g3L0KaSPHYAjD+c+6Evs8YJTF6bMne8=; b=
	n2NZyBlbVpvhBJzsTRno+ZfNeAf2VjLsmc3CvIoDnIjiMH3Th3jiQF5K79MVyJBh
	o1IwHiEhg2PbdzwMm2K0xZmihTkzguhh/VdRtFt20ZWTIlJX54gJT4i+AyJAWMAl
	5WvT4e9nPqNC3gu7CWoUU71BYD8BBRsGgHTzuvaTJNUpi8BtZtccqTOdz9gITavJ
	hcyLoOByq9LGfjn6F/7mygrlZwLLv4e9iGu6jOBr4jhyTr/WGWqZ5yYzK29GWFu0
	SjX0AnB961XX2nlXEeQEC9nBXoNmlBaya4udF4F523WUZjwQ8zPXf/QNI5ezebC3
	vsi+q2mz2OZ//r8Ob1n8wA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023085.outbound.protection.outlook.com [40.93.196.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fq6ru-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 08:20:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAzHtuOut8GHVXI3693dpiLql4GwDI4yTq036KL9EAExYsimMdOdUSUc078WRq4aCb1ku47IUKiSsFIexFPAYwEj0/P+tm5os2rD0S9D4IDz5VEdZh82N9QRMa9utq0Z6l3sfQLo71rNRQruT63GInsvraACO8qBy7oXLoJX/8ztiUhLICSNbzdTwg6C00dVCVZ11EfMOgGOYHENxg1mkRG/2XejyYDyJeSTWVEqLXhpbooFgGGBQhUcffA0A/iHDS02l3mSwzn6J7nAB828iymecWOWNZuha6KpyAC2hNEGdCprF1JHG/R15cAhWrkqqDSj9DFEbJjFS+cRWj/K7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AjZdlBRghr0g3L0KaSPHYAjD+c+6Evs8YJTF6bMne8=;
 b=gYxgcPikUSkCN7fPlO1VVttN7BmU/azN14eAMTzG7bXFLZMQIGKwVoIsd+uhh1I+QldJpBxbqcUWAeeHNtQV+GRi7e2yUw3o6G3mExuvw/dDj3uuirdYQPh3G7dh1ZqqWhYBcd8f4lTXIGLC3cbDesYPMqNw/WB9HjvGtuOGrawe27uAtU6+XRQxIiXiVTg3TM/rnXOkV1Y7viiJzxoOhVVmJXSudOJOb5saoHpoDuarAWG+bnLfsSiIq6iv0k8SVkCHq127aFojTH9eMg8n7XyxyWOSI0p11Dao0W/2CFgax0HD/hGywp7DGNkq2pJdSiHwt8pBChDOF7AUFs1M6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AjZdlBRghr0g3L0KaSPHYAjD+c+6Evs8YJTF6bMne8=;
 b=T85zOIWyDgERKwpvT1fIzPeVvD67eie83CLl8gqq+IeQ+XvnhZWdGz5qvvhI4iMoj7tXV8lIfkELPFrTBlLOwWMZsnCwiExW7w0Mipq+S0buoWLhepj00crO9See/mQXNGD0hUepvzBeRcvRUDdRBbLMQdsvjlMfi0WdNBZ9IQc=
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by CH9PR19MB997442.namprd19.prod.outlook.com (2603:10b6:610:344::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 13:20:50 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::ad) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 13:20:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 13:20:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D0498406542;
	Thu, 16 Jul 2026 13:20:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BD56C82026C;
	Thu, 16 Jul 2026 13:20:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: salman.abusaad@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Fix potential probe() deadlock
Date: Thu, 16 Jul 2026 14:20:44 +0100
Message-ID: <20260716132045.1469156-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716132045.1469156-1-rf@opensource.cirrus.com>
References: <20260716132045.1469156-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH9PR19MB997442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7fac5d4-32e0-4b1d-7546-08dee33d0c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|13003099007|3023799007|6133799003|10067099003|11063799006|16102099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	o2mxVsWALNW0cR/d35Wiq611ORJIb57o0S1epJ3dwTEroyqQq21g8+jKKpcAVm5CAuCQbZBrpZB0+T4soB4T5uds2P5fdRCw7tzpoZ1ZC/nv7XjWkSfgIqAZdF1q7vo3HwkcpDBMTG+V5a3nDCTdZVBk1v/55Xh/xgivtpXnLzc9277nuPDBxLM2Vh9vxYg08VDMKHs1YIEGf6wSVEqfo8npAKkkyFZLgA7/FCtpUyn+EMCpz0UtWNFVvttBULI0/ekBs8JC/7rA0Vel7GldDWwGLLu2gGuqjsTeyjIJPiT5AyYDGuNb7tzR0U4siiUtq/RYp2F9FcT5m+hf00UD7LiFsOvzUvIMLGRcO+aA/nZkEZ3x7v+5d/WB+c6RRelcmoniQau5XlOB2Su9Rjt2fkCJinl46N2GIphoIn89dq/mlgdDzBO1Yi8HdKUE5FbXgd7FJ0rYWxcTOjwl2s6rPdQL4ZcAGJ6Hedw40FSbKXjq2KoBrs66IZxDCy9Q7C0ieg5N7OLC4GzhIqAAvQ/SaQjyau1Bu5vNu1onRfYPI2rkEGLj1Bs42L+8gqfDdCJwizNvO/RGGysiAE/CasO9tW3n/QPSKr7G7l+AO10sbnFJc11Pr/kIB43vgsY+uOBH4osaCukqtR3oXo5FMLnKfhjl7uYV1JYyZFvoNknA5cU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(13003099007)(3023799007)(6133799003)(10067099003)(11063799006)(16102099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VF3/ESwLDdMc5Hd75Gu4DOqJLTAQ3FgoFa+eeXML+l6IPY6IpZ5KCS9XZl+zeMCVrSYzhTJYmf9sCm6qcHv71cq2tBoBVSSCLSjNF/k7TbwmD9Sp9Lf/eaDEOgyxSVjOvg7r3GrmtZ70QxEP9ARa+SqXkyzMw2HnGPBBnciAZwv0QgqyIO2OoriXLOvpmnAFTCLWHIDmSzepN3MQxGMnJfUIvjpY4HB63KuE82mzpZgj+jXLivh4QXE3/Sqk1hnyKYLrcSxtv5u/NtEOWMBwnKvHByQ46/zeMcsuOs6Ls03u3I6r0/aCkjK2HoMk7rSxKC1jDtJPhmIFq4XwpFqgWXw43PjexLTs6wISVN17GD41BryxUT+2AaqsK9rZtU4PabsV9M3skFXOs8D28/qIiXs3+KLJ6lRIkTKC01zO1azYSB9mfZzS4tnDfUQY49D/
X-Exchange-RoutingPolicyChecked:
	j5VXCtegqO4DHd9hDaKzlaLl0NHlfp3p6yWDS0hUz8nLjShPr1Z0c4YdoKUZimhjYU7AvFmG+UCRiEpyGkXWZEXNHh8D4GXn/k9+1hJUEPLJrk951bcFz72nrvtvJ4q9bsCvHK15Nq5UiFLN+hEp+GSeT6u/6BhalI/sabQgsGZAU7SOw7dAiLXe0gwZdvSNRmeNoeoZEpvd2ikn3rL+TlP54OEKSkiKCItWO46Hcva+P6XPSRO3Ow0ztmAbl6U73T5Ux3x/isb7hY+IzMjzBbAs+T97s0tU1/upDo2Mzq5RemmIWD9A3H/7SppZnc2bYtThVqxM6XYW/jX5WPYeeQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:20:47.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fac5d4-32e0-4b1d-7546-08dee33d0c8a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB997442
X-Proofpoint-GUID: lY7bxcBm_LozAuc-VKuxdjIXwLNZZokV
X-Proofpoint-ORIG-GUID: lY7bxcBm_LozAuc-VKuxdjIXwLNZZokV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX9Cb9YN/E933W
 rQSPJNMV7BY/xweYAgGy3h07SaollUms5unx4sfxJEr2Nzn8WQ9PoAjgqWmK+dbiLx/XAQBQ371
 cnn+6ILoD2P9D2LejNIG7aIsRbyGmwE=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a58dab7 cx=c_pps
 a=PxWDB4AEMH6n5vUHjcUMrg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=nUdZw5IBfgss985G4GwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX3viwFsF4zkE3
 F13DhcKZvHB5o4vn2NCyDFgnBd6qE+xCSYm8SO6XI7+Oo7hHM3Xu5hYXj3fQl+EKACK0TE64JXq
 f9hkMYbfwjuTkxXP/LCQLrIUmzO85lirrSACGBojB1hP1xB4jw3rG8TLoSN/C54JVAA4CqK9lkJ
 c2G0KAMJV1DOv7SHFYTLrOjM7Apiiw1E+icrRPS4/xu6sg5BR7GgWE8gan6VGrcLn3vGGO3dAlM
 tJ9S2xuMGRckfIqG1bbArd7u52UkNZjIzwMLuWGBKyInyn2PgwTPNplzA2fhSoAlSancfkCCQmK
 pUVL5vcwEsupnPZrmYORZqgK1QJTcZ0kX9WVJIgDddBZ8BAMdq5ABdnVWNC2h9ere32uAUt2j3W
 4+vjTOak28330/Ll/QQ66XCJ3Pf/caoFkYhBI8R/ZadltQLrdpjmVEcJJagvrZzRPosRkLu+zoj
 O+iyueRL3vck3cz7Gnw==
X-Proofpoint-Spam-Reason: safe

On I2C/SPI call cs35l56_init() before calling
snd_soc_register_component() to prevent the potential for a deadlock
on init_completion.

For most buses all the hardware would be ready when probe() returns,
but on SoundWire, probe() must return before the SoundWire bus driver
will enumerate the device. All access to the registers must be deferred
until the driver receives an ATTACHED notification. But anything that
could return -EPROBE_DEFER must be called during probe, and that includes
snd_soc_register_component(). Because of that, on SoundWire the ASoC
component can be created before the registers are accssible, so
cs35l56_component_probe() waits for init_completion to signal that the
registers are accessible.

On I2C/SPI this 2-stage startup isn't required so their probe()
functions simply called cs35l56_common_probe() and then cs35l56_init().
The problem with this was that snd_soc_register_component() was still
called early. If this triggered ASoC to create the card, ASoC would call
cs35l56_component_probe() which waits on init_completion - but this would
be running inside the cs35l56 driver probe() so blocking it from reaching
the code that signals init_completion, causing a deadlock.

Fixes: e496112529006 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Reported-by: Salman S. Tahir <salman.abusaad@gmail.com>
Closes: https://lore.kernel.org/linux-sound/95c21574-97d5-4311-9263-9e174d22d22c@opensource.cirrus.com/T/#u
Tested-by: Salman S. Tahir <salman.abusaad@gmail.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c |  4 +---
 sound/soc/codecs/cs35l56-spi.c |  4 +---
 sound/soc/codecs/cs35l56.c     | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 0f64ab628b03b..4f6ddf1c5a3f6 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -55,9 +55,7 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 	if (ret != 0)
 		return ret;
 
-	ret = cs35l56_init(cs35l56);
-	if (ret == 0)
-		ret = cs35l56_irq_request(&cs35l56->base, client->irq);
+	ret = cs35l56_irq_request(&cs35l56->base, client->irq);
 	if (ret < 0)
 		cs35l56_remove(cs35l56);
 
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 9bc9b7c98390d..b1eb924a5b6cc 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -44,9 +44,7 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 	if (ret != 0)
 		return ret;
 
-	ret = cs35l56_init(cs35l56);
-	if (ret == 0)
-		ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
+	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
 	if (ret < 0)
 		cs35l56_remove(cs35l56);
 
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index f365f76ce56c1..995e39645621e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -2009,6 +2009,16 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 		goto err;
 	}
 
+	/*
+	 * On SoundWire the cs35l56_init() cannot be run until after the
+	 * device has been enumerated by the SoundWire core.
+	 */
+	if (!cs35l56->sdw_peripheral) {
+		ret = cs35l56_init(cs35l56);
+		if (ret)
+			goto err_remove_wm_adsp;
+	}
+
 	ret = snd_soc_register_component(cs35l56->base.dev,
 					 &soc_component_dev_cs35l56,
 					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
@@ -2023,6 +2033,11 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	wm_adsp2_remove(&cs35l56->dsp);
 
 err:
+	if (pm_runtime_enabled(cs35l56->base.dev)) {
+		pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
+		pm_runtime_disable(cs35l56->base.dev);
+	}
+
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
 
-- 
2.47.3

