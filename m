Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098A236454
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970366; cv=fail; b=fxCDM6iUN6MNB3Wmr3nVlaCL9Jqd+nR0gcN6E7yv9HLcN8REL1lMRTEALaC/55rIZQQE4INMHWHau96Ki+0A0beba9axJoq0pJzH5icO+DP+Agv2pZkVtcwsStbzZICFWrD3DMbBklEW2sowP1mC1un0KpVHxIKfEhcVUpyPSmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970366; c=relaxed/simple;
	bh=NppOYNVEmQ0kdzM5u6eEdszU0dv2+JPHe/yQZXznhHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmfaYPuk0j+qh7DHJe+72n6VX7QHnbi1VIJZ1E3l1tAHSFlRGLEv5FNU8ak5TypksQkiTU9ob3CQBDjyhxb71oqfN9iAFvjjqhh5DBvkfatwKcYV2TvQRv3cUepum2TkmvIKHqud0PaAF1ZBfjqNbAUThysRIzhcYNdfB0IzTaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dkIkoo0h; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o2C360sh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dkIkoo0h";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o2C360sh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096Xh4t3898741;
	Fri, 9 Jan 2026 08:52:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ChFzo0a3CSbUyp4yi9lM3eeOg+TY6l5q+MO4KyH7hJY=; b=
	dkIkoo0h0pyW9dEey2u6930Sz6324X8XroEdE1AbQzJDgNzZN0QqRuo9atCrXxGZ
	xeB3lIQp9QRCFwdxl+of6W0Xjcf58NNU5bqdwgfth+2vcxCYEi9BF0N8Cf0S/5z5
	yL2e2v0FNMRW4EHfQ4lhv5xhgpUzgweBP2Do7Iw/AGTz58YSCuJ3h27rQY3T82UN
	vCmtvzLcJZ0oc+h1ZXkAFlrxDENAzbBhPlMlfpsyAuARQc0c+IrrKGLtAeyR1jIN
	9F7KpEVeyFmYz9fW0ZLe1sFs006r6qdB1mR1nJrb+TtWNRa4LbeMhsiT3XpzOHxg
	fPVRj1pLtIYHs2ygFxFeuQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023075.outbound.protection.outlook.com [40.93.201.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d36ve5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 08:52:19 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8GM49G1NddBGPyvdL/x5c+Xm+Fgq6Dn4rrQ5w4dD8GE1gPhfjw9raxiwpOridQKL5AE8toL/G/QsK62dIqSjnZqwtsFnfNABCq21yXi5typWXsbsDAQRONaBOqs0NkAOG/0U+R+eAncO+WfUnHdsuDlTx61DwQJFtg/x1y/5BkLaaXfGPen5OH/3Zdit0dWMF6zsINN6pMzL9kbNdL+vPuKJuht6yedXtY23NWe7YTDlQRONd6KY6Oj05fLM/GRwBMjSU20NgPC1fGNmtXEvKQJwgjqjYrFceHVzADvabdxHyHhFG71gWSqVnn9MRJUfbjrEvijmuWvRimz4y5OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChFzo0a3CSbUyp4yi9lM3eeOg+TY6l5q+MO4KyH7hJY=;
 b=WFOBNnUiR4YsfrlIH9++Mnzqa/UTrMxZagwcdHSpC4rtMQ3iUCI+9gDCjbbxJieF9ld813gk3QySCiriW2RmCKGjaJuqfejV5GrvnYo3y/jo2mU+PMHBEnyoymuOhNJULvxkShqVse35Ik84RtxvpcPkUpQ5UKNMa9dno1HlhiXu1isSl13R5HiPNQyoU90kV6BUQeF7J380x/h2RvIfI9xD90rGxYQUEUKFTPsZWE0dpY5oYfGFWGVyEjLUAjNHTmh01bKw8T/AvOUnd3bcj3EGm1ttOlM3ByU2Hf0EjWObzAjnkyXR9TlaalncQmtMJT+/1iryOL8jL/61wjwwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChFzo0a3CSbUyp4yi9lM3eeOg+TY6l5q+MO4KyH7hJY=;
 b=o2C360shKL6gUUO/brDWqjyhVNBTZ5rFAZjFJ6wAByyHZmcsm+avdI0cPGLer0yTdWMcdveRr4dl877vyaVnwKMRJdpyMr0xRSPflEJQD7kykAeqZTxGVHiqPy0G3Py1w46KS5XwCr3W7NKGo9ujwciyl13TcJmbiBurAYjh2+c=
Received: from DM6PR18CA0002.namprd18.prod.outlook.com (2603:10b6:5:15b::15)
 by CY5PR19MB6363.namprd19.prod.outlook.com (2603:10b6:930:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 14:52:14 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::b) by DM6PR18CA0002.outlook.office365.com
 (2603:10b6:5:15b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 14:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 14:52:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3A89340654E;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 261A082024A;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 1/4] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
Date: Fri,  9 Jan 2026 14:52:03 +0000
Message-ID: <20260109145206.3456151-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
References: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CY5PR19MB6363:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a5ad7d2-a59f-475c-dcbd-08de4f8eab9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wVwWNo5qC5WKFaPLHVyCQZzdef06P9ulzD0rxAirsJNP2O3r/iRaCduxXGNe?=
 =?us-ascii?Q?1K4i/BfPopZBEUpsLe2uXzv4J1mGMWkhHot0WeRRXPMYb7SNVC8VELVPsPjc?=
 =?us-ascii?Q?wH0z9ZvCSzuIROfSjPFdsaKH9acS8n25dt8T0lPEnFZuKWZmwyXyS8JVDRhb?=
 =?us-ascii?Q?V9hCSOb2eAxJfcrPM5y6oZi5fDtaLctbGliY2hOubBqqzlr1WDjcx/cZ0jAc?=
 =?us-ascii?Q?WIiST2a7Iv+pTDtIaN0M9WlIQeOB/9tp8ccuqWx/K28na3SouFLMe6X2aTkL?=
 =?us-ascii?Q?KGxs+I2SAJg9hFRnD5Dh9v+k0auJy+zaktqpGxhQiXunqF+Te3vgT2U3zcx8?=
 =?us-ascii?Q?mY63GObWl40vuwTHiKMCRUr7hfo8gJ6nw2rbzBAKm2WLfguJm0rMkYv4M3SK?=
 =?us-ascii?Q?O40eJlF83avpSndjafva0Wa6ScTxAZYzFisuAUYymKKHe1qO53LWM2puuTFF?=
 =?us-ascii?Q?HlN9MpOtdyhubK1bU5CcVvq/YcGB//Cz84hjiVZr7e+nHa4mqCVKz6OBF91n?=
 =?us-ascii?Q?DdDIdbbZhGp+5Oh5KcESSAT4TKaE5zC6LNrvnvqLdQTRM+eWTLeLinCNBBP5?=
 =?us-ascii?Q?rZvdAlSzThmoYzuknkLgA9qTEgP1JNFNKV1S3Dv6rJ0GTbH62QoAu5klcAI5?=
 =?us-ascii?Q?P03YM5Yq5SjtoAFKz6hcI89UmpgU3NIUZW/sqESRo92iZ7CYlVeNvxOswzbH?=
 =?us-ascii?Q?HQIMGb/26ibgAJ5ZEcaPAZqPsmWTv5yrgokXRJ4OGuN6c8vw8mppZtNmbdzn?=
 =?us-ascii?Q?u3lbYyokchjGU3YOein/ncVi4+GuK9ym4WK4wwrvHRRr8sn6IQcI8CqmLk/C?=
 =?us-ascii?Q?d0goW8MQFGIYGl2ti3mYZmth1FE8Zpi4Vw9emHXDUoVX9/YPaJY6h6vNzQFj?=
 =?us-ascii?Q?BxaJdi5lDLP9b3j2GS3kB7J0YamJbrEKjAA+wjzy+Rf74XAQJgYkjq+xGuIT?=
 =?us-ascii?Q?NxOZK+w1tf+i4XujDonwAXft9X6uR01czS0uBwZHKNFAQonfZJTHZLnKzBfn?=
 =?us-ascii?Q?scG5qbp0qQmkNv0VSayNGEU31IOdkH4bIK6IrSK2x8DN3YHdAQSFwmZ08fbB?=
 =?us-ascii?Q?tQ+5E2fdayYTwGCwCMbcR/5x0JT7gU1/UYkK5ZDm6yPA4TEEYE9fAhcxpxrA?=
 =?us-ascii?Q?UWyugswcZmWsGo9bmi9HqTDR6Q2DuGlWWS/ND/9ac+6sj5xuSoe3D2Wj8Z7J?=
 =?us-ascii?Q?fy1f/1TeJNvUk56VpZ3Pb4+uossJINfcJnjE0igpBYKAzq7gFtWwxXwVrCWn?=
 =?us-ascii?Q?YrrMYAPQsNnrey/d6l2EvYR7uJ/8I1T3TntC2eBxHYkNia3PqkOxrhMW9FHF?=
 =?us-ascii?Q?mXPiL7GSwyDY4CGl06gdmrhQbK19Z2KDlXtb2Fyeer/Dc5KtkAuz3HGUZeFQ?=
 =?us-ascii?Q?JtQ+ZoZVbDnshW4LjHQ3PVaL0KJySIYiZR3t4H9Vgt9AviqhHSfLGmz4QDdd?=
 =?us-ascii?Q?WNqveTfr8wAYhfUMrc2Puv93Jx1NDe+ygoQKpHSHSap23SxL+Srdvl+kRq+6?=
 =?us-ascii?Q?QuvDiVAO+X3zCQ2huzUc/xG5jQ7ThNpTAJ3HoW+7qcErj0usQMbtFK57PiNq?=
 =?us-ascii?Q?PI2JiKtVskHCCS7q484=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:52:11.3657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5ad7d2-a59f-475c-dcbd-08de4f8eab9d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6363
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=69611623 cx=c_pps
 a=bqsrm7XTco20ezpTcXdHqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ZOx6yu-7YdwscOYep6IA:9
X-Proofpoint-GUID: EC2XhWSCR3Pq2v-ctE0UfbfJY6edvqyW
X-Proofpoint-ORIG-GUID: EC2XhWSCR3Pq2v-ctE0UfbfJY6edvqyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExMCBTYWx0ZWRfXyXbi80R8iffp
 AA5gjNkJDFPadA4ru2mJgUgJAAWKp2cyoFbpbCaxYTyC2gYEmPwEXrUsaJ5k0hxt+wKsB+qdVJj
 EVQ8XyOsp6RY/D26d76Cuit00Nt/enCv58hc/djDtCqorTlYUsUw/fxuQP8gAHKDUQCyUl9T/a3
 FUAYF0DVrH1bSRBekcsxgcZzpy5c92S25HDw5JYHEhMTrmBpl7qKVWR6D6LQqtNOuhxgM/PX9cH
 n+4titoBJ5XdT9moYEmm+IKpgl/wvwq3injTgG9FgTLBUQ3rv/5bSHZQTwfFEPlXkZdEt6j8LiV
 nqH1ZCN+AhiRRHubL7SRENajpg1P2sd6qC1fYBIJP8fdsGL3F2BwNgxKV3+u3SbRU2/v81ouXrk
 vqIPksh9eBqR1pMWJDInlcFt7noPhWamhVYPcP6kicIieGLuwZb+x6v2LmEtCpnOn4fWDce7Bvh
 sGsnzXGTsWURivGah9w==
X-Proofpoint-Spam-Reason: safe

Add helpers to enable and disable the SDCA IRQs by Function. These are
useful to sequence the powering down and up around system suspend.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Update some kernel doc.

 include/sound/sdca_interrupts.h  |  7 +++
 sound/soc/sdca/sdca_interrupts.c | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 8f13417d129ab..9bcb5d8fd592b 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -84,4 +84,11 @@ int sdca_irq_populate(struct sdca_function_data *function,
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq);
 
+void sdca_irq_enable_early(struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info);
+void sdca_irq_enable(struct sdca_function_data *function,
+		     struct sdca_interrupt_info *info);
+void sdca_irq_disable(struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info);
+
 #endif
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index ff3a7e405fdcb..afef7bbf613c9 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -541,3 +541,79 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 	return info;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
+
+static void irq_enable_flags(struct sdca_function_data *function,
+			     struct sdca_interrupt_info *info, bool early)
+{
+	struct sdca_interrupt *interrupt;
+	int i;
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		interrupt = &info->irqs[i];
+
+		if (!interrupt || interrupt->function != function)
+			continue;
+
+		switch (SDCA_CTL_TYPE(interrupt->entity->type,
+				      interrupt->control->sel)) {
+		case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+			if (early)
+				enable_irq(interrupt->irq);
+			break;
+		default:
+			if (!early)
+				enable_irq(interrupt->irq);
+			break;
+		}
+	}
+}
+
+/**
+ * sdca_irq_enable_early - Re-enable early SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * The early version of the IRQ enable allows enabling IRQs which may be
+ * necessary to bootstrap functionality for other IRQs, such as the FDL
+ * process.
+ */
+void sdca_irq_enable_early(struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info)
+{
+	irq_enable_flags(function, info, true);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_enable_early, "SND_SOC_SDCA");
+
+/**
+ * sdca_irq_enable - Re-enable SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ */
+void sdca_irq_enable(struct sdca_function_data *function,
+		     struct sdca_interrupt_info *info)
+{
+	irq_enable_flags(function, info, false);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_enable, "SND_SOC_SDCA");
+
+/**
+ * sdca_irq_disable - Disable SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ */
+void sdca_irq_disable(struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info)
+{
+	struct sdca_interrupt *interrupt;
+	int i;
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		interrupt = &info->irqs[i];
+
+		if (!interrupt || interrupt->function != function)
+			continue;
+
+		disable_irq(interrupt->irq);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_disable, "SND_SOC_SDCA");
-- 
2.47.3

