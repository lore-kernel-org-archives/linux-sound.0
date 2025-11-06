Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E935524DCE2
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429905; cv=fail; b=FeiEvphpPQqp17g0bIwvMcibvEm/g19BhNS+ofaQedC2dOmrc8P5NYbI6miqFeZSmlzcsE64RN0JJaRO4bVGaxpS8am/skFNQFILh/BE5AOoCayVtJK5IksceJoZ+86VI6VQ9eBZciQfgXB4zxHLObiaZW/ABe/ULaOCZdKqSUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429905; c=relaxed/simple;
	bh=PR5C9VA1XKTN3CiYnV1lQGECQQaIyI3APrETzygXnCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBpucjpq9m7PNob/83w/Srdu2aJDg/PJ23q0c75CIcBhUR6Zc9OdDNKDVfVGnedTtDrvM1TdKNbR7oJIWAkFR3a9+nwKvxbdTYb/Cuo5MjentmmQA5AyJlnaATrUD+gtCf1EBYl6FTJx4l6VZO7Xu+/UjgvfZSIyAj4wSiY4npQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=F2IgYFJy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kTv6Eeo7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="F2IgYFJy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kTv6Eeo7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65oYv81489066;
	Thu, 6 Nov 2025 05:44:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=edLWgfzqJgmtFphFmOJ5XYX+vlPUsBclfHmapRWLKr4=; b=
	F2IgYFJyi9hZwhTxz+WHdbPuSZaB029VL8nczUPcRL6uUOq0R6+OXgQ638VkGGoB
	awrHrVM0qmy0J4yAjBAVqBgdUgw1RG23ip4P8QRS2G1oba/EWKaemX7QTNxbC5/Q
	BFpluQv+G86XU0NNXhTb5o7CzhDk6v6Ui2R9RntreZ5UD5i76jd6oPkL0JGoNAxd
	qg/+I0bzbcGG+gXJ+tCftdI8ZPFZcxNwpjgEnaCG7kRSpajK8635BbE18/oKRfme
	GuBDq/k7v4EzmcDFTx6ud8CrN3rd4MCxmuiH6XBw0AfQabZ7hjjX0XgAbWvW6olI
	6yUfdXboD31ThzzkpGjUTQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021141.outbound.protection.outlook.com [40.107.208.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCG1Zn/kfNqYd8AK1iDCGBLu6hWIs+UJnUcHLCZSC3XvZzVSLcA3GfXPstJBw78FsyodRFch3z0MKsclCdbOoz8Nrt7hXFlzEnvSGWzmsmh6FvsxHzMYrPgBZI71YbYpU4uypODFaV6vmfojYmmhA54OqMIjda7J8aP7eep+sWQ7iB6WccndQ04BOA9D3YlTgylGgwzXOE8RE56yYIpKBsZHY1wxYjuz6q8l6mIIn3DoIEIr1ONWQo9lb2Ci002PvBdyXAt4qmilsM0GJg0koSYrc/NVz5skaoBlhTmo4ltlbVy2FrUAMvDY7TmqaoXJn6vbQpBm9ZOVIrFfWAKwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edLWgfzqJgmtFphFmOJ5XYX+vlPUsBclfHmapRWLKr4=;
 b=UYpFMKDGM39s9YONyU4UByv5aW/IXnX4lDGG9hLseOYyOhVKgjZLCrgETwJ2YTAftltZSAzFEHc/kGHlDmh1SdpjrOUuSOoRG+2NTxtyfyyUQ65Lm0TR6wO/uY6v5MDhEzJN1xa4BCmz78g/DjSx37mjSievPcvXpJ/x6HWOZL66dfv1OJPe5r3Gmmd9+OKsTWuE6+iOSmE+urGiSKXrmxdZmXT6hWVwnzHZ1haqcD95A23OEAl1uig8vbAhmxgmWPkzNPXe8hRy7Usv1Nc3gqKcqgvaUfPCYCMOsDKAWLkxRo96AnzHaEW6GfMlGxw7h4ZFpnVILy+WdlvbMbpkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edLWgfzqJgmtFphFmOJ5XYX+vlPUsBclfHmapRWLKr4=;
 b=kTv6Eeo7BWMUx1LzGMDMcU+XGIkEF+lce/ZMMb4tzws4SJ/YenoxnkcHZKa5QD9IY5D7h9jhYMwWYy8g+KYcIFPWps2Iq5VwlTmO2yaaTUvF9zlo4BfNMVEfUjCEA6U9EkSMvGwgO/B0AreVe7hzV5QaZUsab8KEXuJ3AG8DSCU=
Received: from BN9P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::8)
 by MW5PR19MB5628.namprd19.prod.outlook.com (2603:10b6:303:1a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 11:44:28 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::5d) by BN9P221CA0017.outlook.office365.com
 (2603:10b6:408:10a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 11:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Thu, 6 Nov 2025 11:44:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D2E41406544;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B0F1582025A;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 01/13] ASoC: SDCA: Remove duplicated module macros
Date: Thu,  6 Nov 2025 11:44:10 +0000
Message-ID: <20251106114422.906370-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|MW5PR19MB5628:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f249cfa5-f2a7-4886-a09c-08de1d29d744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nYlvtkPKnFMjGBpFyU9OWJpkYNejkP4Pfn7IwDTOSEfAk280ZnISNbiJCaIX?=
 =?us-ascii?Q?nUY6n1sxfzTUBf3Bx/q4fJwiU6PqWiGG1NePNP8tIzqycUa7gaTVIcLWYuMX?=
 =?us-ascii?Q?4VmuQ6D3twnTM0is8DD4eVlSj4nnbDrlZi/HEhXPUmhBpl1NTy+SWX5J0TFV?=
 =?us-ascii?Q?6Eon5U919dYAOCmv0Wvk1hEHKgxsFk7ptAQsHy7VIoYlPzUZSPGtcjrR2q0E?=
 =?us-ascii?Q?qE/I3hgZJ6fC64yLlJjc7Y+kDv2V6WBlNq95NfzQv0Ac8cMHrKk+Fqcb08yK?=
 =?us-ascii?Q?LZ47ODBfqNX1GhStuVcaL+rXkLnCRPQACkQetgZ1kQ9PjP497WMC58GRSLr0?=
 =?us-ascii?Q?Dp9wlz089qajN3Asr5eMUOiC8Zi/+dFM5M4zFTBrcKClKv7AvXliuRkaIFAn?=
 =?us-ascii?Q?636lzK7IHeD6PQ12FsjKi1e3vSqLlBDfEXv4zMByKbOJBNzXbUCKctHDVXtJ?=
 =?us-ascii?Q?4KhfADTZtpA5+L1sobAxRf2D7s+AvU2mELWDvskIhe4iBGl6yaiNDmTB6aLz?=
 =?us-ascii?Q?bB4r/21cV1QfxqFP4Ug/nSF6KZbT3bcsmq1Ywx8DRIkHbySxXNdvDT0w2qpe?=
 =?us-ascii?Q?eExfXdV5hJT+mVQBu/wDKfbEVlbT6b1IzTia7RccyRJ6Y5e3T/2g73EEQys8?=
 =?us-ascii?Q?73RV3MWp7Pi90n1zIImGzNJElh7htEOhRkWtr7rasCCsYo3LzT9fFofaetvv?=
 =?us-ascii?Q?zEuAZ9RZGogWZlU+qjOLE0Ehu3E3/M9wvQAt7u9jmKCifo9iMy1ek3HFJD2g?=
 =?us-ascii?Q?PFnsmygQqY3KZvOnAVpXzkMKy0HnR3x7sUSW1FzQLepuH8I/P1YTDrxUg0vs?=
 =?us-ascii?Q?r6UCOQg6uOg7ucvSybM45Fyd83Eoh1jlNflHq1Vhoalg6K6OUhPn7h2/dayo?=
 =?us-ascii?Q?q0qNRDzmSQa2qIu55TSxhNQAasjkU6VwdxRMHrxNOuSsgAvw78n8y55okVaP?=
 =?us-ascii?Q?7cpIA3dTFIuT5HCRgePW7KrceReSazy2u2UcyURmyTVPzHY+xZ+DpQQre8xy?=
 =?us-ascii?Q?Tb9NNq0mFCVutxfReyxxgzYjU5cFcTquVkX2sK4uLQU06bdBdZGrc7yeAowY?=
 =?us-ascii?Q?VJGJLoI+FP01KEQtrtkQXO4RESHdQC8AHch/GqUcQECxxKH+Eo7PJqs7NATw?=
 =?us-ascii?Q?QlSPkHk6B/hh/vnIaEWa4771xLybD/UPH/0bxW7GPeDGkqjoDK+LVJR04s26?=
 =?us-ascii?Q?FR5yLrCiWqNHOPFDQzNuXpxZ9s2RCCEMcZWlEg5aOQWYSR51FeRyBk0ola+F?=
 =?us-ascii?Q?oY8JsddMnxrH8JEO5ATQL24ynUAcT8xYbuM7vJry9BoQS946EswyGUKpmNVu?=
 =?us-ascii?Q?TLwD5pGRX7FDcGRm0DBFUclrHTByX7h3p8M1x899gpYZWz7CbCSDnd3Tzog4?=
 =?us-ascii?Q?l5FFyroBEFiGA/iBWPbYO2C6HzDYumplYmhJYRyDQq19kgzo851Ep5yEIIel?=
 =?us-ascii?Q?N5SLRUTow1dtOaXn1S+AbNnYdmfaabkFcM9eoOzZ6i3fRc8X8KK22QcKlnY9?=
 =?us-ascii?Q?JvFuGg+d1/UrfpNbv5HymQXsOxF5AKzxLa7Pj6QhosNDf1vBVYhhi7EtbW+0?=
 =?us-ascii?Q?1Vdyk0YMdwNZkKZ/2J8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:27.3461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f249cfa5-f2a7-4886-a09c-08de1d29d744
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5628
X-Proofpoint-GUID: PWKMLVIvuUIKpfuN5kkerKmgaf-C9b5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfXz57kjJEEPFnT
 jAZQIj3FArhvdFglcaUIaXH8GTFom8rqU6aduDHe/7ccvlnwudWsLIx1WKPBYuURhfek6mrkDCN
 KL1mU8n5Ee/mxlM7dEOwDNtRc9fJgM9xKZZhCM7636olZk+kiAYtbjCcMLvNzOjaAZY78GEw/r3
 N8hPFSkq4a+nGYg9dIhvbJsVzqUgYrW4zhLY1cXDQESQL6RjwYRYmg+E98+OVzlpS+hvmhG8pFt
 R1majt9MrdS3y8C0Wk1ydM05Zzs8OFt/6fkFQJPXieVROvK+wXpq+i1+wV7UpTSps3QCsLMCAW/
 tYkc8Oz1jKj9LMqk5gD8ZCtg9F7NDQl4w4RBMSyyv4Q6xDi/5Vse0y5eD4DhM6h9K5bKIoSqP9E
 L5DpAesnTWl2E0oS3rp0LzclmU4eYA==
X-Proofpoint-ORIG-GUID: PWKMLVIvuUIKpfuN5kkerKmgaf-C9b5S
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a20 cx=c_pps
 a=azlkv/KBQR0ub+Yip4pvTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=1sz-E215ex2bfD2ZWG0A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Both HID and the IRQ are now build into the wider SDCA kernel module, so
their module macros are redundant, remove them.

Fixes: 5030abcb0aa3 ("ASoC: SDCA: Pull HID and IRQ into the primary SDCA module")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_hid.c        | 3 ---
 sound/soc/sdca/sdca_interrupts.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index ad53207b0d62b..abbd56a3d2971 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -166,6 +166,3 @@ int sdca_hid_process_report(struct sdca_interrupt *interrupt)
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_hid_process_report, "SND_SOC_SDCA");
-
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_DESCRIPTION("SDCA HID library");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 5176460416bbe..a18ec9dd3398b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -618,6 +618,3 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 	return info;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SDCA IRQ library");
-- 
2.47.3

