Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF8A59
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880285; cv=fail; b=u7ef9lNpu69KijQEnLAyFpoKYHWBsUVJwop4G0OLgqCG6+Zf4GDwwMdtD6uzDVRglL6V4riJohAFxx9b0O8Cs/i1esJchUMURlOeTZLr1ZVmQqSmFCfx8dmkbcoLv9q1jdiaHnKQofs7vWuANs6Jfd02AiK5MeYJ2yZr6rO9b+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880285; c=relaxed/simple;
	bh=o95hX6zC/K2U+xac2F9h3Nb6UjDwtJE2ynQBA8hF0ks=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UFjCUCXfGvr6l9qy/yoBixmuFTBFB6hS9RilpeFPgVUcS0AaOFlmxLqAebRiIcBAr4EP9u+wBCiAthmyVfsthM0zoaAo0YyIL90okrl+ZjTKlpspJ3PNjft+qQLTmU6+0b7ipThLxGBXeeSf+AeBOzXtWMcsjCc3iZHNvYBeTzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fAmfhhjz; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fAmfhhjz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH9KtOvtzSs0cGpJAEeegI5hD/V1IW6WtTihvLII3aDzBIdVcWHCsYvrj+IxYV+C4P+gHDyzb/nzEPZe410rTvL615l/qiGv+m9/VzT6R+4HJxOg5KYEGcVPBAv2VGeoF/lJqN+DMA6X/aqFBuXvDyI4T6iIVpJcPfovR5uZu+/xGsTBj63sDWCowlF7CfUoyg1LNPFqLUsrDhzTgrucr1kFhdHCOJTkYQLlOr0XxKvwJusaeDaZqYv8ZT2xrdQ0LCGmL4mV7lqrOBPwTCZJoQS3LhJAOp/D15rO82wIYT3M9IDk+SBWkT0DppS6ZxayXPEdOCKFct8NTMB5GJ+msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmm5IhVMcuz+kTgpF8NCyEBXrztq7TaFDFcwPX32DY0=;
 b=U+wFu+G4MBltrYJ3lC4ZI6MxW6r+AuMakLMp95JBsYUO79TgrvE86zELc6D0evC4dmIP4ULDgmRSDHFsR3ezhQIT9UFo9THjNa9Qycj43hi7GXlCRF+vnAF2+f1CQgpdx7rXKQ1flGFL+zx7MsXOewTE06quFXEGpOBBPLFJac0SNOTLcpDB1iB/4JsVBcToPTuwv7ziz2KWckQCcmBsBf94auxxL2Hga+JSHFZlXVsh/wy6x8mbZ378tFkgtN4nKpDu5r+vp0y2pQC264FmFI0h/OjonJd3q0oiHn+qfUFEAIOdlac0H2EhgTrE3pkGV6sJhs1OAe9fbxSU3TGtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmm5IhVMcuz+kTgpF8NCyEBXrztq7TaFDFcwPX32DY0=;
 b=fAmfhhjz5vO7xndGAFrsVSY+iet+TipSx68u96X0Ikc+Cyzg3pIhnPmNdDPATnEkRTRlPpvqWoEcyHB0Wz9x+gHr66xoLFdEF30bOHSU+1LN3jRqRRG+dcDsrHHKh3b+WD5MqsxsaHOd+tuvFZONYvwuiFnAZhR3VWdtQM/Hm9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:58:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:58:02 +0000
Message-ID: <87qzmhetlx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/9] ASoC: codecs: peb2466: don't use array if single pattarn
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:58:02 +0000
X-ClientProxiedBy: TY4P286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c7fabe-ce9f-4ed6-cef8-08dec4f8fe13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gQ9wWrzbEEdGny2IqHcGuKuTefQ6Z35eHDaNNOgsyCQglpTb6N4YQADa2Tu3LnLb0G2VEITu12vr3j9Hyun+uBc2xBJ4cWTe9EhT7LJ9vAKqfrQFK/z0yKv2u48kXvmaDt3tYlG2kcDrwwURVPidIpX9aex6s7hLn5mtv+gABeR3D8TBc9W8e6dhjfqgrLtPYJ6X1P+bIPsumVeqJhGb0KF9PWbi1NXMKA08s7JW1CY0+cilPoMmUR27yu+9vop+g2ubBzKgjP8oNBr/Kps3VPw9FtT587fAtF191PO2HDMxLQHlNsNM285hz5XsQ4iC0hnjkjbWmBArT+Eh/AhY8lEFtK6RJ+MNKaI/KRZFa0CLZttHsAc3V+YgHMg/Q4uQP/uNKYyjASdRGtKyw5QybpO9puVlU3tw2h4JFc3POg1vPJ4+36+pZw3LRZEwRpsoc8fLIAHDTvNXXD55ojnsCSntY011L4RwR0kTkK7NpLJEZqgwZz1LjIzo+7+hEhb8Aa4TQw0n4LCR68/+NKXVz7jQleQ6689hKTr5sZlFkPIBH5733xmXIcBkP+iL/+uZG/2qLSAlSwfaLHeeRpLj/JCikQSWNVpeeHlDI7WfwgVHyHXsq2mT2TkwNzAJ1YOHLc9WW/A+OkeR50f6V+KDj0bUQqXIN/xrbF7/S+9D0dw6jelg6xiRdQNLsG4F82NpyThmb4Ri4P2EoDkVjAhF02pjWKTvkcxFaEVcl6HFfXwXy4/Y7SPhL81JMrQNeYubVuI2nUiu98m5pqjeR4SBEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CgSUEx33WE65PMTthiVypPSjSGuLkoLRyJ4ocWLJAim7Jmt2qYurxk9YyfWz?=
 =?us-ascii?Q?P4RAsfMSSbqACXGvUBqb1HzKPlcIAm8ejWw5pRQKLetlRKpXhgZ6/feEliVT?=
 =?us-ascii?Q?vQqSWUhL/bp4otRGZ2eZgigiengbP2FHpYSaBoADQE1UB+CHkvU7hcGTj6e9?=
 =?us-ascii?Q?FiGdMaz/PSyKLSc9uDKOI2Mz1vKXLJLZgW/eIYQY9vW1pUKRAq4ARDKLnEWm?=
 =?us-ascii?Q?yaDuOPiIy15JDYDzwbZVOTEgfBOf4omrmSlkJLsj2kdiJBIGGWvXAsjJSM+w?=
 =?us-ascii?Q?sXSh8ucBLprxJyxdXtFo3q3FE7XNsJL0pm5dAK1QYedDzV2bmBHScwdWtKsA?=
 =?us-ascii?Q?zG5IxWmz/vD0mRdaWoKSDZmXv7DKG0ID2jr2y7K+/ZWkyaqBSp0P9OkMOB97?=
 =?us-ascii?Q?T3QeAQhkdvyxHvmSz85llNbOXV6E3O6ZFChEtzyFCa/k2dTQ+aZi6O2WD0W0?=
 =?us-ascii?Q?KHCVU05r4o7bgW/+Y1Q7sVjJbz84yzzcIAnu68O5lxiot895v8b8wxgTnj9B?=
 =?us-ascii?Q?pLq9gAW87EVpXjnNQ1fNBSaPLyqw+xJtQ2zWxwHyrfvemHU7sTBEXC/XdQS1?=
 =?us-ascii?Q?5XDAlLYx/nElUu6tFssQTxfJJ76ooiAKehKse/7qZ9XL4wekTH2lXeDiiZ1f?=
 =?us-ascii?Q?uiWelVAxD14I9wcoWtEmvo46RLfUgRcOp9VWg5WZJyQoGj8uXI/KqmneV8X/?=
 =?us-ascii?Q?t4mAKF+zqh6facjlw2wJI5Zt2WXq3Tj/rAEGT6e4aoZRLwPxIHhQOYhlDkuH?=
 =?us-ascii?Q?5eKQVa9fgHSkagnkzwXlbFaEnjc4Q0w+okLvNVQN3lHMW4uw2VFXLrTUVGNe?=
 =?us-ascii?Q?oBghuwJPOMEnszCZdIrWNkxFjPOlo2cIS7A/THS5xCPlk2JUVYPo2TQaYkzs?=
 =?us-ascii?Q?FM+z+3tyGjacXmLHOwKxXvsE7fzMh+8FIZF15wk+ZSAzKrgMo7HQJLc+CKc8?=
 =?us-ascii?Q?rwzVa4wrD2m7O+0axm69eSSZwq5TzCkUpq8M8UBkvm7aFtPuhdE6H0YseZpJ?=
 =?us-ascii?Q?66E28QP4crpoftjKUJUKSyL2w2/gNFk5nKFQ2uMMfnh3uhusKYorNSn7rQzz?=
 =?us-ascii?Q?qjt5Z2EMX4Q3ZLuzGFrj5CNbpw8KWyL4HyizzKG0d9K1P2b6lP2dh5oCNTY+?=
 =?us-ascii?Q?SJeoEVeVYPjdGCVM1yfifEmUWNh/6wya3P+uGiuJ47ZW16cBG0bon92aJVFH?=
 =?us-ascii?Q?lty+2k+Yx/adr0dPlfH0svJmwW4pD1efOxtm0iZvfMIQSE5YjXmxzYdXhosP?=
 =?us-ascii?Q?KHKKF9Ee8a3118JDix8ENSCsxLXMjcYJR0JBGU0HRmbEDKVZTMYCScIVJsQf?=
 =?us-ascii?Q?35bfWJuvqfKQteq4a/Z3a/p/UH1UujejCKL7FOHLhWNAMc8TgcuVhCnb7wlU?=
 =?us-ascii?Q?6Aqp2PtdxUuKxT9v7nMLHiUH9Xpip53TwYS5YtRVF5NjKcLl9fjvMRyBIzDG?=
 =?us-ascii?Q?pbusp7NqILa16ewgJ+2O/krTU6WSpG8cROfN6pzuHnMzqMWAnlaXvc5ArKWT?=
 =?us-ascii?Q?70XecP9HfHVXACsBl5GU3jyvdV8WgvKVnzT3OMK9Fww6N2UduAgRvQbQyUnU?=
 =?us-ascii?Q?t2KGkiVlwbf/Agt/7wzUCaBWmG6Rfef6BKE3hH2aZDVSDyYQnGoEneD3fAdl?=
 =?us-ascii?Q?ivw7IeM7A0130r+wsqCLjeFHjXe+AqI9UkSFfxi79P9xZc4XhIbUMQiCA6WW?=
 =?us-ascii?Q?MabODRJJTLICPWQqHvSC/h9IGsLRUY80YFMVoSdJvxjSV+uVOJOIOuT6uHBe?=
 =?us-ascii?Q?ut9E4BBVvu7L0S2O7PUMccZlwqKd70U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c7fabe-ce9f-4ed6-cef8-08dec4f8fe13
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:58:02.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fj/8k8L3b052hfKn+4uxHlEMrDt6AK9vRcZqIcotBtTdW0Y0ypd1f1JNqon0O4gktkiNviQ2rv80d3p6FaHB+Rs90IMQd0fcaVP5fwa9TgimMNISxlO/op0t21LXyf5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/peb2466.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d5163c15d0d1..2d71d204d8fa2 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -817,18 +817,17 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
 					  &peb2466_sample_bits_constr);
 }
 
-static const u64 peb2466_dai_formats[] = {
+static const u64 peb2466_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops peb2466_dai_ops = {
 	.startup = peb2466_dai_startup,
 	.hw_params = peb2466_dai_hw_params,
 	.set_tdm_slot = peb2466_dai_set_tdm_slot,
 	.set_fmt = peb2466_dai_set_fmt,
-	.auto_selectable_formats     = peb2466_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(peb2466_dai_formats),
+	.auto_selectable_formats     = &peb2466_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver peb2466_dai_driver = {
-- 
2.53.0

