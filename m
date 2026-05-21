Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1D63CB2CC;
	Thu, 21 May 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364474; cv=fail; b=VIIbF2eslxG7dPPIYpR7uNR1R6En4zLyA4HzW/AomIjf0svYiiH0RIVuPER5rbQ5o1YDZM3s3U6grQaA1sE8Z/ffNwV9GooSJY3y1phPsUtWvPetTONjOVvrVrfpm98/DATu07XD1JrZxC4Bh39LEc1/ea4DWntKpnur5LAVy20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364474; c=relaxed/simple;
	bh=5ZaYj6sTPZJv3y0aqbYpfz/eTDOEHtnTVVDN5LYKtv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRqZ1HWO7NQyj7MQHrFbnERbDhxJjA0th6qJ5J6fMromwVcVeCUBQkPDaokhLPQAIRM8V4TXBso6uSNEUU7SeoKcpdwBsqLANNRGKS+4N0/3SFsWJj8ZPrnvvgbqDWBvQrir7DyE9iWQ8w0qoyxpoExu8B2AVrHcQ+Q5gqhzTZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Gk3oui86; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tRL2xQ8u; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Gk3oui86";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tRL2xQ8u"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L50ZFT2685326;
	Thu, 21 May 2026 06:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=y+7osS8mUSpbqmA7xfLwVkp/4No9zDiICGfXUDfENwI=; b=
	Gk3oui86XAwUr4wtNFQhJHf8ogls8wOUYliicDBXsBtQm5qtz/2vFCCR/FYKYVtA
	T59Hn9PxjepPS9uovCPF31scQTzXkB2NH/6tZHLAIZMyM8VQyNAg46ZzfRKGWtj/
	YBgC3YDB8oX6AWTrQxNbUWYHUflj9n3MhFDa+hwVUEG33KN+fFZATIh8IevBRyRz
	neg15jN2WX3EU2bI6MDDoH+cJVW3WDLE7C9MlxjlCGDBLAMYjjdnGRJfDwS8SR2Y
	9s9M37sN2yX6794HZQLxRc01jzYjrrwHL6Zf/uaOCp9Scl6hZAA6KKTYisBHKOpV
	Ic9nQW5mlXzB9hG5vYX7TQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022089.outbound.protection.outlook.com [52.101.48.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xcjdkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 06:54:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiM6G7AqLWa0ZRzcnBJeKrcns2Xdve+zQp9Dsc9137H0GgnNTDsc3NAaulGOYg7AKV44v45yLOffkVNHJg8TlAjZ6UnTf6PNIjmQ1sRqLfqPTLbFWTIhSJY1hsvklfEo4NRmnnB9Bh2JgZRM/LmlfytJ/Udbv0LrxBI+Mc+58WBD6PADNr/pEF2A4u/nMw0YhnoOYKiAXq5F1jr6VOqYiHzM0CpqxNi6YXbZunmlr48vOuyVj/7ZP140TP9nACW6dOBWRqMa5i3+AeSD9xLPsLMt+QY/Z3ikSCBbFlqJmvZlqeQNv/OzBv8aeBVYNXHTAvcwPGQ+dSutu6CjmpUrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+7osS8mUSpbqmA7xfLwVkp/4No9zDiICGfXUDfENwI=;
 b=nVbUkAw23DXMJLVFhGWUcPSPheruw+BaOBh+2cSLdGgiUX26yXRQMBxFlH+pGzhgQ3Uwsy4JTzSsDJ8ClpfUwVG2UiOwx2ILP+22Y9UhjK2AjrzbJrAGoGB+ihypkqC26TS4DWf4scMCD0c5WPd83yq8c0vymRWjVp3oWCuJricrIzBK+FeY2/SBE+EBEPWQ0lvqCovdX5ONa/nqelOQ8ZoLIinYt0WDNpfTkMzcDQSKFQJ/BylXNP0Sq0GHB8ZgUIFqAuujFXtNZuhYiFL0Ta1C6hnDg0h0nzwYXBs/MCu4olBd7GV84J7WkzrRrg6286IhShJfa+Nd69tsJtCgkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+7osS8mUSpbqmA7xfLwVkp/4No9zDiICGfXUDfENwI=;
 b=tRL2xQ8uAV6uM/C/2z1259pUTRkEsz0jayE37f+TYbl+hfrvBTxtvK5HnMdoKK8LROIJGCe0l+0ALI8MYU0KiPqXKKidfwLyjEruQBzQ9DzRg2cLYLq5VvFrvnCJ3xVt3ytNXIPqE5KbX1sVIp+4+MogGg4ly3jtgnrV/7cjP3M=
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by PH3PPF7D22BCFD4.namprd19.prod.outlook.com (2603:10b6:518:1::c35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 21 May
 2026 11:54:23 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::1) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Thu, 21
 May 2026 11:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 11:54:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7F91C406544;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 652C482025A;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 1/3] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
Date: Thu, 21 May 2026 12:54:18 +0100
Message-ID: <20260521115420.978616-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521115420.978616-1-rf@opensource.cirrus.com>
References: <20260521115420.978616-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|PH3PPF7D22BCFD4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e06dbb24-46e3-4f0a-4b14-08deb72fb30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|22082099003|18002099003|16102099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	z23HNabOb1gGpCmD51Hlt8vAqcnFrhEywQXlYPyy/v3GggX52NiRhuGegraotYIbYnScgvVzcuw38sXY0PUTltGqtVmHYaNmTfdyhOIV/HaKHH/tkntVtL2EeRY7dNX4r3CrySlwf7wGcZvBet0Dw7mF5xRScU8fB318FAxUd8C6QNSx6mf6XvCqTyXZG0IPzt8l+8JpbMoGaTnloRr/Q6zjoMBf2240R3m6rPaUId/PRxJZFp/2/vJ2DudojBhN+dCPv8Og33hiWJKw1v5UBy1OnZ7YdzU8z4qhv8AUi56X4JfYAlbt+9xhHxawzSGNSOas9fAitimPxZsIxA0NE+yn+2TaSZQMGiYFURd+x+6mGhM6lPbS8dB45SoFo1ynSrf3A8vwQjkXaEZDCtg5GXYa2+U0Rkem9GXzfwwhDPi82FY90rvMFrLZeMGS2Qf1JVEW47DT7GDVErw2V68Cu8Eq/QOweEWy9e1KaBpcQTU80lvfaMTA3f/LqOApI1xazJCKaxL5ugx9cCCzSq+M67OkrmGcDn5gSVbXyZNNePCjheHvsQUm6aXn5h1sk8f+8NEWGU8BZW/u2t9Yz5u4LZW3I3e21Gsy9mbp/T/4Lsf2USqS1A3zmO/fTMxEhinxc2AJukWTVvUiJd+QjgwrK9FDu8HAPim25D1B9Pw5Y2rXOXKuNIuULVt+Q3PtlusUIAsJ4syacwrCJFQiBQ8MSRlchEqQPFxw+sHQiCwFl9U=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(22082099003)(18002099003)(16102099003)(11063799006)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DtZasO+OVRsBwvxSUqbwwIpZQDvGyyJGRT/lJXSCFRnbTNPLJHiQD+eyV8E0HzFg0/HbC0WbygjgTTNno1nGoaHUL3sdUOJUgsu7/yninNL62/EJ6bATJYEaBQ+zlusELn7V53/URAclUH2KDYzdtG6EdW4RtJOgKPHho+C0OXVVe9s7+MeNWiApIjtbZ6AjwLffQbiH7I1iL2tQ2ypw0qySlE1+3TlBR+doWiLkkUZTYCvj0vNTJ9tsw4LTYXCcCDctFrioUjEvNYbXhWeGMBfq7aAh6AULgyVW/nFHE5pYFY5/14xDmKMR8D8Akrr6Tc0BKYbuP4aEuVRER+0YVGhuZQ4EXY1PwhWi8OOxyxJc1GjA8TlH9Rk5mbB941gPhVrHzl1vekuSHPvaO1KiF5NfIZfHs2EC7mCdegLvq6edi3EvZWf4bwBVVhh8o1CM
X-Exchange-RoutingPolicyChecked:
	YWKiCDJl0HEvKX88Kv2O0lw8vJoRf7CenQrhCnRmq2euFCXVjtnyVmHvI0MTE38GKg2HMK2k4TeAV/tM0Q0p7yMVz1RIvXxEa0DaxGZkutVblJnpDncUIK7flvht34gRRpjzmrekqZqICjnznnoiXDdnBdakYZnkjhhL6zCoNRR8AgRS9EjsrbosTndNaMI8I+BVTuD/Dqfmc+fR/vYi10joIgSvsQT3MUSuHUdOgjQuIXpfxcR/nd74aJeBV/P1Mr95VkceXLt2yN3GkvEn9tya/5GNC8ZBcwEhQPi0JE+5tm0Dgm5tLa79FCvn4fSxiy1OmXQO6n2p/2Ai21PXmA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:54:22.5126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06dbb24-46e3-4f0a-4b14-08deb72fb30b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7D22BCFD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExOSBTYWx0ZWRfX4ROVf0C4ZT6w
 XmSctzJ/aNSfSY0nhc7FJ7Sdtte/cRhL0j+adMZ+hNjgeUSKYFGp2RAxcqJEw0pik6xHtZ4LC4v
 b//Q2PwoHplT2EVEFKa+xtD96hgNak30wB45GDAinHBHIkBWs0vT8cu0Pik4q32VUbjS72V0EJK
 aCBzd/KR3U2rhQVM+39lLR0iKWwe6XV2pCzQvJcUMZIL8Qm6M7OmgVLQqa871pJjCdFWeC1zAPq
 KMw4eHGZxEjcrLVBG+4zWWZTTMg+fUR53xncU2ECl7GRgvLo/vlV5nEtpJG73RooH1XhG0o9oqn
 IEujXX1H2rsXjCqY1/v4MeMYh5RcBAMlDCn3t+JbYKfJ873HPM77s8O/E1pUHkQa5Wrim6Ta6aP
 YACqu2sgk53VNLtTlGyAhMkKrAW1/jJzYmvTRNlo/lShrpD1nNEUV1WE9dxhK8YV/kAiCVQIsai
 Xcor/NYgmDma/JwhdFw==
X-Proofpoint-GUID: tIyRF0jVs19tkeFRh0AvXtzrVOygEQxz
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0ef276 cx=c_pps
 a=88cenwDluC1K+zw7ozncdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=e6vTjNyiGiafX-68rtMA:9
X-Proofpoint-ORIG-GUID: tIyRF0jVs19tkeFRh0AvXtzrVOygEQxz
X-Proofpoint-Spam-Reason: safe

Subtract the value of cs35l56 regmap_config->reg_base from addresses
passed into the mock regmap bus.

Chip register addresses transferred over SoundWire are offset by 0x8000
to move them after the address range reserved in the SoundWire spec.

This commit prepares for changing the cs35l56-sdw driver to use
regmap_config->reg_base to add this offset. When that is done the
addresses passed into the mock regmap_bus will include this offset.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V4:
- Move the dereference of regmap_config->reg_base inside the check that
  regmap_config is not NULL.
  (Reported by Dan Carpenter <error27@gmail.com>)

New in V3

 sound/soc/codecs/cs35l56-shared-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index cfe7938065f9..4f52c8a192e5 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -29,6 +29,7 @@ struct cs35l56_shared_test_priv {
 	struct faux_device *gpio_dev;
 	struct cs35l56_shared_test_mock_gpio *gpio_priv;
 	struct regmap *registers;
+	unsigned int reg_offset;
 	struct cs35l56_base *cs35l56_base;
 	u8 applied_pad_pull_state[CS35L56_MAX_GPIO];
 };
@@ -194,6 +195,8 @@ static int cs35l56_shared_test_reg_read(void *context, unsigned int reg, unsigne
 {
 	struct cs35l56_shared_test_priv *priv = context;
 
+	reg -= priv->reg_offset;
+
 	switch (reg) {
 	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
 	case CS35L56_GPIO1_CTRL1 ... CS35L56_GPIO13_CTRL1:
@@ -214,6 +217,8 @@ static int cs35l56_shared_test_reg_write(void *context, unsigned int reg, unsign
 {
 	struct cs35l56_shared_test_priv *priv = context;
 
+	reg -= priv->reg_offset;
+
 	switch (reg) {
 	case CS35L56_UPDATE_REGS:
 		return cs35l56_shared_test_updt_gpio_pres(priv, reg, val);
@@ -673,6 +678,7 @@ static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 re
 	priv->cs35l56_base->rev = rev;
 
 	if (regmap_config) {
+		priv->reg_offset = regmap_config->reg_base;
 		ret = cs35l56_shared_test_case_regmap_init(test, regmap_config);
 		if (ret)
 			return ret;
-- 
2.47.3

