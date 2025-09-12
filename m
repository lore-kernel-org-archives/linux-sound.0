Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A72EB84E
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673334; cv=fail; b=vCy1CVC9TtsAFZsUmXI9YT46F8uHSF76mNKHT6UQ6Dz0HYxVZgTMkLMf5BAWRCu73tw6iBOgHvHAXAekTy4bFJzGRugfbPJUx2/lbbbn+iOL7YHNQr5TKEMJWaftL59/yPm+4mlzrqP5+xYJLRqvTTMAhZMY3axSP3b7vzM82BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673334; c=relaxed/simple;
	bh=9dzeyTXrIyBbM8pMIfjEqTBixKTWgaMT0PgLG/b3I3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iS8EN30xPdWgCTFm4Ytb0UY2LgYE+iJCAGGTuU9NiaadRwVXtin9ySapbWnIfzrGp3NsGOtHhF7K1iz7tMf/WF53fcbzCFhohXTlwTzTzFcOq5pCvYreQkIliLSUK9qpk3NiDE9UUuhAgIYNbs+01/gi0vLeyqTFj70h2uLyZRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DFVijF+q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=g+2wVKDx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DFVijF+q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="g+2wVKDx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7NqXe1382687;
	Fri, 12 Sep 2025 05:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cak/Ol7GVmCGM4Nr+hYY7VV3p4AofkTAsdXJenPZRns=; b=
	DFVijF+qd2U4QZdezA8azqB948C1lV0WEOdkHuA0n4mny+3CBVvCwbEpQVaw8Tbp
	XCqVfHHEQ/uzGl1/Dt0+ppEJiLozRZK2rhsceqzKV5o7R0KrRW8K/zHzTylQ3WMM
	rITdjexZ7LwVfZssI1WOtlhUv7ZRaw6qII//Q9RxCBrLmWvQdeEursFPdrgKnQB+
	qQSlLL5jtM6zFViE1Z13p6+FmDirF4tc3/dquinnLZ/50yUCL9tU9YGDFwu7/r9m
	ID8kKORuiSfXxdOK+Qz5cI8D5/L3s9CPlxKHbyf+3sN+dAiFvmnFj0HiD1j4YoRz
	muFCc8wisWJVQO2xPyWPpA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcphb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR8sD7716ugXMkUWU9PXq1+f6oDLbVtI6M/XWT156iMOIODUGB11PCY0q9KibGIjtO5IvA4taEByQrHcuigq0hdbT6nbWspgyCXAb+NMOl8rZ6A1OFuqxkqRrZtyXl7QfH+om+mmogIHs9EGCpIWTAnRA3t23ItEEOhalBaHCwqgUBc/e+1vAbxaecZksA/2DrWvaHT5gPcm/1QJyeY4bLBRWNfypBCBjC7qkGkTWf85hzCyZJF3MANh7GXeI20SSeddX00coodIkJG8CVozTcJub7w3YLPfrfI1e1XyMz0h4+N/6VzZNgQH8JwHneTBQy1cSFh2p0gvjBEzPfgF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cak/Ol7GVmCGM4Nr+hYY7VV3p4AofkTAsdXJenPZRns=;
 b=ZBLq6jQx6yw4bISSQ47/RedqwHZhjW04M5YgDTLUPrJR4OxpGXo1Gu4LScFBWyL934MyLUCJMEgpPqOrBTaLbqRxyGr9WISRkThq4ppdd2BeQNT6h0CduB8Dlndi0LoyDsAxV5Vhw6uUUBrUSsrYiM5Fs56IpmYuL85lOJCl8BOONGpux8dMNkxKZg0xPfn8qhm1v/aZYlIUda8O3BxVg05KQGsfxVDzIfjXzE6KcWWa8M7/s4cDxTpWsECBmBe8vP6yNIqCb18SQ2x2qINi2U7wnSN88m/RHF+isw6Df5XVQU2srTVoEroFqRALMqcZ2lYjPpVLALU+YbrW/uLaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cak/Ol7GVmCGM4Nr+hYY7VV3p4AofkTAsdXJenPZRns=;
 b=g+2wVKDxfEK+IzBHCaLxWiX8bXg8V8vRma4ZNthXCET5iPWsQ/cmHuDlQ3zVoglO3i3JEXwksQ007v4HKvmPp5HEEtAFlR4n51xG6ItCT298bD5JAu9MVdBeTyJZz1TxCgi57a/MNHjV6B3ANRRHVa+2rTXw1XsS7UQBXYUgvBY=
Received: from BYAPR03CA0028.namprd03.prod.outlook.com (2603:10b6:a02:a8::41)
 by DM6PR19MB4261.namprd19.prod.outlook.com (2603:10b6:5:2be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:14 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::e5) by BYAPR03CA0028.outlook.office365.com
 (2603:10b6:a02:a8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 10:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2B9C040655B;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C4D682254C;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 07/19] ASoC: SDCA: Factor out a helper to find SDCA IRQ data
Date: Fri, 12 Sep 2025 11:34:52 +0100
Message-ID: <20250912103504.2679226-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DM6PR19MB4261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ee97878-2ba1-4743-5c3d-08ddf1e80d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W8nJIYFiL9QgSgrHc33h26OQCF82LAzThYoC38X+cKeUXmmqrogFSxqQ+c8/?=
 =?us-ascii?Q?MrtKxzm1Jm6WYRYTrTCEFVIfyE+8M9hZTqM8P6/3fzGOmd1bBaQtbL4yj7Nu?=
 =?us-ascii?Q?sw0La6z2+ovScS2FO+oNHaq1Jdx7pc09xGYjkNOxOydd4z0N5142Et56Jj0S?=
 =?us-ascii?Q?/ZD0aeczzNX4cfaXgjPLgrTfBTq9TNmrv/g8KKlR+jR+JrWk1VIB2XLLmR7e?=
 =?us-ascii?Q?TFyfBCNv6mRK6hFczDe36jGldO+JSFn74kVoYOxlP4rO+Q/pwtmq19AsPJap?=
 =?us-ascii?Q?z7/FJNuOfxGVEcUWpWl0tAQRhSD96wGK/66hdoQyiQYqE3LXRfdG2N4kbfzQ?=
 =?us-ascii?Q?/vUJkbGeOmrNBc6+bbdqCx7UseclPbPishu77j0Og2vkZIUKneW9fzMvVAXr?=
 =?us-ascii?Q?K06Q9oAQ2InUumHAbONtYpyTLiUTqC2YLtzoGEqizv6vvxS/EiyWoRaQqI15?=
 =?us-ascii?Q?BNkB8pHoXLG3XafPLq65WPUH0BLOrqnh5xp/NB5g751xNgR51f0NNbNSw7H8?=
 =?us-ascii?Q?QmwhoPQIgZieTNlWbbr+aAOpY03mubf9zl+sqpD2Cuhs/67lCZdrBcs+RO0u?=
 =?us-ascii?Q?EAykB/sYIMOqT6/Gitt6ZQnjOYuJPsbPBHmAJ7TUQuCFUfwrKyiwGQ++wDcF?=
 =?us-ascii?Q?MgxMTBje/V2DGUpaJuDWozZniB+TvqAiNnyjLPlFxV7vP4DYirdDNQ0e70v4?=
 =?us-ascii?Q?D5kf0H7aTshCXTpTtKkeG+keEG6M/edCu/HeA3sF7X5p5NYGrlJIesdEcrWq?=
 =?us-ascii?Q?x03SXW3lSUIA7qx8qWC4GPXu6hAhPVJrOQL8gaIBRvy4vHH+mIndCixaku1t?=
 =?us-ascii?Q?2UsFpgYnHYx1PFFNd6zBAwCvqS3PPoO6Q5zEmL96keDFyLytPTruklE7xBxq?=
 =?us-ascii?Q?RjjTkhdhPJz2k/47DrI4xaWH1J0zWL4tzwFi24rAB6Ib+6G5EuZkSmSzllS7?=
 =?us-ascii?Q?InSTKQmY17gs6ajAEJBsy8OZ6Gxo/Qu03OD682fSYFa4zDZ6QN7uZgl/+ExQ?=
 =?us-ascii?Q?jvMcBTiOz3ktJBGjk650lx62Hzpqhe5vcL6YKJ3KoLV2R4TPKljPBl2RdLk8?=
 =?us-ascii?Q?UOudYUsXrMHj0L3l8tv+ZXzPt7BSFfj2Q53ycvg3LdJN9lG9TElwCvQKpXwq?=
 =?us-ascii?Q?mkBICFKGUNYlO4zoszwwN5+xZVWDBRNn8rfDx63HOOmeUFV+zkDr1EXTO9Zj?=
 =?us-ascii?Q?MqfgBYWP+YId/WSFbj5pdSCZoVXlfKqFF5Fy4BZmW6bOyQeExbJ1eEvwcBqL?=
 =?us-ascii?Q?J9RQIIXZ2Zf7muEzoneroy6DWvkcr1HmB+BI0vYOtCZzKrYJBKFz2D8hq2Ny?=
 =?us-ascii?Q?pVgV4pz6PA80dsBnIX6l+/t8Xrzf8j7fnzT0rVZaVpcWgsoOU6BUEYijSI4Y?=
 =?us-ascii?Q?INuCd49pHO2iBQNyv+qNY5LjvkuMpQZ1osA458DcVXATzITe4898YkR9xIyl?=
 =?us-ascii?Q?avW6YqAeiXoJgbkm5rAC4t/MaBBjihxGJs1H47ezMiznNjPxYutqlB9lvfap?=
 =?us-ascii?Q?H/8t566QCl6G22s0aUA0Cm2FfbNCerttVfBU?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:11.6441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee97878-2ba1-4743-5c3d-08ddf1e80d9d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4261
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX1M3Hb334PCA2
 kDB3ltSZak105kWJZabdHYIEuag6O0BOGaNE/mQKN6zVzT1FOXnOlC+GibMnT3NvrkZD2YUUq54
 7Fh1ohCwzJXNmqJH7d3Dgusgcuwsw32vjXjK7Qim7AO0F9ho5pw889iT7gk/HxjidLW6tpLrBmm
 YSM14DjSTtOjCukaYgGJMoab1d52T5IJZh3m/8z7E0MQDfp/+Kk2Lq1uquc+LEkdF2QiOqzN0Ft
 Gd1Qpv1PpxLsuGHJmFaXO6jeqa9ivUr9Aok11iLDHhnGpVmEdyrHad2dkRwB90QE7dpXgVxalwv
 6lsIlAPxGGNmT8MNor850Rz4OB6zAWd2ASUPyTkf2nFF3fvnmx1/c5yphmhY4w=
X-Proofpoint-GUID: TJJYFiPqSimw2mWnXG1564kcoxuLOGVc
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f766 cx=c_pps
 a=U259+el5m5zn0mdk/7qTUw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=PGrNOaqWq3pGZ8No2E4A:9
X-Proofpoint-ORIG-GUID: TJJYFiPqSimw2mWnXG1564kcoxuLOGVc
X-Proofpoint-Spam-Reason: safe

Add a helper function to locate the sdca_interrupt structure for a given
SDCA IRQ, this makes the code a little more readable and will facilitate
some additions in the future.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 348462dd67d8..9d24a75092e5 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -341,6 +341,24 @@ int sdca_irq_data_populate(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA");
 
+static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
+						 struct sdca_interrupt_info *info)
+{
+	if (irq == SDCA_NO_INTERRUPT) {
+		return NULL;
+	} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
+		dev_err(dev, "bad irq position: %d\n", irq);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (info->irqs[irq].requested) {
+		dev_dbg(dev, "skipping irq %d, already requested\n", irq);
+		return NULL;
+	}
+
+	return &info->irqs[irq];
+}
+
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
  * @function: Pointer to the SDCA Function.
@@ -370,21 +388,11 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			irq_handler_t handler;
 			int ret;
 
-			if (irq == SDCA_NO_INTERRUPT) {
-				continue;
-			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
-				dev_err(dev, "bad irq position: %d\n", irq);
-				return -EINVAL;
-			}
-
-			interrupt = &info->irqs[irq];
-
-			if (interrupt->requested) {
-				dev_dbg(dev,
-					"skipping irq %d, already requested\n",
-					irq);
+			interrupt = get_interrupt_data(dev, irq, info);
+			if (IS_ERR(interrupt))
+				return PTR_ERR(interrupt);
+			else if (!interrupt)
 				continue;
-			}
 
 			ret = sdca_irq_data_populate(component, function, entity,
 						     control, interrupt);
-- 
2.47.3

