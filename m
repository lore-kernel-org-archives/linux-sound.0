Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050433101C0
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429489; cv=fail; b=IQjgieFxRLnbRF/Z5Ttk2FKwxEF0J+uZRfP1v2btcueiBovVuNx2jae8nu7XQP8f2spu9nViG+o6g5vb2/MPPZe/qcmuQ80+Dq6/CNpb8r4UB8VeRg0WX0+bBe3NqszEBu5mQ+WuBuh6a8zpcJE/ABm+tjQpA0IUnMlX8Rwq5KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429489; c=relaxed/simple;
	bh=XU31AQVTVt6m6FnA7y48VVl2BfOkz1tcCqj8yOxqy8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MG6xgOglp/iqKyrv8vVZwXGR9hl/biFd9esNuSQxaFnNJS5M3QPO2RStVodTzbiapTqcAn0yPMEsAquRjLLBXDi2gtiEDE9qKDUTnnoPQx33iTVYzpkDCK40p5nFZFHyj3DI6vukc7Drub/Mpsfq6WaqKrEL7Ks6kJ3EVrWNobw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=czOJEwBF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mNVdOSUe; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="czOJEwBF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mNVdOSUe"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65KBnQ1440822;
	Thu, 6 Nov 2025 05:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Wju+dMKGdcoAuRrb11AyLFnOc4r9rMKH+OFkJeMMFVQ=; b=
	czOJEwBFYy2XnMwNcwga7m/fn+HA1ZjkeRTk8pEmB1qjph0TUViMZiEPWYmCkJxk
	OqqZSwLYjh6oxiXkmMbxl2UIZYsinL5Dwim3NppwC4OVS2XwA9nS8Zt72clwZapC
	Xj/guexkhz5cBYmY0cMdik5uVZsKF3IKbxKn//m4OiuGPYTXz8R5eqh4iMxt/Wso
	OmHvFPwYBFPO2OiAwk7nl5qWKDg6TDxk9QvoIvJ8DW5cyrdj/6LEnNymcfuA8ETe
	vqWvuZL/Ll9QapJqDf+cqacreNDzAwp1PD+5uX8JDrfhzdPm04HqFlOL5KyF7QoU
	qHSNdBJOukL1A7CIdim5jQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020118.outbound.protection.outlook.com [40.93.198.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLM6QPuszfZS1LHb0Oxtp5ybOoGpcPMnEt+25DWy46vqlVLwgr4wCJqdM4E6sjewYtjm0z1g7eGXwdBNJIMmYi3NpGfxC8ozoaxeYQMj19DMyNthyDQ1U1wVkgV3W39OvYkItLMAfkFeimNOcxBshbuAqFmtj3KQghb2gtp5O7LSIiC/KRFUuirGWOVJSTISDu2XiIVag+qD0K0SQRStcEZDpzcgEmc3BvVkFCe3+TopwhFO+1wrV6yBqqszVnxotJJ1mST5RJkWNqBlPLnLrPzxVgFUhnr8lejCPYrtBdiprnfPWnj9Y++DCksDQNl8inxDsupQ/7oH5QRtu4h4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wju+dMKGdcoAuRrb11AyLFnOc4r9rMKH+OFkJeMMFVQ=;
 b=vpCDmTnF/3BpyyxGubgzZjXXvEQAs/hTuczYytpoGDKsZvLQgJIa+ISen3WOWCaDkh33lu/bE9CqaVEjdXTc+dyZmIx7wYe7e0qZAtjTalxJeNPj6laxDA1T7ryjhgJFANYzboMA+a/UQIKRV+wJsi7H8NQN4VquS4of25hiJqSyTCaryRRbMSMScS4t0m1oQ5iv7kNpCV00qLVLksMozIN8JkqXKcNRqxgEnEsyF2yvh1ofWYsWdiJwT46S4FAhqqwa9ATHqd58s9IyS/VWIFtCJABwQkmSjU+RHDcP4Gnfvopf6FLGOmeUmxhw9pOWrATmBDU5TdLvGuN52JWsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wju+dMKGdcoAuRrb11AyLFnOc4r9rMKH+OFkJeMMFVQ=;
 b=mNVdOSUehyPsd1xIVsXvglqwN/kpjYKRC3Wk2DUBv/wx4YBGI3VPYqOXHXG86wDfBpWpUPt7siVbrZ4aw2q0V7Mgd5XNbo6FIjVvnQwz6htCK2xBKDRdxe3hzMUwX6j7Y+7thqz8uBHZN7bwBHFKMcmvG0scaOaV5p4SvhW5Q/o=
Received: from CH2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:610:20::29)
 by MW3PR19MB4284.namprd19.prod.outlook.com (2603:10b6:303:44::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:30 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::58) by CH2PR07CA0016.outlook.office365.com
 (2603:10b6:610:20::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 15ED840655C;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DDE2882254B;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 10/13] ASoC: SDCA: Add helper to write initialization writes
Date: Thu,  6 Nov 2025 11:44:19 +0000
Message-ID: <20251106114422.906370-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|MW3PR19MB4284:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d8d34baf-627c-48e2-1b95-08de1d29d88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G2NmGCdY6axRbCReCOhGbMSn1jCK+Q2/8By6M+AKnXKxJXT4xi2WMTUdSn9a?=
 =?us-ascii?Q?ozm5NGgD+Et99r7E6Lnq9SMYauvStLMSLSSHPtEwXlUC1z9aVAaqOl/nIDVv?=
 =?us-ascii?Q?3x1g78A7pBdaYqAsRGPgJ3EyJGTu3pm7nigfQ4Vr/y7l96RWi3sRF9ORPk2X?=
 =?us-ascii?Q?Ez6elHpmxwBlx6xOweRY7AO9bkStVPKlj7KZ9SYou6SqD85rQ0gdVG3n+L+O?=
 =?us-ascii?Q?QlHH2YMZqIGoTq85lpFmKC7MNPzMnYCfrVJEgLPdWkekX7DEkVoWcSSxAA4n?=
 =?us-ascii?Q?wpWEuY+zkUU+y5eqpq04VH9uicWcrvbUnwF0KNhTn7hvOjLC27IQ3RsPIuxc?=
 =?us-ascii?Q?HzJN0+2ODJGxfvUzF4RZeFf1V60g+6tW0UMzye/BiPvkCw5txxZYDDEGODZa?=
 =?us-ascii?Q?NHnaNja+9QZTYjuvbmCsYmPcUV1cDthgKzE/T4Yn3DcGV5E5qI1c2/F7ZsjZ?=
 =?us-ascii?Q?vNSop+sRNhi7XaWrUB3t37DPfT2V5PLm2g36HsKesihYtNiXrz+p4LE4ZS/I?=
 =?us-ascii?Q?7xrSpu9wFRbBOk8uP5Az+5fSo9alipuPS7IlBbEPqy4NHXrqfLOGFq7RIK1D?=
 =?us-ascii?Q?xISkUNIPa5f5X9ZIF/ZoBH8F8TAYg+oU0AD8YdcyCRJvYsb6I+gz/vuVUniv?=
 =?us-ascii?Q?WQ9dqfkYLgK+gBkKSqEgSlVFoi1zgbUOpD2McDl3M8nwNLK79+fDa1bMrosK?=
 =?us-ascii?Q?8kN63nLzVKfY35CierU6Ziy8apXGnzLCb1qNeLaMzxqph8SslbksWF5DFmKp?=
 =?us-ascii?Q?5+mzf3GK+ZA+In8xZ66j7vUYbXf9wJoVacwGKxX1i7wmWosCKhLAb0ossfoh?=
 =?us-ascii?Q?PhuGh0a86ayAw6ixmCY68E7ZdFzr7pVo+OBR7Nzv8qCraFeGscagh0tkeym4?=
 =?us-ascii?Q?WkBZ0yaTJUVAS7fZfSSrGLU/eTh8WwUvEl2JMdU+k2ap4wy2Nziu1Hx/1Txe?=
 =?us-ascii?Q?GzWFj5KOIn8E6gImgp2J5bVkzpY1kuucatedbgI37SFieSIVqhtcbQu04IZk?=
 =?us-ascii?Q?k4MxofV5mDfwloJ+Jo6pEyOS7qlv844+Q2fbm3G0PBYoKVkuhjBVTaGFayse?=
 =?us-ascii?Q?YvSBYnoZmhgZDzAt6urHlORwHtyQ+yFKcdGCNVWC0wwvCa4AX7fMvG/mX5cU?=
 =?us-ascii?Q?DIoj2lF9kejRqeZsd+4s1nz9nvt9bl0nSK8mvCoviMthbryBQVRnrBHzV+3J?=
 =?us-ascii?Q?Wf4k1N2z6cMPVt1e5R5nQxyX7JRB9D8gNx0c3Z7XWRT4HZofieJa3aJgtBlT?=
 =?us-ascii?Q?a2shF+BxrfJe+QD2QYrkwK4C1hL++/+q9MPXEw8vna83ye+egBmsDqwJlfUL?=
 =?us-ascii?Q?W++k8rELDnK2aNr5k0bJgYM2LPLwao+KqvTDok9nFDtpc+eEPlFNELBo1eJW?=
 =?us-ascii?Q?nBss9Dm+62AW7EJ82zoW0I5/rIUB4Dndtvzy+2uvwcH3DZ+iHpI3AAr/9noe?=
 =?us-ascii?Q?dY/jJZyuMI0Du9kAz4F8MYp5LFx+lMJBSpcKL46ybbzFVcA6ceKNTRo4wiJB?=
 =?us-ascii?Q?2tQ98884tV8VeajIczErbgATsKZ2Cmxbj/h0TDAcTujJkul6h2t4QfPQhpDD?=
 =?us-ascii?Q?zSSrWKONZlNgw9mDGMA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.4802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d34baf-627c-48e2-1b95-08de1d29d88d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4284
X-Proofpoint-GUID: JqnHn2pGYRF0sqiOq8FupLKrnn7MQed0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX+68ff/Pzwxr9
 8jkQ0mAkUJG6E4TpgdJYYlwiLsNY0gmq2dDTUpLf/MSTn9SvECxA2NPeCVfocd92r1vTq0CE5uW
 uK0742NI7bY7V36fy9Nm72XPjul6kvHKoHVbCM3h0FcmYD1K8Jg1+9faIfQYaa/dJz3561DxqWP
 hJgHnNlYo6LrGLkzepIPZRLMNLO5G0GmbeCW9fGs40Zd/2d/0HMdUdL2TJkDbg++baHuRI0i0lV
 rdIFTPMCndFg8U6hVV9aVIdDuF4lFeHWd5nO8l9n/yjXvyJ3R5bamGWh0RVyMCywMy3CMNhcyV/
 4muw6a+RY0ryfhMrud+WED2QHVPvxkznVgShw5qNcc73pwNUM56i/wMnoRKKIUa/YjaWAfuGHOg
 AvWYHL7nQQWUVbW8ksG22/+ecGOnnQ==
X-Proofpoint-ORIG-GUID: JqnHn2pGYRF0sqiOq8FupLKrnn7MQed0
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a22 cx=c_pps
 a=LryC7IEqKcSdoWktnkYnkA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8
 a=v3rgw8DwH17jaVfoKnAA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Add a helper function to write out the SDCA blind initialization writes.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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
index 6fbb241d9d357..2cca9a9c71ea9 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -355,3 +355,19 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
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

