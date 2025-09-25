Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51C265CC2
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807215; cv=fail; b=YtbEE1iccRbSmAciULQGmnolyCixWuWh4fypiOF1C6A+PMGsdTzCtYtKkrGpCgl8x6G9Fg2mrCZ+2uJ7Fs6kbV7qXSPLLfUZ6fWGAqda1obE8/j4OQ0QOxC0fNEWrg13n6/RKY02oaQP/LsbKgqURtch5wjL0uVoBzwAQxyebQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807215; c=relaxed/simple;
	bh=scUVvGGI7u3mr4//ddBHpYpLnMi6fxujQKjCzSKMAiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jk2BrRuMi6seF/MsDCMB6yiubuBHWSmY/3MVYmtcYvGlWcvEUYVde/7ktLRJD5LOKxIfIlMyjme8bQdq6ZazQnUo4Rcf6uReT2cqcxPDPoPyQ12gbTnrTAFeLj7gTvqozzoqSuR/Hi+VTgENT19Py9ji6rAPMfBnkpII6hiwn98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EJsHuDXp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ATuRQNyT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EJsHuDXp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ATuRQNyT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAN04S1391147;
	Thu, 25 Sep 2025 08:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4mg1DZQUO0HkbZbiNTY0MR+RJLxTbqaHbckr9EgMP7s=; b=
	EJsHuDXpZTNY4EWspYsYTX7+tpq3Y7WxoZumqop3PB8Ll8CZbAg/aU3q7kItyu2+
	F5X8+hz9uanCkEF+3FUCwZ5b5KyIc1OZkNffD4DfnSHvhmdvMnlNuW5p4eZEBdn6
	yn6IlbrpAX+K1TvByizAtM2Z54FzZbEuX0GpD4vxvJCZEkMCPZY8Fd6bNmma/onu
	8Ds1SINxceOisssnZVPROsFezL+lklHFeJbDYTAor5Wc+GYHWwQBlcC4ecOww030
	VwZgM/W/R4mL4p5KCRPoVzFaJj1HY5EgTP6d4tlbMBDAmBa5htP02UjVh79X6lQ+
	PKAfsprxOeewONeCOVRGDA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021079.outbound.protection.outlook.com [52.101.52.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmdses3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:33:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3yLlFPwj3WOWCkOgiyd66UOqVhWapmnREXw/PdzNb4PUQ0yN0X8wYyI0Lsu4z6GPgq8yX9PJvBPgZ/34eXyE/iyfP4iWR03riZA1gkQVNI4HwhQq3aTXD2Z1uO5xUhIwDes7PrGATQ0tGCEo/aWYmDoLlod0x/LXAkd/iICxMvyKPz0o5F8LCmOxAN1I00fIUfb6aPQFL8BwGNX3pdm6D1649nDoOH39oV+OnwIFcXVKr4shM/LhC12wFBu6Tbj0YibBigZzm1njORZdd2AeQAVcA2eqdnv7YzI1NRQFR3QBTExgx4Qrj9WCYnZrqBurbbWv6FeIdvH8HekrIibew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mg1DZQUO0HkbZbiNTY0MR+RJLxTbqaHbckr9EgMP7s=;
 b=tCwtga8eBUHTqOIu45RXdowJtH8BUt3u75Zhe6IXtMLL4AIgdZ8+7wx0hwVC5IW/3znjiLOucHodkj3lzAg8mCtWXaRFXxd4xGA19RrnwAj0sJkaUKD8iE46r1Fu+hYJCdaTneirNlab0kcUjwhV8S/v3EyVqiUrs0wF0caYWzcDv1VJToiQaOBvlWMO3n1r3WQfw6IM5pSCNE+Wv3mhOOkWSIxEVxRy0RpwAzJHiAKCQPuMGEmeUZDsiWFZMIC5C28vGLSy2i22LKRjCAArVaMotGsgnLLvUGZ/33M5aUx/uVD9PN03He0BnPeczT6hojFAyJOgseGQgx2RJ7GlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mg1DZQUO0HkbZbiNTY0MR+RJLxTbqaHbckr9EgMP7s=;
 b=ATuRQNyTNiXgIpRcEcDd1kQp3n2VurOfK/vlASc4H/+bVRvUOymq7FTLo+hF+y7a/p+2geMtQ2XEGwYsxWN8RLtsUODuoH4u2aS21rumn0VFLBXSLif9sD+RgaIi1aEaISFYd/O/9N4FqcNz8GqDkuy70KIKhZVoCrTfbdoX+O4=
Received: from SA1P222CA0104.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::14)
 by DM6PR19MB4263.namprd19.prod.outlook.com (2603:10b6:5:2b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 13:33:14 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:3c5:cafe::f0) by SA1P222CA0104.outlook.office365.com
 (2603:10b6:806:3c5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 13:33:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 13:33:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6145406552;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A756582024B;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: SDCA: Add helper to write initialization writes
Date: Thu, 25 Sep 2025 14:33:03 +0100
Message-ID: <20250925133306.502514-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM6PR19MB4263:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d43dd783-e6f9-402b-c32b-08ddfc38134a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MpK3r5l2ziA/xZsMvs1WFgNUZ11EL+ZYg+k5F0b4nKteFzlAfzxPy9ERAKtS?=
 =?us-ascii?Q?uHbaXEKEJ9lYQw7WVjJFp3AGsR7kGNWk+vv9VIdt58b81kR/ZK1SQhorf5qK?=
 =?us-ascii?Q?vl8fwyzHt3s6S2eQOSpcMzUEnIYsBO887tzfkjrrI9nSc9PnJm2LJa//b9jU?=
 =?us-ascii?Q?vakUW/FqFTXIFKDlWwRqb1O63CX/N5M3IKcZNMLZDhAH1ViX7NyhjWW2oFbR?=
 =?us-ascii?Q?dz8C38+ibl20CkAr0gS6WZwRHkjDnkjQjkfJ6koGDyY7KJyxsF6HvbeWNGAu?=
 =?us-ascii?Q?dViOoa09YbDnuaUTxWhlTiw1LAav5jagj6xQoqJFIUlZk6vZF/MZ8e9l2IHS?=
 =?us-ascii?Q?G1B+9oi+uj+fD7XIF4XUwE/LDeoHN8KYMfHFYjm9Z0XoDFlR9N+PMdhM8Rxm?=
 =?us-ascii?Q?sfU7m41+dTcoX0pmk6sm80yECrHGN+1YoKc56ySusKqICZfsOgrYWdyl4XxV?=
 =?us-ascii?Q?IVgmrlTN4wegp+uWNAL4lBp/EidRhY2azA1taMamamR5TDtD8n6ZWQuX6Cqy?=
 =?us-ascii?Q?ozLe8vWmwrap/lZ7LLMzmWqGjfFl7qn/HzMTqqaTm+DHdYtlDbQoC0u5JjOY?=
 =?us-ascii?Q?7UAUkLIlPm+QyuYCqNjs1JBTR6UzSMJ3yNrHuyt2+6zCkJ0W9/zY+NzPMkAc?=
 =?us-ascii?Q?fg17rBuDdt3clufOl0weBcO61a67+jfDL027gWtx/20mbbIKnJINu1DCOfWp?=
 =?us-ascii?Q?4CxNDW3WAUgensp+lYkFUzkWCCKnkT1m/Z5Jlhgezfvyw5FGdPXr62heStSp?=
 =?us-ascii?Q?00iw6jkPDwOSxBgSfEWiPgENsSvJvk5LlTbhR9jwZydyycQqpgY9CRL68Emx?=
 =?us-ascii?Q?t7ZcqAgJhcjfTM/5za2NNa7DoLvasj9inW8EVYZX3gQnde1nxYDqUxzUBXWD?=
 =?us-ascii?Q?Nj3xV6THYPHz9aL954FACCzvx6N7haQJ7Fnqfmj+bRkwvoVKzAQ2plhEVcSq?=
 =?us-ascii?Q?UiDFcfjLNnBsvDUYb6HkkgYZvOS0NjRDlWPvb6e0gIGyVuCf5YmJDAmLwz3+?=
 =?us-ascii?Q?DhQduNM66owW3OwS3Ounik77bKtBcTRzlQsuG0tE3Rugv4FhFDlYQ3DRa8KZ?=
 =?us-ascii?Q?rIwJccjeGary1BUxLuAkWBb6ag/uvRk4NGcIolkWI7FtpyMPxTlPpVYJmVUn?=
 =?us-ascii?Q?3BZD7Km/8WewGOtF1luINQbCD40R473T+3x9D7XRtjCawvQpkcqAf1Q+dTRz?=
 =?us-ascii?Q?M6V6Aaf6gylkC7JNC7bugOA7QrrMebHp68g3vR9PkhjvQ43Jhyj+EzcN4mlj?=
 =?us-ascii?Q?KQMO7+unbaY9vgB3gmWhVsWefQr3y/AbWCRJ+ivbBbqIk7Hy2cPxAPxTk/Em?=
 =?us-ascii?Q?LMFd0wti//MUdqOlZetYlhd16GkA/0NR/s6n1jJFdRBPfORc82SPHIGO/DC2?=
 =?us-ascii?Q?y/1pF5bU2lZjp8WZH7aaTha9/10KcEfVAey9F42vH1gtlVs5LOp58mj4M1ip?=
 =?us-ascii?Q?/npmr3LiH6b/y5rgPZHr4HmvkDhluND3TVDKJ/FT/o4s4AkquVBVMEwWKXHT?=
 =?us-ascii?Q?BbdcmROVreR3Q5/K6KvretVA1o9xGdsmalR/?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:33:12.4286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43dd783-e6f9-402b-c32b-08ddfc38134a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4263
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEyNiBTYWx0ZWRfX5og0ekXPKjpv
 qkIl+mXS2ASBaLYkWpxsvYgl1Iw0F29FW4kle2HtEAKCQkhgoy2JWgnfSwt6Fhj+l6BrhAJWINR
 PsFQZc6cgAnlPtBUUfHzwrf8lpmGCyhoZMmpibC8Kl2GfzOQGCgXqD4om/9S18kC9CIIrUM2HKL
 bKWpTjMhjug4vYqMMtQMzR84qCOWh0sirWIzyBZGAx63KT9i/8/Y1HAK4FwkzFHa0NiqN0SxEGq
 6D/BxBxyv2paxryciZn+ds011ouTLgsbXfYvRiS8pNbKJue9fiVjbO8rhJ6/owbCUSbbZkBN4j8
 nXgsRc4soFNCJXxFF+NZ7SJcqzddknz+5+t3taVvylXffH38jtTv16P0ejSbeQ=
X-Proofpoint-GUID: A2ZShjM-9gPGZ_wmWBRHr4_D79Wyr2fl
X-Proofpoint-ORIG-GUID: A2ZShjM-9gPGZ_wmWBRHr4_D79Wyr2fl
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d5449d cx=c_pps
 a=Lzux+ftsp8NJ2nFuhgYiNA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=VcDROf1lVXhm0RX2fdMA:9
X-Proofpoint-Spam-Reason: safe

Add a helper function to write out the SDCA blind initialization writes.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_regmap.h  |  2 ++
 sound/soc/sdca/sdca_regmap.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/sdca_regmap.h b/include/sound/sdca_regmap.h
index b2e3c2ad2bb88..792540a530fc4 100644
--- a/include/sound/sdca_regmap.h
+++ b/include/sound/sdca_regmap.h
@@ -27,5 +27,7 @@ int sdca_regmap_populate_constants(struct device *dev, struct sdca_function_data
 
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function);
+int sdca_regmap_write_init(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function);
 
 #endif // __SDCA_REGMAP_H__
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 8fa138fca00ff..057862b6c9af5 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -326,3 +326,19 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_write_defaults, "SND_SOC_SDCA");
+
+int sdca_regmap_write_init(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function)
+{
+	struct sdca_init_write *init = function->init_table;
+	int ret, i;
+
+	for (i = 0; i < function->num_init_table; i++) {
+		ret = regmap_write(regmap, init[i].addr, init[i].val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_regmap_write_init, "SND_SOC_SDCA");
-- 
2.47.3

