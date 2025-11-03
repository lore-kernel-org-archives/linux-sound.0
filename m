Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0553148D7
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182620; cv=fail; b=kSTQRYDw1KlTprsTnStPS0nb0+YKWr815WDOmfbLTkAwbkNnqmpaXJpmsrTltHO4PoLM/GkPdFrWU2ltjbQno1aY7yFdu2FAGc/tmjhmtQOhKSTbDp4zBHsX6EznHvV2Yrey3YXcJe+/psYXXgabHQfBa/C4A/6HcytWfHZoAK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182620; c=relaxed/simple;
	bh=hWnGGNCj+jDHDGEXNQlBEV8fdw/QusBIZ2nOiSzWV6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufkR8MBzcGhjyUR0tuv541kwkjAgcunk/V52Hvh1RDYo7y28P/r6EAksjtqR2YoSBn08nkjsuPJJmj4lrhiPaYLqnUM9GGGha3tmMFhJgxBca/VrTZv5Wip99ftgh5a89c21+R2P6HdONNmnkS6ZCYkKgUe2l4nIdVjC22v1Aj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SFEbCbwM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Or9Qfdr4; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SFEbCbwM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Or9Qfdr4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35tnWT2534295;
	Mon, 3 Nov 2025 09:08:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1x7OxHinHdVBDsw56sFIZDOdII7wkK6exCaWcqGzPDw=; b=
	SFEbCbwM8WwT5j9sScYzspIhkL5srIt7ji3/XkF+bJm5Te5DYu1WvhYTGhszErx4
	uvIoAlBMG129HK3xJPVymBCc6xxbsD3NJEZOlygacONYSl1xN4Z/9rLKE5tKUyFI
	fxcerDdRUlCAaKxvECpOeMbQz8wlCaZPgIy7+bDrt0+CgagISDWD0iufTNlTf0FH
	OiBPgk/iFlLjzdfCtCWny4nIPgO7vrTa/BL6vtpVcL7w15osWqM82yjZD7M1EkKA
	5RUDdGFJCWwKVyXq8PrDVT3S3AgDICbZDpEClZp1peOo+VF+R4DEds6rqqMXrRSz
	UIDHqN38hKVzdFEpUkiHoA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020108.outbound.protection.outlook.com [52.101.61.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkuVMG3eIDaJJfzNxIOZcwvmTfaWtG62GPeMp8JOnAztlxsbeh2pwHbRrfuONSz7IE7QFozltkfBYZipodmO9g4xrCKY77lUluZBysz7gDhhUjP2ATWBKs/91VMfR+ADoayFJfWnpD2r3tCgLZn8103dHlXPzJWc3ZjVyBYcx6lIAeUUlkxAySFyh9zDpyQC7yxf8X6dcdAZqdrc56XIkenIvBid2tljJodvNaDUkqp5gNSwRm0vxPx3n/JWNJFLh/NE9lTwuTvOFjMmk9Oy5zt9E/sU7xR53EwpCH4b/oCc7AcGKUium/jwH+j9QA4gp25V6Lh90WgmLnZcEq/TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x7OxHinHdVBDsw56sFIZDOdII7wkK6exCaWcqGzPDw=;
 b=QQOSBEz1bIJasA6U5UFcnFLr5ukjqSGYL+4PeBCeC1MlvrPOBvvWTYUgtxxhB2hzQ/93P1r5wv0TtQX79M7WkUb2JUokpxhDGrzwvdX15gWpBOpUIAnfQR9qAGvnI4yNSavXkf1aXNW347QT/e9yG+l4kEW2bSTHqT36BkS9xE2JHpMO+hzotUmUnQOEKw4VQy6PTjmiYtVKXzV6jZMKFgendw4Rc9PMl20nf2ViM3zU+cXAvSiAc0XjkT81XhZ/xlRtaKt0fUvK8csVU7svewIaua/S15leMF9pL2J01n4PyZ03hZiBXH+Wu/Y1ZjdLbpUkDhl66jjCgSWysgJfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x7OxHinHdVBDsw56sFIZDOdII7wkK6exCaWcqGzPDw=;
 b=Or9Qfdr4vCGm6GIXLxetHOaeu545AwF2nk3qQgeQHh9yTH65VGBDio9rNzPgIXQkxUI7ZmX2j4d+MfmzK02WKkJvV3kEIWWq2SWxhK0VHIsTmgfvP3yKK6WRzEFpJMQIx7RzF+W31cQ8G9rYLpAET5aXOugbbbO9EM8zVfkseXQ=
Received: from BN9PR03CA0899.namprd03.prod.outlook.com (2603:10b6:408:13c::34)
 by BL1PPF378C044A7.namprd19.prod.outlook.com (2603:10b6:20f:fc04::e9b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:18 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::e7) by BN9PR03CA0899.outlook.office365.com
 (2603:10b6:408:13c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2203340654E;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79E16820258;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 01/13] ASoC: SDCA: Remove duplicated module macros
Date: Mon,  3 Nov 2025 15:07:56 +0000
Message-ID: <20251103150808.4015208-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|BL1PPF378C044A7:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bfcd02ee-1b37-4791-2461-08de1aead1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HBKEnqkgUGOUSud0inwXu1ROfwwVVwWbc42eSJeOggO1VjbXelbtzN7uTIsY?=
 =?us-ascii?Q?I71TEkqEPwpg1S52WQw3NiLeLi7RsN+6rkDEnhxZe1DUVPxmZTQNNf2vLrMU?=
 =?us-ascii?Q?+PqZrAGnIWxnplVWKl2Se4dB6SFHNmvdYLYii1AGwM6CDKXe+I7AMwu0jVKm?=
 =?us-ascii?Q?sUh0Urxe568ctQ7XRNa5tdQyLvFwy8FgL9wwRKwdfA/NYzKGV6f1zbJnY2Yc?=
 =?us-ascii?Q?AFlmtQpTfKQa5EuDwiXZCFaenrcZJubUJROYHUGgnjgqyn8F+Z0L4kJxTKMb?=
 =?us-ascii?Q?GUbKmb/yBtotddO428fcnQ7+XPFfI3kCqrhTr8bCX0fDVXTlM9enXlRF7EIg?=
 =?us-ascii?Q?RzL8a0ZitjifKiP9cByoQ0yNB9KnIBvsllOdN9xBqXD0p0EktRemsm8Slqqr?=
 =?us-ascii?Q?w4MId/LG/Lzh5Y+DP84PRs0jmiW4p4AF8SOOPOaZuabCwppZYiWzDYG2py0j?=
 =?us-ascii?Q?tlguh2/c+5pFlC8tnvFiZhqfqMLqieLp//zU3UDhyuoS6jEG3lHUQjD8PP5X?=
 =?us-ascii?Q?gdd730nf5iyjNhPcYAO7Hd87aCwGbFQ84yxIulFDUhxodiLC5brCYhRpFJnC?=
 =?us-ascii?Q?QgBRb4l0NFhJtFTxWn/cM0oJnB9MzJrhHaXsriSlJ3+XvzgYTvxNoIKA2LY6?=
 =?us-ascii?Q?22WkQtZ22Ejcm8XKRsVjnqsf1xv2Ym3C99MckiDCJ1DmLHv/I61wWnmdhlGa?=
 =?us-ascii?Q?mKwspyU3v5nrz6WQMDZHLopzOrY2Ae6nPFu/lpVyDpAIVRnzEY8cZf/ivf1B?=
 =?us-ascii?Q?W4B0XWdr7sNgFCACnTxNIxdm3noj59Y+yg0zUQzYLZzlilewZYl3qJB3JDug?=
 =?us-ascii?Q?OsgpMOYGHdzOGT3fZb51DR7fLeGOTaN/o3RhGWtZNKNoIchJjFpd5pDBHhKt?=
 =?us-ascii?Q?9Alow+wZpzH6klKbCO0nnvW94zX9FLsycC5zn622TUVTIStugFLWOAZjnMJD?=
 =?us-ascii?Q?+xWsO3cuZFO6DPt64SNdqLBYxBKkURQ/ZH9DSB8CJJQAZapF5fpu7saKBvYA?=
 =?us-ascii?Q?C66QLQZlN5xs7TaWY3y0YE6NvEgdQ5CJTHWhm6k3umfYuSzZSUwrU4MezNFa?=
 =?us-ascii?Q?adzf/RlT10N+ZEaEK4R+lFiGlmtMjq7qel03yK8Pt3LzNRTFuXPJorAiDPiV?=
 =?us-ascii?Q?4yevo518d+J0xu35HHIULB6Sw5H4JgpYJVZrVrrvTH8/gPW2FSX1rLXfGeUi?=
 =?us-ascii?Q?xRBiIgbQFeXLZetn/EoMhSK3FR2H+eJ2H7P9Dx2IrNaj0AcMPTrzjKkSxcVh?=
 =?us-ascii?Q?oog5V4/Q9+DvAVf1WLhWN/ZjBN88sUkeHWz1scH19ovubA43o91i/o50/gHc?=
 =?us-ascii?Q?fcgWWsMAjvl28yEYw7V4W3F+3tZAo9h8gP/BE8AZB2rvQJSYKKWgFWwV5Yur?=
 =?us-ascii?Q?yVJiOhVlDfNmP/t0f0o6qUU9H47qVtmVDqjPfZPWAFbNR3bK0Tud+CQ1MiML?=
 =?us-ascii?Q?0MWxD6JKpuBBKjCehYtdQU0mwgtzneGho7i+TcenRiImwtO4DjTsFGH5Ip71?=
 =?us-ascii?Q?dKd9pqo4ERdlHInzxRogaLwq8OYG4UEkQ9iiAUyPonoAJF+9vo6KH+eg31Va?=
 =?us-ascii?Q?cpOke97eqyg6xSL/mbk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:17.7897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcd02ee-1b37-4791-2461-08de1aead1f0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF378C044A7
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c565 cx=c_pps
 a=W/yVf4yN/6DpLKuKUOvioQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=1sz-E215ex2bfD2ZWG0A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: DoB9SsFjahqyKbus-NYq5fuTmysuWLgf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX66VyGQ7QBoSm
 QFVYQ2FRTEf71xifsWz6kdTshH8lqPKQWzpTPWjXnlKTfvyZb8DnNkDpczDd7UaQfFOiWZX4K9U
 es7R3vML9tniJPSgSFdOoVY0hD8jI0d2K6yNweyA5pqhd7ZLs1sU+61lhxJcB4T1CRp9T/eRulv
 Nmkatv8fY9Y1MWCp5ZRPenASHlAI1xcnlLwf5hv+yMXtkql+7199slq4IcOb9qQ3knYAKrjQdSK
 YhsON/Z3QcAZjoFT53/uDW6ZPaiGQTDBhNl+U/9zzOZ4QMIiy1y8Fp4b7VauG1tthWV8kgeObQg
 lDINZufxluU/8dUXMCR9h0LP62Hq6l2PZf3QbwiUx3qcJhyjJLoYrl6FIONuvSaF1msldRZjjNE
 x5W50MMYyTY2+MXT8KJC5uovzXh7Dw==
X-Proofpoint-GUID: DoB9SsFjahqyKbus-NYq5fuTmysuWLgf
X-Proofpoint-Spam-Reason: safe

Both HID and the IRQ are now build into the wider SDCA kernel module, so
their module macros are redundant, remove them.

Fixes: 5030abcb0aa3 ("ASoC: SDCA: Pull HID and IRQ into the primary SDCA module")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

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

