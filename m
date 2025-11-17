Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D089F31D756;
	Mon, 17 Nov 2025 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374967; cv=fail; b=leAQk8f1iDRhy+vaqK0vp/HJ9ls2KS36VtiR12XQ2zWv8KltZ+CELk/MSDuTUVY2KB6xfaKNy0byQGN2WxXqfM1lH//uLSZvOH3Mg/9rjX8xCiA2pCkWQUSFSINFGWqRvplhfJl5/klhx8Zd9eNsYsrDPEIBnqwGXGSMy90EMMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374967; c=relaxed/simple;
	bh=Gff4gAIZE7PwoxiO5R7U/Z/t9ktDEDXuA1+OqhZD/dk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gptxr42dLFTDjN7JcyQyuTtxjaEPh8G7vhBk8Br9a9hlxuDQQlANSTYsjYID6jRE+blTPFmlzgkrwXxE+9ZHyv+0B/mL54q+Sc5S/ry/N48xGsxqK0l3dg/RyHJ00AJYF4o4aaoIX+Z3NI2iBnb0A6GfhR3J2qdAEoY/sil9r4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R1foD8ss; arc=fail smtp.client-ip=52.101.43.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R1foD8ss"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVcc3pg+QriP7ogbOZGyjoHElftUzgx2MgCG1AKU35LRtUIjtNvpHgmOHXWhzRxvpqaWMYt7HOg8JDY6Y06yiO/1bR0iwIidugaNq70FRxeZCRXfaC0uUdEl96eDD2paZSE03tKXAzUZY+R4m8CmnutceeAqArLZUQv5iR3LOC5ITgXIA3iZzmvUb7dM/RQn0MsUTaWpgXZmgh0jUzJ9M+s5WQiMyiLfA49hsTGWuJ1Dza4YJWZO6RzlRMlAjiMrcq6NsGdWEM0U2/1qlk8MCZzJycsYOu13GvhtMQ83oZlBPglIdvVg5VHt591w6uiHdjFuhkNoT8uWAYSGges08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbm2n/LlfS4Lq3c438Xo+ZOmh0wKgydaxirEK7tCcgg=;
 b=eCofsEmw/eniHf3NZCYH9H1vQjwZf8x8DQ2efqZ/6D+0GP+KL+ujnuuANqrC1p4dlvd8KIYR/sGA6WTruX4RcJrqJq0OLfSpNp7J1VSHYRocln3DHXZoCotgOJ1IUjio8YuWHbhbHEf7uloDDYzlII8FNZkZX1/wy/OXcQ24miFP2VYu9IO02AV4OZnXi5zMbyrWb0tDFn4QGAVX73RNs+xpmOESuXspStvPrDbxK50JIkvDVTA1JQ4cQX27BZwft31wVbMvlUc8w1H2DSm5hhHaeetJoZtDUW/RSKvZQYbZ/799DIuJBeXD27JMIMhxO8vT5uiP+Zj72YgBsBELIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbm2n/LlfS4Lq3c438Xo+ZOmh0wKgydaxirEK7tCcgg=;
 b=R1foD8ssC9fOFMA/KwxysUrRzMuASrRugVNbKEU9zs88WnAd8rO871YyOWAkS8XHwg06iUHcAschQ5RLvWkcQ0ts8K9A3kBPec/v7HNpoN+XoVJI8IBRFcu0iUlUGu3lTNfQl6Cv7s/9OXMKnjVrB/N/45QmCUPf8xZpEwWywM0=
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by MN6PR10MB8072.namprd10.prod.outlook.com (2603:10b6:208:4ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 10:22:42 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b7) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Mon,
 17 Nov 2025 10:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Mon, 17 Nov 2025 10:22:40 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 04:22:38 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 04:22:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 04:22:38 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHAMMnR2289654;
	Mon, 17 Nov 2025 04:22:31 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v3 2/2] ASoC: tas2781: Add tas2568/2574/5806m/5806md/5830 support
Date: Mon, 17 Nov 2025 18:21:53 +0800
Message-ID: <20251117102153.30644-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20251117102153.30644-1-baojun.xu@ti.com>
References: <20251117102153.30644-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|MN6PR10MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d114f1-6e00-46d5-09d4-08de25c33d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zz/GCnwMr/2NOVCawz0OKpuvPWwDWWWWU1UZLkbMypVz9Ky4+68kluidWLux?=
 =?us-ascii?Q?/N+XSALwC8jkLobVQAw7XS2Dn4WGhFWDsDLXsEPDOR0xauZPYZx+Mfa8ySjg?=
 =?us-ascii?Q?HTwVBmQTEphIJV73OtvZaVaZVEVU1J3uyIkEcFcaoXs/md3xp9ygpt+NVn2g?=
 =?us-ascii?Q?yeYyhJNqhJtIsF77yG/uoGZk+bJBHQDvEyflMT/HffxCt8OK33gtkj+bTpfP?=
 =?us-ascii?Q?hlLG949DBZePlYM8d+0iSYX/+C8Ev2zs20Av/5OzMKZeNICAwM1Aae7WFNzw?=
 =?us-ascii?Q?YVB4E2xvWfcn2VDmhfL8MlzHrwIQdTh7JBQ9s5PGNdNZH0Tl4ju2oL9dauk4?=
 =?us-ascii?Q?UtEdETFEOtxLPx/vq3IRmiBedhuBbjXDIooDWtRd+ztAStx6UmMSCS2iF2KN?=
 =?us-ascii?Q?XiT0KITCnQbZzHQlNOztkerY3/OokMkjnJ5aix1ohAinAqcx3Y8JuJjaE5NW?=
 =?us-ascii?Q?3+DIIuLzUNnwStIQf0/4wW/h66ui7eTc88yT9DFe7Hbs/5nsyNi35CXVhndB?=
 =?us-ascii?Q?KjxezPReSQH0UJC0lG+6zlyOMFqlFwfZtGDomlrt+CijmajuOp3+ktxQ6O72?=
 =?us-ascii?Q?WVje4SsjEPEtPFxojartsxwVf/9l650qj5SO0qUa48d/GvdWE2QNOiiP2lGY?=
 =?us-ascii?Q?bgCLRkDd3Xxg2Mu8TnXiLYEwrMXNnn6HTAZBXDt9W5vNmydz4UrXhfoNbHgc?=
 =?us-ascii?Q?8lehRS2PqgkNgzqkJi7uup0EhZfvmC0PjDemfTLjl52XBcwD0O6Qvhp9nz0B?=
 =?us-ascii?Q?cyf1JtVaCCGI604WX/p4VZcFIUeEqnupnrWLfeRvyZTv4QM8byK+iewkhnbe?=
 =?us-ascii?Q?sBnMLVCySxhI1rBIq4XWxtl/i00vyKpXp5IzU2cgvkRQCyn+mR2U7KcV3fkr?=
 =?us-ascii?Q?qsqHMiDgaGUF7mDnqfvTTrOtUsi21fbic4gtF7nHuoPTVx4Di/qhMgTerLhu?=
 =?us-ascii?Q?H//JDMmA2ifNU3ub0+bh150WGAsXv3iKc6LvRP5FucznzJiAkvwoYbXG9SU1?=
 =?us-ascii?Q?YgI6l0TaV8rujRODckxKCPph6J1eYZwndZW1WROX5Ulx18QANXcQFxQXeVoc?=
 =?us-ascii?Q?6tMrtfWECSk+VTzThbKgWZGih4VVTWUCwQMA0CvRGLO2cI7uKZNyaOWflGg+?=
 =?us-ascii?Q?HVf6rU42XHxkvIcjPKXA/I30yzhIxI5BncJBy4dK5jN30Y1DEDQp3XKWCdSk?=
 =?us-ascii?Q?LPLV7jQNwmwoPhkFlBNb3p9udxvKjHfNffj/FHcb8oaq92tMtN8Wbnjx60lf?=
 =?us-ascii?Q?12ya+ZQe71d/dwPP8yH1k2gttH2ZcXCOqPQLV7vOqL4ZGmcCoxyynZbWBqMm?=
 =?us-ascii?Q?7AyPo1j7JKQbHyYH6y7JzQtNbF0UuW/i+n1uRgR1ra4tQXRqElXg63ptcOXg?=
 =?us-ascii?Q?jgPr2zNaap6RPZkoQXTFb/Bfl+952Ww1+jHtf6xWfZnPmIP1YzC5pebKZOYI?=
 =?us-ascii?Q?n7zmtJgZ69++iALIdizeXmkMhRvrjWzMEpUzLjxOlaLfoR6698umDMutJNEI?=
 =?us-ascii?Q?RoIBLBQ5I1GuRobXxz5XtleGrG/gGqkqyPiUjglKnth6H0P39BpO8TRzcTkU?=
 =?us-ascii?Q?8VDIl8jw/+T51TFREVk=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:22:40.9398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d114f1-6e00-46d5-09d4-08de25c33d47
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8072

TAS5806M, TAS5806MD, TAS5830 has on-chip DSP without current/voltage
feedback, and in same family with TAS58XX.
TAS2568, TAS2574 is in family with TAS257X.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v3:
 - No update
v2:
 - Add TAS2574 support.
---
 include/sound/tas2781.h        |  5 +++++
 sound/soc/codecs/tas2781-i2c.c | 29 ++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index c3b4c43dd2bf..711142cb9918 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -117,15 +117,20 @@ enum audio_device {
 	TAS2120,
 	TAS2320,
 	TAS2563,
+	TAS2568,
 	TAS2570,
 	TAS2572,
+	TAS2574,
 	TAS2781,
 	TAS5802,
+	TAS5806M,
+	TAS5806MD,
 	TAS5815,
 	TAS5822,
 	TAS5825,
 	TAS5827,
 	TAS5828,
+	TAS5830,
 	TAS_OTHERS,
 };
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 7bd98ff5a250..0a86964dfcfd 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -105,15 +105,20 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas2120", TAS2120 },
 	{ "tas2320", TAS2320 },
 	{ "tas2563", TAS2563 },
+	{ "tas2568", TAS2568 },
 	{ "tas2570", TAS2570 },
 	{ "tas2572", TAS2572 },
+	{ "tas2574", TAS2574 },
 	{ "tas2781", TAS2781 },
 	{ "tas5802", TAS5802 },
+	{ "tas5806m", TAS5806M },
+	{ "tas5806md", TAS5806MD },
 	{ "tas5815", TAS5815 },
 	{ "tas5822", TAS5822 },
 	{ "tas5825", TAS5825 },
 	{ "tas5827", TAS5827 },
 	{ "tas5828", TAS5828 },
+	{ "tas5830", TAS5830 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tasdevice_id);
@@ -125,15 +130,20 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas2120" },
 	{ .compatible = "ti,tas2320" },
 	{ .compatible = "ti,tas2563" },
+	{ .compatible = "ti,tas2568" },
 	{ .compatible = "ti,tas2570" },
 	{ .compatible = "ti,tas2572" },
+	{ .compatible = "ti,tas2574" },
 	{ .compatible = "ti,tas2781" },
 	{ .compatible = "ti,tas5802" },
+	{ .compatible = "ti,tas5806m" },
+	{ .compatible = "ti,tas5806md" },
 	{ .compatible = "ti,tas5815" },
 	{ .compatible = "ti,tas5822" },
 	{ .compatible = "ti,tas5825" },
 	{ .compatible = "ti,tas5827" },
 	{ .compatible = "ti,tas5828" },
+	{ .compatible = "ti,tas5830" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
@@ -1643,8 +1653,10 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	case TAS2118:
 	case TAS2120:
 	case TAS2320:
+	case TAS2568:
 	case TAS2570:
 	case TAS2572:
+	case TAS2574:
 		goto out;
 	}
 	if (tas_priv->name_prefix)
@@ -1670,9 +1682,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	}
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
-	/* There is no calibration required for
-	 * TAS5802/TAS5815/TAS5822/TAS5825/TAS5827/TAS5828.
-	 */
+	/* There is no calibration required for TAS58XX. */
 	if (tas_priv->chip_id < TAS5802) {
 		ret = tasdevice_create_cali_ctrls(tas_priv);
 		if (ret) {
@@ -1728,11 +1738,14 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		case TAS2563:
 		case TAS2781:
 		case TAS5802:
+		case TAS5806M:
+		case TAS5806MD:
 		case TAS5815:
 		case TAS5822:
 		case TAS5825:
 		case TAS5827:
 		case TAS5828:
+		case TAS5830:
 			/* If DSP FW fail, DSP kcontrol won't be created. */
 			tasdevice_dsp_remove(tas_priv);
 		}
@@ -1883,8 +1896,10 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 	case TAS2118:
 	case TAS2120:
 	case TAS2320:
+	case TAS2568:
 	case TAS2570:
 	case TAS2572:
+	case TAS2574:
 		p = (struct snd_kcontrol_new *)tas2x20_snd_controls;
 		size = ARRAY_SIZE(tas2x20_snd_controls);
 		tas_priv->dvc_tlv_table = tas2x20_dvc_table;
@@ -1894,11 +1909,14 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 		size = ARRAY_SIZE(tas2781_snd_controls);
 		break;
 	case TAS5802:
+	case TAS5806M:
+	case TAS5806MD:
 	case TAS5815:
 	case TAS5822:
 	case TAS5825:
 	case TAS5827:
 	case TAS5828:
+	case TAS5830:
 		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
 		size = ARRAY_SIZE(tas5825_snd_controls);
 		break;
@@ -2072,15 +2090,20 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW2120", TAS2120 },
 	{ "TXNW2320", TAS2320 },
 	{ "TXNW2563", TAS2563 },
+	{ "TXNW2568", TAS2568 },
 	{ "TXNW2570", TAS2570 },
 	{ "TXNW2572", TAS2572 },
+	{ "TXNW2574", TAS2574 },
 	{ "TXNW2781", TAS2781 },
 	{ "TXNW5802", TAS5802 },
+	{ "TXNW806M", TAS5806M },
+	{ "TXNW806D", TAS5806MD },
 	{ "TXNW5815", TAS5815 },
 	{ "TXNW5822", TAS5822 },
 	{ "TXNW5825", TAS5825 },
 	{ "TXNW5827", TAS5827 },
 	{ "TXNW5828", TAS5828 },
+	{ "TXNW5830", TAS5830 },
 	{},
 };
 
-- 
2.25.1

