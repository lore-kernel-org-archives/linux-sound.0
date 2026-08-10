Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D553B8D40;
	Mon, 10 Aug 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359664; cv=fail; b=g6+fcrEDt+opm8lF2qE+Wz1ilPBswuNWgv+NFRjofFvHa+6rG8py7f90rXnvaluevC90ijbMdbBzBqnsl5Kp1Sp56NQGVKZSzyXCTKmbv3NwuDf3O9t6DZlhXZewwRiCkxIVtNE9XFiJauGWarSj+vpIhivlMOHpF7Qw6ukb43w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359664; c=relaxed/simple;
	bh=gQl97cugqc8iZlPVWjzNSL0ASQMvV8LncPIOwOvpGNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gtW2sEQPhOSjCwgA5BBO5r8Hj3KOeViApH7xH9WWdbpNduSXePRbuZ+vTwRLQEvZN1/3Y596fObNWZx/rAxUMtaV1NLJnoYRjql2NulcljFHhuTuCCmbnhJuLHdytzYFfpgItmie2pMj7tmz1lGqDVgpf/X4R+l3XVB9tDQ1LBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HVnSRki4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eA9shto9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HVnSRki4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eA9shto9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5Bvx32119648;
	Mon, 10 Aug 2026 05:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9wrVwvNP2k2NFyJ6Irrm7cieHRgLKNPmvoWbOHfCsLw=; b=
	HVnSRki46EEQViXSciNJPCxE1UU7kohwRhm59ZpD2IFnpuJmoHhtWPFkDYVolhJH
	CirMWW3n8pz2JdRyF5vs6D1B/7PLXm2hdE3Q3SidAsh9ybriFgQa6H3mGoPeqxmF
	s/g5FftukIM9WtHD8i/moDqoLK1fJ/M1KMTuTUITB+EPfGdUuWdOnuk8bpoVV5Wy
	3MFZ5CA+l3FLlNGsFjAYcQyhumOKlsV72Cx7lEvsYUEKTgjghAlU0TsELDeXqaY1
	SQCoybJkaz8pecrDsNzXXm69eFFPT8CD3/hUFxGzsbn8JnsVdPLloEa5TfNbxg41
	fnD0XP8fHZiz6o/DAgKGMg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020074.outbound.protection.outlook.com [52.101.85.74])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg2ect-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:40:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5TlX0J1dlx0xI63st1cCavRuYCH16LRnR5q/XHVW6NDA+MKpG4w5EP+MJcQYpka93VCyl5KPDkavqXFDCVjcs8oxuF7BmeW1Il3786beVbEk7lyzjPqkyaxlNbjgV5OWusqGVTB9HDOdojibqMB1+Zv32VGhXaLM1nhV7md869QTcuO1aQ+oqrC8PtUSDMekWM38hOuOufgB7GKVrEZwFHGLCiK2DwBIhF8z1UGEAfsbPROoU8tPBDxaMKyEXpkyuAu2U6EMdXEDxVpOFmdB6L5PJ9+chfbV5fIpAjZhucn//ozxA29ygr6b3owVXvez/zKQZAwwtzZFaeo7YrBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wrVwvNP2k2NFyJ6Irrm7cieHRgLKNPmvoWbOHfCsLw=;
 b=CotsgNQfhLUiYEMBAofM47tHLbVvAHYxrJvYyUUExvtRwdu6c6/REFykcbkCgCkgN2a8BGxR6UmiWyjr4c7aFqYU5g1zMQJXzR2bbQ757dIJg4TKcxywJAt9VDOF3JR8LWT6sPeH/Gb06aoqtkKHqMgecFYOmT+rV08b0dvTO4ImQtP1ewvZ3ZeIUQ7wGqDuGIhunnvfHl3SZTEVVbGffo6Ousgaa0R1I+2pn0WAQErZm2isYy9TfHCyAjBVaEpUVDfdH3Xw3YiyYxA4Sj1yLURyB8WWx+VsQgzx+nVUdYubV43DIM7HHMj2JEmpax83XR41e06fZsPNu28rJ/86/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wrVwvNP2k2NFyJ6Irrm7cieHRgLKNPmvoWbOHfCsLw=;
 b=eA9shto945ht2gpFc1vG50fmJT9HGbgemjB5z81jTAr3Dc0mFIKeMg0+T3WrNp4LCwcBS+TNISYEJhuaZVtqAip3NrHM1JJrsQFxfwNAcqyaIxrOl2rFgwowtHIzK+4t0snmhnlDZKT9WGVjhsJyzpsjP8K1D5bLywHH5Yp6yJU=
Received: from PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::6)
 by BL1PR19MB5867.namprd19.prod.outlook.com (2603:10b6:208:397::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:40:48 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:510:348:cafe::a1) by PH8P220CA0028.outlook.office365.com
 (2603:10b6:510:348::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:40:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:40:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C113A40654B;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9ED27822542;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: cs35l56: Request IRQ in cs35l56_common_probe()
Date: Mon, 10 Aug 2026 11:40:42 +0100
Message-ID: <20260810104045.60701-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810104045.60701-1-rf@opensource.cirrus.com>
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|BL1PR19MB5867:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e65f2571-34be-46e0-6b2f-08def6cbd6bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|82310400026|376014|10067099003|11063799006|56012099006|3023799007|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dN6XOTaTfYrimTTbC/VohLM7pvsnV4LHcPOM9ot2wSfyd4sIZwaolwR5QLp+TSJKWuijmv6rI4+PQyF25zXwA1vKZRQ50hXPPPkKt+pWyklGlpFaosq9P4UrxlUlIWtF7klskoM1gqiiHNEd6jnmRfW5EHowp2E0RXO9AAUCk4jsv5E4P7jTuDJB2wQ45A99wzGDm4ysPf7av8+2wL4xoG/4bzxJFG1dArw2DhWJaD3IAhIxqQsgK1OloXZOdmgkeVNltZ0m75syAGp5oAa2McdQ/SR5ZQSUX/eaV0bWyW5PaD4583DsiLI8Bz9HaPyZ9vNxbSW81upe64HbIP1f7BOTiYgKvlg9cvmyPe5s2QdvTZ6HMT6R0iJH2Dwf80DtHoQcNuklF2AwYZtXSdxdaIxtmRhhna5QMuZ3xJd3g17ziYLbaBagjAiEdeCFvAFeamcZ8xqlRfwX7++L1eng9ek5EYnD2B71JCa+nQjyJgAqZOHsECGL4/nxFTz2RXEgbGt0unL8K5UgpItJhvfTQrplVUDr+zPdyv8XNLGMpDBQTy6Cc8JH1LLHRh88MTKAoIXZ6Hon3jLtgXeaVA5zg/k5ww247Ceqy7Snarni87Ft6ERd/OKPsYwcNUfk35yS892eZAX6S15jOttXzTMdsGAT8WX1UgXRnldknnj6/It18RtQX2g2FvduhwIWM6DzNb/t47qOEyzTzyjmX39PYQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(82310400026)(376014)(10067099003)(11063799006)(56012099006)(3023799007)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JRsjeCWhbJg2mouulQ1h1dMwpms2GA6yLiZ9SDfdGgSXLhLipiyctUPwfyYk8aDS2qYb/uiEA+58YCL0FFMw0pIpYb6nOAYoXJAjW4669d+r3t2UkOHFSN0TijSsQ/prnXLK8WiGNlu24ppZChB4U1wB02LpgIEhtkEBAECnNRiU7KaDK+BTduREm3ASWvI/JRA+olO/ui+tAfFPdHdbK/sBhiZzZsaTt8p6g/4zS1pOQcWWdeyq5CzXpVQXBjBVC21UqD4lQpt/8kTMlmswxV2i+9gBSihjcmnPrJHMIYCXUBj8GgzqlHzNXvA1/M5WFtmPZgxdHntlUSRJIJEqdUb5bh1D9rvoHQqtODrDRROCeXoNNOYlaMxSaRH+dO808JhzXfksYEnUstYFjdHttUXOYViWyuGrGlALprVtgGTixiFv3DaCi3KGpfAbw0U1
X-Exchange-RoutingPolicyChecked:
	EqF+iiHc/AWqdhFcB0QPG7XxJW5cfDM+42OB+2ZjBnfAauSTbZItwjKLpMRdqe1vSnFWxk+3bcmVNuA6zplNLzDo2J9uw9YPz9kc49/eQlQkXfx3G+xaSeV2BapBMCpbHqlXbpTNg1bMKoH0F/Xkgjz12SeM4JFAsKD5kmxsvdaeaEKeRMi4l3CtOvNjJO5YiR6ZwaqsmbT1RzctWU5KaSbOT9WyzyVhBPt5SzRGfR3Z0MQnmZVgfdFOPZWxAWSGB/DIGmlM4lBOZXRf9oRry7f5qxK1CN1kE7H43IIViiIlU00tFohHsD0IoBOvzK4pj5QW/VuzAQy7IB7Gc3Pmkw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:40:47.2017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65f2571-34be-46e0-6b2f-08def6cbd6bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5867
X-Proofpoint-GUID: HOU5kwfiztuhj-2NVwYmpd6BsqccDBC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX/Or/WcrQwuO1
 IBkuVof8I32pWoDf/QfLWMyNyefYsSBVXWERJ1/F4AWJcAZimdxtY7LEYmKJhHPd1YZYuEgz+rP
 dTSq2beejIwecVbmlvuRokJTx/CMUsc=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a79aab7 cx=c_pps
 a=BkzQgYdJoksvgi0GI1zv2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=jG_iBcyMVqCeCAGu60AA:9
X-Proofpoint-ORIG-GUID: HOU5kwfiztuhj-2NVwYmpd6BsqccDBC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX+GlOUw2MwoWi
 96UXBHC9LcUgOt3uRCWBQmyrLBBEIADOXvG4Ym0nJHYSf+uLFAehrTGrTzi5ru+A/MsoNg26HSg
 kHiVZ4y9o7M0b7N/z6xU9nsP1Kxvb3M2PqfhlXfhKOOxVVupuqf8WGAtEAFKd04vIT003Ov60GT
 Gc7L2pihi/3ZR8Rzi8nU5oZz+av+Dh37lh/ASML2b0dKYy9g6kughUVDODP+xKixcZbcZjKnYOp
 uctGHFtdgQLvyC48SnGBGxTe8mVWXh3O1zkegHwBlrJo5FTg9uICLwAb4gZvjp80/LocjKPq4es
 1/k/o6PZWdm7n9BPF3XyP9H+XdfoFFkEVe7lekhOu4puoUdaooemQRN5Pmx22fao4gBhxn1TgEa
 4uxQb8x5SHgxjRz+PjeSrhPvOzQiVPugVcckg1YMjkMtCyMp8XM+40nQCM2Sp6J25eb8+0aKRkc
 tZi3Ei1gMCbjxoEUTEA==
X-Proofpoint-Spam-Reason: safe

Call cs35l56_irq_request() in cs35l56_common_probe() instead of calling
it afterwards in the probe() for each bus type.

Calling cs35l56_irq_request() in each bus probe() is a legacy of dealing
with the oddities of the SoundWire framework. It's no longer serving any
useful purpose to do it outside of the main cs35l56_common_probe().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 10 +---------
 sound/soc/codecs/cs35l56-sdw.c |  6 +-----
 sound/soc/codecs/cs35l56-spi.c | 10 +---------
 sound/soc/codecs/cs35l56.c     | 12 ++++++++++--
 sound/soc/codecs/cs35l56.h     |  2 +-
 5 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 4f6ddf1c5a3f6..5e69ddbe342a1 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -51,15 +51,7 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(cs35l56->base.dev, ret, "Failed to allocate register map\n");
 	}
 
-	ret = cs35l56_common_probe(cs35l56);
-	if (ret != 0)
-		return ret;
-
-	ret = cs35l56_irq_request(&cs35l56->base, client->irq);
-	if (ret < 0)
-		cs35l56_remove(cs35l56);
-
-	return ret;
+	return cs35l56_common_probe(cs35l56, client->irq);
 }
 
 static void cs35l56_i2c_remove(struct i2c_client *client)
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 303d37e7d0bfd..14bb5d1793d33 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -484,11 +484,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	/* Start in cache-only until device is enumerated */
 	regcache_cache_only(cs35l56->base.regmap, true);
 
-	ret = cs35l56_common_probe(cs35l56);
-	if (ret != 0)
-		return ret;
-
-	return 0;
+	return cs35l56_common_probe(cs35l56, -EINVAL);
 }
 
 static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index b1eb924a5b6cc..21b18da9e73d1 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -40,15 +40,7 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = cs35l56_common_probe(cs35l56);
-	if (ret != 0)
-		return ret;
-
-	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
-	if (ret < 0)
-		cs35l56_remove(cs35l56);
-
-	return ret;
+	return cs35l56_common_probe(cs35l56, spi->irq);
 }
 
 static void cs35l56_spi_remove(struct spi_device *spi)
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0b7b080939a18..619be47060a43 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1942,7 +1942,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	return ret;
 }
 
-int cs35l56_common_probe(struct cs35l56_private *cs35l56)
+int cs35l56_common_probe(struct cs35l56_private *cs35l56, int irq)
 {
 	int ret;
 
@@ -2019,16 +2019,24 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 			goto err_remove_wm_adsp;
 	}
 
+	ret = cs35l56_irq_request(&cs35l56->base, irq);
+	if (ret)
+		goto err_remove_wm_adsp;
+
 	ret = snd_soc_register_component(cs35l56->base.dev,
 					 &soc_component_dev_cs35l56,
 					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
 	if (ret < 0) {
 		dev_err_probe(cs35l56->base.dev, ret, "Register codec failed\n");
-		goto err_remove_wm_adsp;
+		goto err_free_irq;
 	}
 
 	return 0;
 
+err_free_irq:
+	if (cs35l56->base.irq)
+		devm_free_irq(cs35l56->base.dev, cs35l56->base.irq, &cs35l56->base);
+
 err_remove_wm_adsp:
 	wm_adsp2_remove(&cs35l56->dsp);
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 9acd2e7e17c93..1ddee9ab6a876 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -78,7 +78,7 @@ int cs35l56_system_resume_early(struct device *dev);
 int cs35l56_system_resume(struct device *dev);
 irqreturn_t cs35l56_irq(int irq, void *data);
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
-int cs35l56_common_probe(struct cs35l56_private *cs35l56);
+int cs35l56_common_probe(struct cs35l56_private *cs35l56, int irq);
 int cs35l56_init(struct cs35l56_private *cs35l56);
 void cs35l56_remove(struct cs35l56_private *cs35l56);
 
-- 
2.47.3

