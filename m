Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13987327BEE
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084188; cv=fail; b=m6JRIO9geldJ7jZzCTNUJN5yWLyl0Vv8xSKQ5btiryj2EkBf8H9mJQSF3DjoXjKqXGKPnF9ov8UGEfM8Z4L8q07TlfUmedl9UCj9IAR87RfTw8/Qb1pnpK4lTAjzq1/UfVaB79WDsLBEzvePjG5Yhurj6jVm8sKKqrB14Dx1Q5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084188; c=relaxed/simple;
	bh=M4HyLPxCo9j7NO2xxkJYw7YCTDCMhX9YHUgKscSR9gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZEnrPzc3782LjSDeGT62LBmVOl2/hIErKeenFmyY0puYHtlRDkICmyM3ocKrmCucvvVbKz+/eLC+Gg2rTo+dcAMBvyiDJlT44oVCAeb2MsR+xOJIOkmAMIcJ8jQy2P30gJAASQvOI8cCrl5VLKZqQSX/tfbUTcI0EOKT/ogbbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jjTU3dK0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=b+QOePji; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jjTU3dK0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="b+QOePji"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4gsXs3663653;
	Tue, 25 Nov 2025 09:21:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3PpKzjToh69u3mXDunzBC5crc3oLzbnbZ08g2KL+F/U=; b=
	jjTU3dK03WClD7racf6LhH9b7EczPS8hMnVMKJok2cIjcFp59qZ4UGDpKURkeE27
	c/q2kZAamw2rwRkRR5Pog/Oip8qLFX2bEgVofYoMyuGFCmk3nW7RqOJLZSZ8Ffxy
	Q9me9A63E7/5T92rrDHpEqJKbGJAlwOTakhiWMbFbBb1FSwwnz/HGDH8bb4asHbx
	zxa2voUENwv7UBsWfVHqQe+eokb4d+jRzJ1HBDt6ly4giHVIJDnwDLY/5nCwc92d
	A2JoDj9OMBYkhbVCQ7PFenmvsNJjAiehpU879ckhymhrurTK1F+brh9wmNgZEeia
	zNpL6COgSiV5WXhoGQtSDw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021097.outbound.protection.outlook.com [40.107.208.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkb7cx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaiOIqy9vHnXGfKDTX6PpaZqOei1FulKkqgqvCmJ0j+VKbFYSg7s92W6ftdHHwOtt1izrljGAPT8ssfp4u6b8rVTe4c37B8471nxQIAmxuhH/oPX2jdKgyeQln9w0fOjVHevkHRQAM55p56KVS4UZz49YvnqJOtgxMjO6Me+2naVZie7DHr9XDoWKhZpOaSA9P7h/RfgjejiNFZMGSgvMs0aNrlLxVTKxOZTCmqg+R7iUFBnBX6nOOql4Y+jVLC2JmsrPdWSqzPCFYy3UHtaTap3Mc5ncMKAb/VtHLPohUfu7wOzpXAZdJDF7EU0OGaAUEoR3F97ds3ZDk7auGU4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PpKzjToh69u3mXDunzBC5crc3oLzbnbZ08g2KL+F/U=;
 b=XuE1W9km70W0vUK6MQty/gNeOwHqH7qiuULTn9lr91yvbRbyUqir8nc+Y/g2KsITOfy39QWgNsctsuVxV1AVGVd4Tgwe87tLuJLY1RQRnjIEdrPClsUeJ8h0iD5w0XKK5OjiAkfWtuYoIuf1sHHKQUYu5EgBUkcCvZXDC6+UqV28qiRXPj07sJFH1OoVVMRp7Kq298UGsZ+lw3i12/8OOnYxW4xsHgGfimKohXggRas211zssGhvVmsPqK2uNPI45Em8q71eSacHJtqQHp5caEkkxnytHLwtaw/cVQB5AFfy3W92cp5spli8stOGboZeGG4uyAbYglFHsWtD+Zonhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PpKzjToh69u3mXDunzBC5crc3oLzbnbZ08g2KL+F/U=;
 b=b+QOePjiorOmc/b+bca2fap5M35l5ZJkrAylJ8qVJSFqmkblbz/7mc/JN9KJsJ6zuTswr5muCMpwx4ikxjR5+rqNFP2pvKANDJHtSmIYKHRYwmobbjCxhciz7XUfgCqM0hlwI5ycPISnngs05Rp+FA0hGRfShK49D7cGhHv0or0=
Received: from SA0PR11CA0025.namprd11.prod.outlook.com (2603:10b6:806:d3::30)
 by LV3PR19MB8366.namprd19.prod.outlook.com (2603:10b6:408:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 15:21:34 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::38) by SA0PR11CA0025.outlook.office365.com
 (2603:10b6:806:d3::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 15:21:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 84D00406550;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6776A822541;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/7] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
Date: Tue, 25 Nov 2025 15:21:25 +0000
Message-ID: <20251125152128.274808-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|LV3PR19MB8366:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca992fa9-64fe-433a-f473-08de2c365178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZQhb1d5NQJ5s/qNPrJwWDRAv3bUjmGEPROWUdocDhh9BWsGl65GXDsmKX0oc?=
 =?us-ascii?Q?mVyYIl2ZBBAzbi0jbEKx8KyR/233e1yJCKTAD4oEQ0KfKk8eB5p2AZbWrdQu?=
 =?us-ascii?Q?QUFZKASq3u0Bs29WH3j8UX6TPArTsbn5Rht3k9gt39CJv893OB0dN9XR5b0M?=
 =?us-ascii?Q?YFq4+eRnw/D/8WsOEGz7uhh4IdyvI/qIxV0btDMQVs/RpWoEmzHOUxyTBiBG?=
 =?us-ascii?Q?E2MW0uKG1TGUV4T5L2PYrjGP8xPKJT/gcm1K6RP/LX0wtXc69drb2Gp03nF5?=
 =?us-ascii?Q?hIfX/1EkwrA0D5OUJ4qBuAzmk+OHA2v5bE39rFYB1YyOhy9bYZa0eh/3R/rM?=
 =?us-ascii?Q?nB2AZERjnJfK7khxVyF/ifG7Rty+8E62K5SiN7ULMutrzqsba9thlGW99JwY?=
 =?us-ascii?Q?8ZFBkbhVFEAGg0GDNbSlur+FJousj39fQMYSELCOd2ieV9ADxJIVCECQpIXh?=
 =?us-ascii?Q?fsUBNDS4qjC9GM1KKwTMptf4qe3ADRY2EHDEtRJMm7V1oB5sjVyE6I/GBwUs?=
 =?us-ascii?Q?TnDQTIm+oKeYSMM/l0badXrySwc7ejIkUb9/bY/qr5uj0LFvuoi5hL8mb2+K?=
 =?us-ascii?Q?IzBujVL3lb1dQ2vLZcFkyMQsuE46ntcmOWYuD459bZQd1z0xO+UYNJ4iyE4u?=
 =?us-ascii?Q?9VxkWXxzF8528Gnv1j7f/3ycLxvg86yUxcdUXf2bMKr8mfV9IezPMGsfG+EW?=
 =?us-ascii?Q?5O2jlZXOL+VZpqbGCQKx3mhMDl9dDmTEYB4EIDqGCE/Z0wpmQ4zf7nFN3Dd1?=
 =?us-ascii?Q?h+MXQ4NXWYNZg48cGP1/Bohyj41rtEE4zjd8XMGlFKBOcrNTOyPGwG41Mp8/?=
 =?us-ascii?Q?nQMv98uiU7Lkeq/8SJthpwTd9Ndkjc4oh3/ZlR0WCHkyXhojWTWFAOnSEi5H?=
 =?us-ascii?Q?mKbT9HI+Z/335/Xr9kcncC7sjbfah8ryRtQqQxGDA7/L+tE1fxiVr+eUfADW?=
 =?us-ascii?Q?/RGlrx0EHt7t+/lxTVW9qmLAzaXrvdmof29WLip/ZDVY1rBn4LmTotYFaPfR?=
 =?us-ascii?Q?u3LSyOWklZ0WtXmeUdCjex9fuqecqX1OTpVCrtYLWhdv4OcrvkEXwG3eF044?=
 =?us-ascii?Q?MkOFdBwt5mCk1ByNqXgr+AvMF7P+3Izq8decTJUP8mzfm0LFzPT5KHGP+4t/?=
 =?us-ascii?Q?uprSUXBPcZzdQbNVosGx0zwxdEdAbPn6TfSOw8bedScM5t0aUMAEq5NObuiQ?=
 =?us-ascii?Q?ezbwd7ys3IhoOCQu3Jp6y+gXG5zT/iWbGTGYV1JeXHTJy7dBNVTPINX89VJ9?=
 =?us-ascii?Q?hqbgw6Zqhaz190xVgfY4kEwEynBWiTciQvlwAvXs/A3iqqRsEfoQP2hpnLKW?=
 =?us-ascii?Q?8Ccu50XXIJlyfcxepUjAAoJHlGxCvbaGHCKWC3tioRxGtPDxlsH5uMa6NkJq?=
 =?us-ascii?Q?BYFDT5G0Ss2JLdhcVZEu1xmFX0w3sGX85rnfd82kGfsugEyfDwDk44Y+mGlY?=
 =?us-ascii?Q?+ZLd+xFXsBl/jhXrFoxdCWrYIJEBA9pNuq1kIstYmI4Yj6R4j6xkciuxbgbf?=
 =?us-ascii?Q?GDIY9McJJAR7FPX6Fb0I7T1FW8K3B+xBlyvHZdqxuGDRZTYhn6NdlUma3ExN?=
 =?us-ascii?Q?GSE2ZiwQsbUA8uNMXL8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:33.7110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca992fa9-64fe-433a-f473-08de2c365178
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8366
X-Proofpoint-ORIG-GUID: UgEkPczSXej1KLxNu4Hpwqupq1jJG-Is
X-Proofpoint-GUID: UgEkPczSXej1KLxNu4Hpwqupq1jJG-Is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfX3cHy/CIYCp5r
 Zf1pWn9+cAwjZbBcDQ4NO4ObZ6k2172b3LPuLCAhIQCgaoHXhSw+1I/d425qXyzQmFchLgkc4Xp
 H9CfQAl2ovVPoAOC334KIxMhpA/1/yCEoxCe1/m55XK4ZKZuueOC7V50+ig1KQYcOj4bYsh4N1A
 dAcUJBkXL0SOyfMlVm2OaCeLESgTM9Ztz6raSs6htBVLTioKAZaxFv5ven7OxhaoiQq1SbVJy6T
 lgwvNRmY5DbbnCGx02VoTK6CWR1aYW9O2odDvAUzwKPnW6dwZ/QUsMUTpVMU6TN/ZZwS8i/n7ui
 VJ6TF8bpEb9rPUFoduDG2CcPhFhB8SlqJODCPVnk0zfT1crlIEoWlS+krvMxhR6B+BvNY/k0Azd
 q/QMKLAxRfIv5mvIYqR7ir9ZJlZ6bQ==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925c982 cx=c_pps
 a=HfG1oWozJQbQxD3IkfRzFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=orpoPZxsqkjpxTfYG34A:9
X-Proofpoint-Spam-Reason: safe

Add helpers to enable and disable the SDCA IRQs by Function. These are
useful to sequence the powering down and up around system suspend.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  |  5 +++
 sound/soc/sdca/sdca_interrupts.c | 55 ++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 8f13417d129ab..abd39e831b63c 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -84,4 +84,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq);
 
+void sdca_irq_enable(struct sdca_function_data *function,
+		     struct sdca_interrupt_info *info, bool early);
+void sdca_irq_disable(struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info);
+
 #endif
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index ff3a7e405fdcb..34bcd18072768 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -541,3 +541,58 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 	return info;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
+
+/**
+ * sdca_irq_enable - Re-enable SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ * @early: Boolean indicating if early or late IRQs should be enabled.
+ */
+void sdca_irq_enable(struct sdca_function_data *function,
+		     struct sdca_interrupt_info *info, bool early)
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

