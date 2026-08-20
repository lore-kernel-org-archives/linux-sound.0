Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC72C0F8C;
	Thu, 20 Aug 2026 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192107; cv=fail; b=aoyf0BK1f1Rnun7fWmrzP5uqrO4oXDg9reGVG0gFZwddCiLWxN1kJ0eIr/aet14/mh0PK57IuD4dFguq14/dm94n5yJzQCameIuakLaPjFnMg6iH8b4AiouOVEu3FiCI2L7JA0Kd7twDhH+rDNa9plNBOzJgH384zaz/Eb17gbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192107; c=relaxed/simple;
	bh=0hAYiPKvHajrJJvQwns4MtjgNI7E4CVl1JQyrcwuVN8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uF53A8dxZNx0Jr2TUTJ/vvspyRwFpAwLRB/F3E3iYVi55qS/IRMOkfoAxkILcz6uRO2dBwYgD+IE3IO7XztrBmPPU9QFJTT8mvyeI3qrStFOzrEEJxYH7ZbZAuuwS6CKCGv7M2Eni+p33Ch8UfjzuT26qOajizsHudmq7ytLLd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QKbEWpUY; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QKbEWpUY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSlydv+stCppYSMW17U9fwnfm/wRVgCEhPts+nVIxMgM0gc1zj+lCMascG4I5P9XQ0pekpwxhMFczn3sNJlj5UHbAnbhPVJ5uUJLpxSX0/AzswlyX222dAwLGoJ7bVvkMgd2byLBAf7Wd/UIKCuyVErR5YeAT+jNIQQ3rRUIruFttAbQn+VOdExo5+PD8LGSjjxi6oZwsKm9J3SC9I6XxO/sbYCGemTxxh7joxjBV/4Zh6wPXSQY0SXxkvpDimGeCUzmUZtplmdyzyKcDf2+g3RqU/C6AgXqAtuDZbOlZtMSZliWln/X5GwJ8z4V8/O+M9KV/Zz80Rus/YB2ib/j2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR1XgxGbKumNmKejcbNHMRjqGcukSeyctrLfsw8z/o0=;
 b=KVqesVT5p1gnPc7jUjiG7+uAhx0MFKXb1XXFSrfRf22fof5zo77hSp0mEoY63hsMvOmXzgPUtlGtLOq8UL+hLOnH0u9qlHNC16DASeXA5lEHSqb490ll7dc+PE3KK0bTflZSVb2zNPzIY9NfMmFJIix7gdS8lv1I2bnpQjHXGezxkxLUZAeV9mYaeZrXDQbQDUOEAg9pMmz0YItZAFy1dibwMwAU9yUzmkM95Z3nVEbVuqPyIx9e9AQ0baXhG7F0IL8Hb2OidtYCq2rykP23W9D/QIZOtE98HSFrKmO04CcNCD/qzbA4o1BORiX1GF7msa+TXnj/9QKPJIFAROwFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR1XgxGbKumNmKejcbNHMRjqGcukSeyctrLfsw8z/o0=;
 b=QKbEWpUYeaUw5AILtDYqscrdYUmGhgYod/hKbPVoCSpzYVdgh8J1KwtUDmFCMj+larqF0om8GUrFXv8Z8ELZWciSXh8A0n0IHaofbzyRoCqy0x32dtC8tbg8BA3jR+AxLZoft/DftJEaej0Yi9TFu/jGcKnVh2KLF6pJOqJVGW4xtNE74sNPHgFzwjQ+u9eXlzNlO3X0m85TqY1kTDqOSFDZ7LP7r8azrEde0XTRi6ucJyA6sHAJq9XK0vjO516Ha6oh1sZxHK6UpZlg0ayki+NHWZlJj0J9+b1RUWXkKk9M//hY6BM/t6TBigZIcF5jHQC+XG/9lKr4lEniGYw0iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DU4PR04MB11857.eurprd04.prod.outlook.com
 (2603:10a6:10:61c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 02:15:03 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:15:02 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: Frank.Li@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_mqs: Add DAPM output widgets for MQS_L/MQS_R pins
Date: Thu, 20 Aug 2026 11:14:53 +0900
Message-ID: <20260820021454.2229094-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DU4PR04MB11857:EE_
X-MS-Office365-Filtering-Correlation-Id: d355fafe-3c48-4571-4c27-08defe60d75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|18002099003|3023799007|11063799006|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	Rm3ShT6L6LpNYlaktEj55qsHzZ4kNgiH1r0pu/Sid7ap5Nc1PhKqdxJPnmNtcERWaPujub7JchJlITl50aPiFgXHne6MhuNPRG4rQuqxdkc4rZk3OafCH7jk7xRzij4dMmay2WuWbX24MBsJIOejh2dfRaLIjggXYIkoHr8syCOv2JI9C57JHl54AkwpDGDXNHlMqJ1jjrWMTu+cAGAi0gSk6AMWHK138cYQ4k6XqnYZ20qRAcKDQemIUxZ2JnTjY+ga0T6MygQDlG4/tCHdEb8r98+hPIZoOcgIYb19nwKCBMoai8/ObyF2V8GRRQH4Arh+Kv6ahfDJSvmczcc4Ve2H6Vn6pGm9HthXqCKzFdJuHbWuImnWbxasqyVh1MjmlVEp0cGdbaqhlBrpLOmQ2iFclJn83kqCFmNRnL2bdNhl/LTH1WaDq6Hdb8s/ct1ZoCtu6KWPMHXpDnS5nNrhwGmnBw0TPqLevfH7pff90E7hFlGJCws4PTYee6V9o7w72No/0xgdxfcovovxiWu4F/o7Pd5kR+9YQLMKhTIaMdLmTniRn7t2LPtgT6pckva1Xf5at8i9KQttMwm0g7pRhIZv1JVqkl7mHA8NdlOAk/QKh4qzer2Zyv6+0LV9SuAsqHR9XbproiNF5/7p3GOI7l50eSMeiyZA6lITXuM8D3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(3023799007)(11063799006)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HhVvmOA7jQT58YLY9c06OXlzCfJykZAhfL1zo3GiaEO7EHhrQO19vwf1lXVF?=
 =?us-ascii?Q?b7sHfzcRb5tyjwfD2YIIvHDHIfWWXnW5ZIjP75ImPqPm8pbFud1edVL2to/x?=
 =?us-ascii?Q?RRzZGQqV/vQouFUZL+2n23f2s2n6CWhDp2Vmyzsbc9Pbi2yvXNgYau6I5oKD?=
 =?us-ascii?Q?oug+A3KswwBsTF9uJyQBlOPj2j+UIL7uSPBd7NXTYhB9IcxR5XPT4QYGVbgD?=
 =?us-ascii?Q?Oc7mOEGIBljKP6oBph1RlIN7MnMrWtrcBlnRK7rXgBN6TIdT1F/svNIZNMIN?=
 =?us-ascii?Q?sz/MxhWmmf9C9+FbraM1dBxa+eIquPAcFxlkgVcv975FFMN1t0tVn0DPMmfj?=
 =?us-ascii?Q?5BvWeuUdQOaLnmb9GqUm15MAw51iy0gFKk9qVDGE9QiHdelrMObxzH07ZAXS?=
 =?us-ascii?Q?aIDfxAkLqXDnhhYZkSBbRliI5EsG9b3F434zx/quYd9bnA1Hq1XI9P6x5WNO?=
 =?us-ascii?Q?TRyuEcAsZISs0qUhy3YGB8+O2AFauXHj/tpAtdGGbPItKFshkFqQSQEOHdpo?=
 =?us-ascii?Q?SflMDGiw9xFmys56jZC2llhjlwTvEJXmFP3bTKo/KhB172DQaQTg+/6Y7P/b?=
 =?us-ascii?Q?zAxJHEyW0ryfgL7hryjl3bKQfOO8R/zoDeh2YWX0oucLwQoIx3a4nvtAImom?=
 =?us-ascii?Q?8mZprNrPHSPlIsuexHXwfaRDPqF6yTTy/+zKhfGKFNbpGIw/71Nrg3kSpAju?=
 =?us-ascii?Q?R9ye2BwDifu6/G8u/fnUyKK4qIIbBfxR10D71pbVdtJWO6Q2g/HErKn2RtjS?=
 =?us-ascii?Q?ZfGnlJMngXXL8U5Auz3ml1Chrv1BrSYcvzh1p/WvRmTF0P5I4pjxclkpJ5Hs?=
 =?us-ascii?Q?XeUksdntJlU0YCbUA9tkrOlrKXafHiHj9yCFHhjtRb6b6B9ElU7q8QhT+6rI?=
 =?us-ascii?Q?xrrsYTUi/iUK+A8SE0zRS6/PdAn2h2PtiF/az+Sm76lcxMyZ2B1Sba2fy9X7?=
 =?us-ascii?Q?euKIQVobpT+quPyC0OaHJYODv6vfCtaLILo9YfN8QZ+usWvC48nBSE11+ko8?=
 =?us-ascii?Q?G8WiNZJ0VS0RV7Lo8LpLts96LhWistnSyYezpTthhrYKAotv+LD135D8I33c?=
 =?us-ascii?Q?uWmAOxq30C8+ocnEGgKhFI7k29P8BtL95pHBF4t+2pOdO+AJ0OlMZuARjExX?=
 =?us-ascii?Q?+5qeDE5JQT0BASo6Oji6n1Gsv7ONGR4GXdrc2m8SbD2aqCH//KVohOMnq6Rz?=
 =?us-ascii?Q?J9YAAvEI0Fxw7zDMxkG6MBiHIgl9hJrQb2AnsbYQX8kX/I7qUiEPtcAQJaU8?=
 =?us-ascii?Q?Rx9fAbYwVHKOEcjpWPKYM9sgewhNIODJHAs1JV6RbAWxVrNUvzvX1sjwP0kv?=
 =?us-ascii?Q?9n/cuHNC1+DeaNO/EKIUjMlDWqjPak2Elc9FbzFp46e86/FLc/fkmfn6ZX6Q?=
 =?us-ascii?Q?QbxXzyNnjfZ9+72KYrWrIJ09nDFdjb7X/f7B5Xx+uZAmXJisKQ34EIH2T/pD?=
 =?us-ascii?Q?DD7ewngRF5Dg94fO1YWhwPMSmDJrTZTaNySZ9IvMstUBBDZrq+ps2lSJHzKA?=
 =?us-ascii?Q?eJJCC7OEIVaiF4RwNGCk9rNzFSuaxsjlI4R1Y9iTf1T1Mm1k/EeIfSBjbKXX?=
 =?us-ascii?Q?PwUopL3XMgudhTtHQO469r7vPtxmPxjpaz5TYmsLLtqck+H8zFAAlFINqs62?=
 =?us-ascii?Q?tsBN8DdNv/QD1rgy4WnRwUuscC7Kaakuy9CrtzKnuEcoSDdV/qQmDDZf3KIU?=
 =?us-ascii?Q?gDvtPIpim2K5GcrVLhGxEjoh6ljvVfG4Ai5BruO4Pb+KyNSYKaEXTjxB4+nt?=
 =?us-ascii?Q?f4j8CDgXlSgjNadhspnl7VDRQACZDraj2jIm20xzEhdh+dEAbkSI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d355fafe-3c48-4571-4c27-08defe60d75f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:15:02.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wWlXEMgyspk3xtp0J2QKZrxxQoorn8pKw3dtAawdo/kFcEMOBpEKuzVmTUkBQ8WoEYNQ480GD/FCP6i3+rfbzEhAawobpwzvRyE5dk22WSqW4ZcUwSJMn934IAI4jGt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11857

From: Chancel Liu <chancel.liu@nxp.com>

Provide DAPM output widgets for the MQS_L/MQS_R pins and route them
from the "Playback" stream. This allows external amplifiers connected
to the MQS outputs to be properly linked into the DAPM graph, so their
power state can follow the playback stream.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 901f840df904..5b00488253bb 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -183,7 +183,21 @@ static void fsl_mqs_shutdown(struct snd_pcm_substream *substream,
 			   mqs_priv->soc->en_mask, 0);
 }
 
+static const struct snd_soc_dapm_widget fsl_mqs_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("MQS_L"),
+	SND_SOC_DAPM_OUTPUT("MQS_R"),
+};
+
+static const struct snd_soc_dapm_route fsl_mqs_dapm_routes[] = {
+	{ "MQS_L", NULL, "Playback" },
+	{ "MQS_R", NULL, "Playback" },
+};
+
 static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
+	.dapm_widgets = fsl_mqs_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(fsl_mqs_dapm_widgets),
+	.dapm_routes = fsl_mqs_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(fsl_mqs_dapm_routes),
 	.idle_bias_on = 1,
 };
 
-- 
2.50.1

