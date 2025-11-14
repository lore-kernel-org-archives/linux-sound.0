Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924627E074;
	Fri, 14 Nov 2025 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105687; cv=fail; b=DcT95ATKleNkcJmTU0WF+uw/FOU6o40r8VbHgORbsc9hjtfAGqYG9rkYhmNVNoIMM1DJtoGb0oMlN/2cfqJ8/+2QDCN6fCrevCc/Zt4bLzqyFxwPEPc1eZM2q/9aAHZRvjfLJQnOcZ2/UNG6EROhNo97+G9lBD8dlsVlZcU6QuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105687; c=relaxed/simple;
	bh=IBHsx5SOkVUflSQb8r9PKIn2YZkx1ilgE2RCAdZtPwQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dAjJDWVf9tAK9uD3OvZ3APthervlTrJbnyvvhfewbypLiSNN18CiOKpZy1YXX1E2Qjw46kNKgt2WhQJ7/+G1TV1m3lxFIsGKdKiwLmP4wp1ctnXnAsCfiCGG0IPunAKZyTbLFJ4Zf4GcLzI/Ny4i3Ge/lbQK7YGL1o5uTBgLIXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n4+3FZBy; arc=fail smtp.client-ip=40.93.195.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n4+3FZBy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXoe5e23pJnZfZm/CtkYu+0+8asK6w1qkqCrSTdzHOl//ZeUs+02Grls3ROY9F3t38JlgAKq+E577qBLB5ZDBwC6g2cekfnhYMKtLGqHuB9EAJpT/LDW86KtghwHjutGRzKL9mqN1TGCAgXXtdbOth1NQJ7JpbqJ5Fey4h7oky+nHrbUGMnU7QdrS0jISRWaBRMyq3LlSqyz53yoFmRaA2CeC3mYv7Q/WM9/aj6EjS2NTOJPF3jUHTwC0gACVuKrNiqD9Ai6tmqBR7vuLW9RBA+RyR+IFTvZkwih4fNu5WYPdLBU7SyeYdZGVeu6/OqjKACQjKA9gZLf6/NUhECqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdaQh3nSwsWwloGlQHKcr7jg7wJKqBeWing9C1V9RKU=;
 b=KiMVnX6bMVSmJ7u06coVpJVMfXbm9KDVYrzCXm7e9pRYLD7aOxEhdmbUV8NpBUTPZ2Z83nGuB+8OLMtfDGriY9p7krnxQ4q5UwsL8MMHDlfk2CaRpm7ITgrEcP12ZraaTYLVndqiaIM0oAeFRXXQF1oKMCWWOU+A36Wf6P9PoPO9XJfBZ4gSFobNUI0RJl/hbLN1tguqckNb66cW2LfDSkXLPJnEWPw/Kad0O4Vmc29menXlsff8Azeb0iODYH4OGOUQH/2hWOHNqRBWXDyzenuQyIq12HNKREms3MdO0nm6+OIF7/SgpZ65Hq2DQHJiYy9lECCkw3eXEkBHeZtJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdaQh3nSwsWwloGlQHKcr7jg7wJKqBeWing9C1V9RKU=;
 b=n4+3FZBygx+WQGJWm1BnIDeQshXUfK6CAui/bfFd2DuNuN64aEYsVpvrVXyu/8tQsVf3qI9TLzvX557ZMVedw0xsIP/cibX8vpdMUKJU5V28lXVjpYj5WEBWSM8eVTL2KH4dgDM+7Y59KwOT3GXlCIsdU3SvBOsCDAyLRzzSCnM=
Received: from MN2PR15CA0059.namprd15.prod.outlook.com (2603:10b6:208:237::28)
 by IA4PR10MB8495.namprd10.prod.outlook.com (2603:10b6:208:55d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 07:34:41 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::28) by MN2PR15CA0059.outlook.office365.com
 (2603:10b6:208:237::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 07:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 07:34:41 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 01:34:36 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 01:34:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 01:34:36 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AE7YPVL1606594;
	Fri, 14 Nov 2025 01:34:26 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v2 1/2] ASoC: tas2781: Add tas2568/2574/5806m/5806md/5830 support
Date: Fri, 14 Nov 2025 15:33:57 +0800
Message-ID: <20251114073358.23046-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|IA4PR10MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 42af0c69-12a1-446b-a565-08de23504617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3CuP5lEtrW6u6dWzpk3tApTlspvZgB0vR7csM4xrYhKoPnZIMTPAKEDJOojt?=
 =?us-ascii?Q?/wGEW8x1FnaZLRFdzqIGHwozlDicmUclDcDYCDSx2ZNGF3MpDzw47UUkd4hK?=
 =?us-ascii?Q?/1uZXLlMSX1RNmxbjgoOAp+joT1yfIi3EdQZxGswt0M355W/yyc4pFDR84CT?=
 =?us-ascii?Q?vGk+CqHN8s7vaP6FoE+y9HiDcVvhBUO6bq/YyXHMXyGGEROifbQ393TiNRtm?=
 =?us-ascii?Q?L59pdulBkUnrUNlX0QbZhu1oGJUMuYHOG4Zba13WADtvNX7TVUU4i4PaLPP6?=
 =?us-ascii?Q?UraMWzgbgSHmKC5Grv8qsgbyNYl8W6fjLHPLNgKUInSQZlRHzD0NmPI5VzQg?=
 =?us-ascii?Q?0ONeGOCo/IUoClAt7z6uZlXvRAEX17YIwLfaPu4bBLrUk0kYboxFTiMowzJO?=
 =?us-ascii?Q?hq2Mgyl5j+LguaY1ZsTu0p/LftaCN4yCXi3oFyoWWfOyVAgWzXITcuQPUbVO?=
 =?us-ascii?Q?U/MBjYpg8Px3Crta/n5L7q0rp/thv7LeLtp7Jo0QKGxOcGZt51yuaLBim/oF?=
 =?us-ascii?Q?aZQx4Wyp5JB6dvSaFP6tx7RYawUFIOAdiER4BSVYTSQrju3DYcLplmqeWcFA?=
 =?us-ascii?Q?FtTvgGmSUSildzZWxYTfNoy982gn2jocYQh2FUg5QklBWjqsNCfIt4XWvg+S?=
 =?us-ascii?Q?rjx/oxhTCU3sIwuFPHy5NKUuMK6BqVUWCCDaXcTC290BFnlwWsagfP3JkQzZ?=
 =?us-ascii?Q?Ibao/50AnRVvW4bSawT1eN5Jyhwz9u0gb+DYL+7WBvzfywJyvCX31l/NEJpD?=
 =?us-ascii?Q?4XLaU+v3ULk3p9aeYEaUb3SiaTtpyMC4pbDqRm0a/Fl0HRfEvf1HYHbxyuFY?=
 =?us-ascii?Q?a2KTWFOjqV29EhPm/oBck1Qr3tURoMgzkw5tUgq9H/GXZUI7xMZMFeHO2n5Z?=
 =?us-ascii?Q?JyW168im4eoOnVPsP5yH64qeBVmnBeSnonvu4KbwemxZYK5J5HRj4JyMJKC6?=
 =?us-ascii?Q?6nOqA67Bjx9qptfrkk9TUxgyyRRiQCMLBoLk8LiZCLLkyShVYPyQlhqPNZSR?=
 =?us-ascii?Q?EpkXQ0gs0JLpPG2K3HGeR08ZlOGCa2CjrjyyU+ev6OTzwnZhvslbnEYIKrpa?=
 =?us-ascii?Q?2yHDkjy/MbM8fTqA/4PVL2ZRfH8kuDlp2MbP64oMz3KBm9Rhp2N8O8FzP4Ir?=
 =?us-ascii?Q?PGW61EYnozqCXyns5szIsV14X5fRp3EJjTWUWnUMyKXqSEQtqq9SqSHwozsg?=
 =?us-ascii?Q?b94QRTBpjjyoeLziiRTLFQ74C+57sLDkd5qrncmkJz81ahmRo1ZGETOZO1sy?=
 =?us-ascii?Q?7VpvOsxB1TzGacTSbTAWdBsAWIC9bmLHaZinpiSW4hy5yYWqbEvGCeRX/UvC?=
 =?us-ascii?Q?aNT/4X/vqj75EHIHIFIjIHTSVMmjU51MtgMam4RiTAGg4LiN2BcH6UNOHbkJ?=
 =?us-ascii?Q?gQhLHdg0NoIxbBJTsE0iEZ1x4jXMZPJvWhxl9MXGf23SOVVUAwhxhypVvxo1?=
 =?us-ascii?Q?ZDQn3vV0jHgn38hbXTzh3h5LROZCYXnloDDSFmYzRA8hmvyzIP71XfoZQneB?=
 =?us-ascii?Q?wajsjw9tLblOTZjcdfubRC4A01lbxO7qxR9ZF07HYquzBBtkojwhvbqUn8x5?=
 =?us-ascii?Q?eGAQbaJia5uRZ4OdeBE=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 07:34:41.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42af0c69-12a1-446b-a565-08de23504617
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495

TAS5806M, TAS5806MD, TAS5830 has on-chip DSP without current/voltage
feedback, and in same family with TAS58XX.
TAS2568, TAS2574 is in family with TAS257X.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
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

