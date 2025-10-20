Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF813277807
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975755; cv=fail; b=UGW70nkw+gW6UtfeZZMtLo+k5zqHlX2xV/YBAZsmhjZWErAM6/jfsmWwLWj5sUxqL9PZDnHasJ9S9tmvXo6KR4D5tdmwLZhypoCmKrcmjFNnXr0EVmXiPEjNgSgtZMypZxVWP4mcdBL3KEmGeiTSYSSL0i1giX64cJT5WwIOg6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975755; c=relaxed/simple;
	bh=Drt8p1cxGtYzIGi7J9PZybw36IwDd7NQvcpDSrho7b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ohz5DMTt8WUGNxA9fSoIpMG4wsfp/5JIz3eIa0JoACnam0FlfYMEKMI4we6H/hAiHZ3DxWlbwySiit29WTa4tvzUUYnopoqMi/e2p+K1ir5SVOOb0UcKjuf8fZ9HFi/sWYQYKZqB+b0sW8s9dVZpruF3Vcs90baJoOEMfxqLn8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h+ndKSBU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wZ05t5MM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h+ndKSBU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wZ05t5MM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAeTn941384;
	Mon, 20 Oct 2025 10:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rL3c0wIHe2q/ypYxz/Yc2xgvv7l2TjaY/dQKN3Xl66M=; b=
	h+ndKSBUb0PdguM4tlyHeAb88QnX86qffjVmkcuuENWynmDwbytXKgPf95X8gTRy
	UfJEI5dCTKduf3QbruP9AmCDR1ZdnIjHQ2yIFzr27/LPM+NTgh5odrAG3bSCCBPn
	U9XwmU9NB67iqo9XsjfXIvYB7ts7k2UTt2jzem5/Ok5FlnjN2FO6YNQx3VbTSjd2
	6XvGKH9thhOQNBe22cbTqRNpsFZDID6a212RUduIqonyW3YTFJEjY7kPKV4zcZFM
	N3LXRxCQJOSJcP+zS5rvm/OvR/eb9rwIfZAT3DQvE3AZ5zmB7lI7tEDEQ+stmTU3
	Rcodd19O5V7plVFB67Rs2Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aen-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p823wa8K/MtCgz9u6vvTPyexTpw/JMLMvDMI0QS/sWDubDdthq6R0xNC2RKpg4j3AiRV9VtvdW5yrHR0JhU3gHTnTK74809sjTWL8wxUUXgIS8CaA++N2NmNiHlg+ICVjfqdruNKnZpPfFYB2hHnFK3MhkCyQbgMEWjQkkJD6SUgtsP6tvsrSEGWQBXLTnkNn+LL7czE4LmsuTvf0eFMTpiRsftYiUEa6vuVikqKcZeYLNOTqxypcPbnFRGhAB9ZaK2s9WQAAd1x7kGGyh2vNUhGAf3EgwKuMqKbAsgM/63Xnn2LUPAkiCcOpJWmLHLTh1OkLEU6VtpK3mfHic5u6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rL3c0wIHe2q/ypYxz/Yc2xgvv7l2TjaY/dQKN3Xl66M=;
 b=uwy/DW+NskuCOS0q5M9Eb/jBMDtqCX8GwYoZaXD2BWdU4oenULqSN9SxMTZbhvjTmwxwYry0tzKyHpU2drFNn1THwidTNERdpdbrjXLIF75QOqFG+LtnsYD/XGQcKHSAjYTUARI1r+CiudMzApNpNi9W+CjMLVrn+sXALj+lEwgNZEULJg1hEmh21qlZIdo4G7dK2nK/aqB1QNBq0zCT8DiZrkljKFLNX+/PUPrUBSoM5GGmM0/I/AmlAeW0gOn4v2EPhchrVzo2YbArnWzBv8ZFFiZZC95s+ewlTNYf9zne8I2SRB3G8WfRFBIqH0UzRdWWS+9Az7YZsZlesJgbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL3c0wIHe2q/ypYxz/Yc2xgvv7l2TjaY/dQKN3Xl66M=;
 b=wZ05t5MMMFOXwGEHq24JkIwMj72WFoR+J46biiptHZ9Dw+U3V4Ggoq4c//WrQBL/eyXrbRd54hCAdgNMCiEP68LioyLuQZUwuIjaHR2kMV9QQSgsPShD5wm5dWbafEnlIk6lM7OGK4OyjaBcOTBXvUFwL9B5QSSk9WKWptC5wxI=
Received: from SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16)
 by PH8PR19MB7120.namprd19.prod.outlook.com (2603:10b6:510:217::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:22 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::9b) by SJ0PR13CA0221.outlook.office365.com
 (2603:10b6:a03:2c1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Mon,
 20 Oct 2025 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6A78340655D;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 59CB7822541;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 07/19] ASoC: SDCA: Factor out a helper to find SDCA IRQ data
Date: Mon, 20 Oct 2025 16:55:00 +0100
Message-ID: <20251020155512.353774-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|PH8PR19MB7120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ced3b3b-ba03-4cb7-38f5-08de0ff11338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SkoSupx8lARcfY+7ajg+SD0EDOElwHR/79n10aC+NRI1kJOzfmXe8VFbopwl?=
 =?us-ascii?Q?r0Olw0nyEofHo0jiJIMZv0EJvRTeyps0zmpbEe99VE35ZmlHSTeuGTcq0RFF?=
 =?us-ascii?Q?br/2m8Jw+lnZfqRriPV6x2nqt9mr/TlXfDF22/A9vL1RDd0Jud6XRQkTrQQx?=
 =?us-ascii?Q?zTOZPaBJ+qRklU8Hr89gGkusTtwob3DMhu3Z66bPm3W8lg/1ockqPQlwIbRl?=
 =?us-ascii?Q?WRkYouFKE6wD9I0wpkFqKYDJYRxngflNoyun4dIlqrskVOsgyfTTkIuGy6f0?=
 =?us-ascii?Q?cmw7vxqFC0ZOrYZSjnlattQIwO8EEbvSaK7ePVMh9P8+pRHwkL20HwFAwP+k?=
 =?us-ascii?Q?N6M/OvEQC7DOlGAkUy/OEXale6nClDfgBbKw9hVocJpAkXOqubH+lnMlVxMj?=
 =?us-ascii?Q?JwzGTl+B01LtwAyQ6ZFjoNBFTHJnrs3sRcS05f7VYb9KkoJ+oUmMSS3h+t1v?=
 =?us-ascii?Q?Duf2k4qm+Mx2TkYtxBha8u1fZ7yzcgoMyQs7m9QCxR4q6uUBBhW3E70Q7pZD?=
 =?us-ascii?Q?GSeQ79yQ/XCsGUl2tAWTey88jORSrcmcjOFk827aS1IOiDXJ2m0XiZQApIAm?=
 =?us-ascii?Q?139wF+mtJHUZhKXfTVzvYIjoFHnDVMezLoahKtEJ/swBHJHq6OFy36SLv5rS?=
 =?us-ascii?Q?wZtWrZMv4Rys5RQo0hc3a3Vno8YoGITbVMtHQsMQ0kaCHNUNwf2kVVTCj/CE?=
 =?us-ascii?Q?DcN6m4Kgw78zHEBv6tQjPR0GLzmczafK/CqLPhthFdWyqHsQ4Tc49Yv5mtRy?=
 =?us-ascii?Q?g5tKIEOIKVYzZXWYN+rqCoUrZcr4olnKrfzSOKKEIi4BNaVNm2wOX1dF3MfS?=
 =?us-ascii?Q?hx0vOYuWH9UQ/7L2+3KBxRf91mWO1iu94VjtoFIj6Lc9b5yFEwpaMIP6kxzz?=
 =?us-ascii?Q?n/qFXQl5hdrgZrNGtN+oyrMgWxC7b8kuHL+Sj+99leFliKG8MyyhcylqLiTw?=
 =?us-ascii?Q?3whn1TvhSiUzcBn8k9ijvfLd6EAw1MVhzOruC0V5bJzFaiyhNJAcfCBaXbIk?=
 =?us-ascii?Q?F+fd6JWXMZUGxxPkszku+k7qIE6CqQI0wuASIPRR/w+Nl7YkzZTkWPnYFOGT?=
 =?us-ascii?Q?pfYuWJ+SlDuyYJAtA760s8Z12r/kpuoi4O2C7OOAI7vVsc7LcnVKpJ8IBJWW?=
 =?us-ascii?Q?4u9dg3/XZURLchygy0NIRQZJCLqWZx8gtKrWvLOyF+ilxs77w7m2MpITsmdW?=
 =?us-ascii?Q?xsVyvsXARTBjMLD2NUzIWPb9s+gcO1quaV901bOi9T0bAKqXs2bxi7Sipi1/?=
 =?us-ascii?Q?9x3KRkA2xhJ+bHDAstFH6yaQEPt9PwPFZZYVz4YqpX3FkOpm75tTQ9lILT54?=
 =?us-ascii?Q?8f5sUy5gwJtBrggecNMqzwawBjUJnWSGiAQyPd7DFvhN+1XxUYz/h9tnoOSb?=
 =?us-ascii?Q?Rv1a3Kixb1whZnUFF/Zx25qVNiZv0Lhwev+MZzxNgvwlOWZoRlXzW73EzFkc?=
 =?us-ascii?Q?PnExsmMxkTkhh+mVmjVOuDNDMJ8vX1X7MxHEH9UishQMBCzQumi5MeJjvo6a?=
 =?us-ascii?Q?97HBDMwC94ITr9Jo5hoEMRXMeWpf4kQLVz/NU+2acKzSCZjiOHse5a7pa68U?=
 =?us-ascii?Q?f0UwB7/OiO1QeY/Mxp8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:21.3829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ced3b3b-ba03-4cb7-38f5-08de0ff11338
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7120
X-Proofpoint-ORIG-GUID: pZY2opzEOsHyAbP0VUFj5HGaMPWyEzNZ
X-Proofpoint-GUID: pZY2opzEOsHyAbP0VUFj5HGaMPWyEzNZ
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6d cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=PGrNOaqWq3pGZ8No2E4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXzQ8nBOBH5kK7
 nz/4frtyuVRAYGqK7Z1K83ZmeUfA4YCOWdUysgfZ+JYAingdUS3yqoy4X5G9aYiibpl5i0NeLqF
 DjRjr1ZhvHYW6K3v9p/+ml1EwNAYX32DVI96f7qGukAC41Ym34Kf60tSZkhwjnJ9n030LY4r5dt
 U1GY7YCJy2b45I/0+FT4tkGe3iYpU5vzMEwuNTJw7S4XTI+oTHB9VHO/y+D2YuF4kerYPn1HNX5
 laU1AQeQkVNI7dLG5662JJ38+L+Q8TfLIHGpDoBQQO61Zc4y7G+n0oZz/bZVDjlkdtJZriZ4qel
 o9v6W7h/avGUx/J40YNLBt17PRWgiB6hN5A8V/PFSUcfc73NOMLURqfLviedV1AJKjjrApHDGnU
 PYfy+671wvqWKmhrp8wQgwiKHjbl4g==
X-Proofpoint-Spam-Reason: safe

Add a helper function to locate the sdca_interrupt structure for a given
SDCA IRQ, this makes the code a little more readable and will facilitate
some additions in the future.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index cb7c7a6f356ed..2b3bb7d0cb443 100644
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
+	if (info->irqs[irq].irq) {
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

