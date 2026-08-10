Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7E3BBFB3;
	Mon, 10 Aug 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360265; cv=fail; b=DKqXC85vfewx39DL7a8Z+O/KueuziR418G2pnUym60KMN6BQQnygyL+c6fiYtPAubqkj2tP9T+uzd8ayR/gzgXwfQ51YjY+JZKt6NeL6LVelTIqo+fssqLbsQQ0U10CoTdodQk8Dw/erSFkthdU1mlpbs+OFUFtPBnRPNrvRODk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360265; c=relaxed/simple;
	bh=jZZql+1IVO+G+gs7hujFYeKabFyAHTZJGF2sdAom/tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RfX1dDPODiu6Ich3r2wNZQj4oHyhKDeiyM+ceVdW7uWNUl+Ad/rHkvyOiqsByzdqRAnusjWS8shTCMRCGFTgtZAtPaLCm2ljC5JXwdxnyC94KtWpxi8ki+ewIbuz7UbsDYaCPhyR5ek3nygNDJljNPb8q7AKRGqASAfRqZ8Spjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oLFJgSfU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jFbCYKzx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oLFJgSfU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jFbCYKzx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4lRUr2078003;
	Mon, 10 Aug 2026 05:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7nIO0/d0AeLkPG40iTPQtIvIuWkR/mtCb4GK3k6P+/A=; b=
	oLFJgSfUDFYw2C6a4yrxe8K7HELb+8dnGoqlUn6K5oJWgHUs9A5KVpCUzQ7M4XxN
	yAl9H0aDNj5fBuPPoYAS1FXItmSGxSwnRxObV74K9ls+OyBa7faLVIlO0WW3SqMT
	mfPC52tAW1qHqS/85aqQqvFFwvD67emZtgYB5Bz/0KSJGtut+l27VmitB2IWIAVN
	xCfjmyKOafIqyToyBCqik+kHhfELXPbuenEY4NE6JbzSIY1yjiAssnGdMn84Eo8V
	AHPx8UMPEVrGBU/TadHVWswhfrXYGG2tbYzSXErxITTThZFZFijhk6VODsoUvCId
	mVtb25xtBIymRLJC/OpLiQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021076.outbound.protection.outlook.com [52.101.57.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg2ecq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:40:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPk5mN7MBiqS+/WFrnX/TszvaCtSLPrL1AiAwC3tmQ31zutMI/Kga3GIetQz/FdY5MZo12pavuKxuoVQ8AwFQIxMhBQeVVDBlMkSM1CDTtas2Kc9FopS6Edj0/s50tMoem5uhtknaKQ8y9Q1D9UKHoZOQFwOrk2WeRL1i7i2ATc3ky1cPGKbp3boPSaGMdcxITInlgPNba6Ekjo9+6yMhu2TOHb5x8UiqjOClVqRvOxDM2fedcKnvS7ha3dgFZAHqxRvfUtNJmguNG26Cv/HGqBAcD2cUU5dzoz7vml9DmFscX3qvWYPtFLYwLzl9/PO1yedmi0FeiSZ0E28vlpqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nIO0/d0AeLkPG40iTPQtIvIuWkR/mtCb4GK3k6P+/A=;
 b=Mu81HPZPn80e4BtNvUdYQfF27Pec3+wXszgvANOAwbl4df89+uf4H9q2LoVEwwFWvObWm3ZDOowye5tFq5gXgy18ZF8E8vokWiDtR+rIOrD7Eqxo3KhQGw98adhyFxI4eSJLe5ykYDpEwCEIOOXtoZlikQBz+OlPtjtsPFO9QJYj/ZCrpznSQplKqwcDtuoI35PDPMaP+ZohHFwo1ec0pNwsLBwqZ+Dm51u0en8C/p0kwYFA7XofHINtqirEv7WlhstRNi1c+O2L5g/j9zZiwZpiO3uwO9p7REv346XBdntR/QYqCmQ6awJMy6f9m7AXCzBow1OFpul/m2A+cDE5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nIO0/d0AeLkPG40iTPQtIvIuWkR/mtCb4GK3k6P+/A=;
 b=jFbCYKzxY62Cz6eNiwHZZRu69Gj7N/9XHHvbK56DjDj7Rdtof6xFdtFnkjor8yBLceUnGvfSes+7QXHFiRrhxt3Az+Cp1kVO58i04DOsD3Vz8Al2FrJnOT5jXzS6M0MwDOtVn/ivw4/J4Glbo3jg/jnp0k013bkmuRp0laGPI+0=
Received: from CH0PR03CA0392.namprd03.prod.outlook.com (2603:10b6:610:11b::31)
 by CY8PR19MB6986.namprd19.prod.outlook.com (2603:10b6:930:5d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:40:48 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::89) by CH0PR03CA0392.outlook.office365.com
 (2603:10b6:610:11b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:40:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CAEEF406550;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A2AE6822544;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: cs35l56: Move cs35l56_irq_request() after cs35l56_irq()
Date: Mon, 10 Aug 2026 11:40:43 +0100
Message-ID: <20260810104045.60701-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CY8PR19MB6986:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 41b78dae-ddae-4e4a-7476-08def6cbd676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|61400799027|18002099003|16102099003|22082099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zBmCjOAdjURj4/hnCdXVxfm4UQ83HRgPoZN26xS8gMZMIj3ewq8RSxhhHZUBAyK8R15iuBnVk3ynMdPVI6D9KoagBeSgsJB5w51N3wENrPggX93gRy4ZVHikXzDY8G+XSBK5JX7TTyQw7DsnJ5Ph3CvoLiFmuLUEwy3SPfDaQOb671v77G7nwa2PzOurRpkiEcKh+/5r46i3a5DqQizRVE0GNgHQb8A2YmNuVJvlFqEBWJVkGtZF7HJurjj1StANPmebB/NxfjzVT+X8j70A20HO+zLPHinZULTKy4ah7irC+UB4n/hcYZVx0WlfcysCiOBClX8mNmiYQF+VNBMlfoWQktrHRyQMZIkuecKBiF8WwrEBeRl4hokTrQmOkrfCJsuYBXaCDeI8dPPbyDV2nhtPaTYuV6M4VNhwJ+E3aZh9tMnrWyiz/uSGAzTM/ptJU0N2WYcPCRFcNGH1rH3lrQ71lR3JRMKjXH/hJwl1b2etBO3MrOFlyROSZpi2ToDXX0BJ0XZXdGWjtpMsY3ahvK5r1MDFuFF8+DHMeRaPvJToGnE1vhf/AR2LXF26Y1QiZywrgcMFyUWTajWf0x576hA+Np6cIO/m5QYrXskOlCoZpMlksJJBYJs5pQZfK/Sn4aq3wVP18Ftuh5QnQSIgXWJ8YMyF6CKSwszcHNoO5I08ywrxMXViKCwujWRECvPB8DW/rDtn3dmu6lNTeWf4lQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(61400799027)(18002099003)(16102099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x6/DlALjMuEcnEC6DmaIWHVv9SXFMYrMsLaax8BdUf+CGz7ISyv8UOkT4Pu25yl1lCu0lsUtvKvM33JEEd0bkbZ73k3EsOPegjutWFOjojwlpORMmXL/cAEZOLCl1a86WhBKiFLjUjLOm38lsMnXd3Bv/cvR47fSevta8+CdKgAT1Dyjtc9/npe5m84ZzwdydS+PI5QJZ6Ri35ZORTn6dH0bCEvV7FQQDFIIkhw5KEanOtvqsIatMh3dkGJ2jDPDVXJcJqumfdDQhlY6bnnl4c2CvAIvgpi+YfrXc7Ahf+DULBdCMcwaXCJisso2nOlQZb4HueGodGR68ZbyuMsdV5RllfP/K706MzD59gnzaiXaHTtgOCAN9xyfiSOMOYCVvk92mK17hs4zPuyBqqwEW/6eHuMEeptrksxh56XYQbNj6gSly/uUZ+Ym4Kd2FrNH
X-Exchange-RoutingPolicyChecked:
	RiX/4rIC0zTAp5GNFAHyZuHG1ixZgeZDpHAu0hn512rTBJe6ra5xOF+8HjatC82sCVNvEzhSwcCAjwrsLC4+Hw5Wiu1yiVn0SMDcMR5NMwEwZKqf+KDnMA3zszR+Ma4YhchY4fXbgDmNBVrlqU/a7iM4jlyQqq501MsOhzHNcSCe3pVh4f1SVVq2ols74+fV9KYe6JAGKDP/6v885QHmsk5SqJaWIaYJ/LaPecPyWKZ2cr9GqVQSxtvr5gBpt+DtSZQJ9E406uJf4KrBldnm7753DZo9c2Too2b9hI0LWr6TSwy21sy4eRTmph8Bi7wlEZMU2bM46mxQQoIGczofAw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:40:46.7706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b78dae-ddae-4e4a-7476-08def6cbd676
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB6986
X-Proofpoint-GUID: 07gLHc2Fkgt0KRPMMQRobJgFadkb2bH_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX16jauKdfDH9m
 A5AiVovE0REbf+MAgp+T2KtvVoq7PQU9AmEmUhX4kqQ7rVjMO43dDj4bLzMIIG3c40fQzpOSonf
 SQ0ZtIbzMnjNFhHZHGiGyn5cMkawgx4=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a79aab5 cx=c_pps
 a=A1ZJ2ZpE7ptU6E6UTMl5DA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=JFt9YoiO9metZEpqVLYA:9
X-Proofpoint-ORIG-GUID: 07gLHc2Fkgt0KRPMMQRobJgFadkb2bH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX7nK7pWkisDhv
 6NjVnqCTsf0/UJumVUiDBRG0o+Zy9gbGpAlfWdf5MXmWkRBkF1NHA64gbnPjfMG9Gmv4ALukntE
 TVLDAug+5Ys2/HIZ80k2zc5HmnksWvpkgo8929/r4B0fRN/MDpppWqFTxWyn1yL17de+vOkdzeV
 5PDx2DAwGjGLj86Cv2eaIJzt5i0JRZLvVTdFTJXVtbqN0arSRvpbJOtBwLR7FzNMnry6S3cduPS
 105/gJH+4plTdbJkpMpEMvf/zlIb6AMyx8A1JbpeMiilbOKQ2xqKk6hvvfEreLTC7zt8jjbumRS
 yLLoOJ32tVCCfK615SJwQ39bG0wabGWCNw7ftPZssSaSTaT/Scx7lCTfQikMl0VGpJbX8QeyuJN
 fD7vR/wJHgfXhGLe6RyGC0rO28k60HB2GtQ2PLSEsN+yMiiHRGA+SVJkOTiRuebFy4SLmCFmnR1
 WVWEHg0EwBzGXe3tlig==
X-Proofpoint-Spam-Reason: safe

cs35l56_irq_request() references cs35l56_irq() but was above it in the
source (although they are in the other order in the header file). Switch
to convertional C ordering.

This is preparation for a future patch that will stop exporting
cs35l56_irq() and make it static.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 38 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index b40bd3a8d27b9..0880b6a02247c 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -616,25 +616,6 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, "SND_SOC_CS35L56_SHARED");
 
-int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
-{
-	int ret;
-
-	if (irq < 1)
-		return 0;
-
-	ret = devm_request_threaded_irq(cs35l56_base->dev, irq, NULL, cs35l56_irq,
-					IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW,
-					"cs35l56", cs35l56_base);
-	if (!ret)
-		cs35l56_base->irq = irq;
-	else
-		dev_err(cs35l56_base->dev, "Failed to get IRQ: %d\n", ret);
-
-	return ret;
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_irq_request, "SND_SOC_CS35L56_SHARED");
-
 irqreturn_t cs35l56_irq(int irq, void *data)
 {
 	struct cs35l56_base *cs35l56_base = data;
@@ -694,6 +675,25 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
+int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
+{
+	int ret;
+
+	if (irq < 1)
+		return 0;
+
+	ret = devm_request_threaded_irq(cs35l56_base->dev, irq, NULL, cs35l56_irq,
+					IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW,
+					"cs35l56", cs35l56_base);
+	if (!ret)
+		cs35l56_base->irq = irq;
+	else
+		dev_err(cs35l56_base->dev, "Failed to get IRQ: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_irq_request, "SND_SOC_CS35L56_SHARED");
+
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 {
 	unsigned int val;
-- 
2.47.3

