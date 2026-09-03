Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1052F8EB0
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398058; cv=fail; b=RhzKPi+FlrIO6qmo/TypYX4rigzcSH6QfpdWZmxRlXMnvVmGCgFz1uJPcKWZSYh5prZJ7iZ0ZK+nmu+I6IbcTW1909fhi7SMtVUr8KV4oS2ZgYoczPA39R32GCsx1asTakNMqEr3I9i3tRuKYHvOz5WdoAtMPIiqmYa7nppQAMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398058; c=relaxed/simple;
	bh=WRCEV1Z6jm+3legw+D/leBKTu589tXD1ZhMHWK/FgIk=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TiwY4sVylxvTOtLUXcWPcLk+mtDY3qM1bVOX8uXqutzXUirgbb58vw0TeuHz60urDYbuZHw50NPhhFqlpROCjWo1CPhUQjmwfvSKnJeUM7y7K0fQsPRXrlAtnQvHt6GJ2fRFAFnMWgl+UdVP3WfxH4OWEz8AqYsE0EdEX7HYbgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c054xpSq; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c054xpSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWDDgrKxxTxbJgTs2FUAuJr5ARBoftJebm0BRQ+VmdAwqlGYOfPgDUm3cxDRtA2mEnj8HVmxhQefv/G2yZzj03wpl7AQ3CF0ZgFCO8u3jjTQrZJyS4SweWt2zhtF6snY9gH3SurBI8DnJozOREwsUui9+ZLInhnvah2poZ1XVqbdlpzz1n3jGJFthexlNrQRrB69rV+hHejNXx3sU37BxIRO2rL2zYckb3krQdlGJngQj8VK0fDV0tqpfcPzaI75wDScYPeE2f8j2B+40RPSrofekAw2NHRISmjR+mkzeMdxUGcsdA8njA3mrSyZ64J5jgk+Igguzek3r3d1H7DNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHnX+1qIC9y1IMzW+fq8ftNz7QB9g2W0Hv+0rLYGjdM=;
 b=xTkALZ/u7J7EL6ZREt5YnREr6MRlr8ZuaamRoN4XndofFQWgzWYqFNpS+l1pWl0RPD+yOswAhBbreExc8sLbsZ6gXaIwlOrEEgbzgyuFoTqmVLZkgBaWHpJByWEtflFhneUzhjttX6uf4EB9JzIX0smYf7fdtDHGSIof3QTw+7OYlcRFp/HQh+7p4BYEWiQTEW2ZNSquF9Umy5nceEQ7DB4uOIBjwwASi39+JfKvu8JJPN2C8jBT9V7PfDxVg4yT6SPSvcwZs4xmU8u6HZnULq8sior6NujkCXzAxiIplavR7kkNBR/Zaux5fc1ZBjHuYDRkDZ+vsz7bHbcEg0fWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHnX+1qIC9y1IMzW+fq8ftNz7QB9g2W0Hv+0rLYGjdM=;
 b=c054xpSqhN/bcF1lcwNT+s7/5l59cRBORsdE42rifir5vuM9AYPGIY03f2l3LkhuPgP5iEfXiC/SJzQKVsI8Ntm7VSH3hvDGu/sVUTCsq52IexXu5ngjFZ1w6rpuwuiPdbcGw9Z8ZPxGNg6v67VmqN5TuUmZQw26ppIKr7ep2G4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:14 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:14 +0000
Message-ID: <87ik4nyw4a.wl-kuninori.morimoto.gx@renesas.com>
To: Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/21] ASoC: rockchip: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:14 +0000
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: a36623b6-7159-4a0b-f52a-08df0958ab0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZA4dCrfnuZxCKBlW0/4bbcIzk/Jqvq/cK5+0k1AqNHC9621jLcP5XxyVukEgLCtb0o0DUzGRWHiyE7o95OdVESdNz2Cd9AGLEbp1ljzKxA8qrl2RLIESq82nfV9kTTow4EM+1H6sZ6yor43tEgMkTnLI73iUqxPIPM869/uxi+aj2QL2BapkxqXVSwA6b4wnuRDX/yCd3ZM/n/0SwIQ9fU8cWgV5LYq1fkpiWk7gdfwZI1BuZ/KEsrek8dhkbnXnRg23/cIdiMivS32QYhxi0xRqYB94EHDr/HD9UGCdM1keDW3lX0HVNolsUxCnZHly1jEpTEM16x2Cs+izevLjjJo4XobTbrC0Vw+OrmEwbUGldjDSVT6uUXf2y+9YpMOxidkRShlr+nUxzbhrBSXs6s3qLIIc9aLDYlZppeFey6uuFaSrR9byo+fx9RODnS14axk44iRGSPs1pPKCmUp5IHw8O816PTJkASqIy6OaQFkedxme9IQ6q/OlhuNMSWdxI53I3rfr1lvA+Vew4AiJ1y1NVBAKowgsPzAEu4zgiBH2dh93h6wVkU7OD20uL+V3RyOCGA4UZaIDlLsBImDwUWdOUjQvOperXn9kKGDHlK2ZDp2Nfod4nt9JkkdGHc37WvkM7x744Zu/gH28cnfAZrhbcDptbQ8OSNjyGcRVRREUEUOwOsjXF2WQ7YcnWi+9wLySc2mpVMfdpgt4n1dI5rCg5n+keGcpRTAQYypVV8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hcD5Kb/bZsfTzodBmfJL9r1xM3t5VUV0U5FvtvumShgw+3Ah/eX6AkRjHlyY?=
 =?us-ascii?Q?w6EFkvpvVPGLYWVi5nXcFVfmLe9nDbjSlT3Z045EJbdZSRsRKKBLFlBSzHxY?=
 =?us-ascii?Q?fjm4vlT1hi+K5KfsYfdvs7MLyPFQ9aQ6GiXGfUBaJElRnEAud2opZVVNGXzB?=
 =?us-ascii?Q?+hBfJmcY3JUuJnzO+I/pV6n3AT6DUZCk3MSgbJ/40aztKaOdOw1eU6f1rZjx?=
 =?us-ascii?Q?dHBnNYvJSXGGceCb2xF6ZFS7fwk9KYy2+vWxVLaXoNgsTRmT1fPBl1MKFTc3?=
 =?us-ascii?Q?V214+CQKgbSmINCDUC1jZ9SHfkN7uDq24aOCk0V8aJiWSZz/MLiIbyGrVf0c?=
 =?us-ascii?Q?KwQAJi4QmR/YAtg9oqa+nh9m6VnFT3v60ZXIf2rC4O73XPc0P+YtcuLx1tkW?=
 =?us-ascii?Q?2M78Oiof0C9SQgGvmBj+A4VO6MQs/KYT/1POHscwJ9S0imla5PWWPnrJtah8?=
 =?us-ascii?Q?wysSNzbUQuG66rJiukOos2ijLZSsgbMN7Q9H/JOuOf41G9Q2n/puglkCahM0?=
 =?us-ascii?Q?bnAEUX0M2q+LTTzeiWiyGE+vERRfOeriWvtxeQKyKnxv1hHVYYLvNim0NvVJ?=
 =?us-ascii?Q?r5YVmOGjU71Pz8QJqp1MecWdmRHhMMIJ4n2t59YIGKGHpEDE+aU33mjbnMRq?=
 =?us-ascii?Q?ql0/9yBLGBUEfH9+OqEQtvi2bCBKFcA0iCZmGXX7RTcF7ecpiR3f860Ei3y5?=
 =?us-ascii?Q?h0JJTvbKGbiZCAOHFs0swa2mLPK8aRrbmDWE1qbqlIm54uCJ0BYa0tf9vvKW?=
 =?us-ascii?Q?IYluIcstc4Gh93nMT6MAhWBgQ/Bzi/DSzznguAUVH66aYXpNqBzcgtTj8hak?=
 =?us-ascii?Q?mWN+M7KB4XUPBTkW9CsaIm7i4lbQ8IZzggOtc5I7uT3tw9n/7pBJ9l6jbTxi?=
 =?us-ascii?Q?yUQFC6mCLZQLtOdEB4B6yaNo9rVOgtiIpJIEIAFzvBFoDtVeJwiFF62WS9wG?=
 =?us-ascii?Q?IxvPTrTgkQDBfAUtFlcMzMuvsVgK8Mkv2mMq7c34cUCwzcA22+VylCgg7L/4?=
 =?us-ascii?Q?Wq7RQ6R7qXTWWf3aELczwvBKg5z+z7q6PTpIBB631um2nX5d4354WI0ok6jA?=
 =?us-ascii?Q?hlrpOcGlT4UTMD6v9e+XW5iGSKra/j+ryWRlGlcO6ArCW/edojkEwYoRJ7kY?=
 =?us-ascii?Q?59Ix4zNnqysCjC7qk5IDkaXY/9JgOex90r8sfvw0zv3bX0bnukMHVkVAyo6s?=
 =?us-ascii?Q?JSF1bPh4FzTfePUQ/06wpr16DfJyc/HaIYIlNJlXnluoG0lCzothDbSMaWLp?=
 =?us-ascii?Q?N92qOrISN+qHNJ8xSJFGx+ON+jN/1J73iuvc58NeXMCcwDa2Ri+K/hYXQTPU?=
 =?us-ascii?Q?A38XSwC4uzRECh9otNRzbGqYnaxJU1SjJ+qZl/FwecxZf5iKifknWNQyRVUC?=
 =?us-ascii?Q?Ozn5S67HmKmxH5yqgChx4qt4riK3xTLykXH074VGoDEUAyB2ADYRe/JOqkw0?=
 =?us-ascii?Q?R9STLraeVTMGQ5lwtkS2IMEwnpovSDt/SSUh69dm2VIrucrcrO8Rz2t1+ObU?=
 =?us-ascii?Q?CqK30Ho0Xy4osahNMfz1u6FDMEXc78vWQkBX81SL24goE7+UIFIG+oLh6DIl?=
 =?us-ascii?Q?frlCaaLWfJFk/cRoARZG2E64do2eC3IBVsRBUUoTLSTSShwKjHEKO7Woat3O?=
 =?us-ascii?Q?j+KE5l4YQQ4yErW9Z/cjiyzMSOVRI30w1qKnJiDBbnqXdmDzmD4zHsDFNfWn?=
 =?us-ascii?Q?MAgR8fLe+tXZ+lZeko2nAN1r6CuZb8zkMP3/hp/1gEcuhxzfTOAfjKFOu+z0?=
 =?us-ascii?Q?gn7oRBX4uDYc7M7/GQdGlrq0lsUK120j6TNmKc00+YGFVyGct1Tr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36623b6-7159-4a0b-f52a-08df0958ab0e
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:14.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzI7Fx/WlTSYrT+A05hEGaCEID7YMan3jGIh8Hmrekfm8CYZt4oc6DiRo86QbQuyqVgd1JNLzCoIengjr6kONGedQcLoCtOV8CcQaSJmljLVPMda/NtLlZwu0Fyc/Uui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rockchip_i2s.c     | 25 +++++++++++++++------
 sound/soc/rockchip/rockchip_i2s_tdm.c | 27 +++++++++++++++++------
 sound/soc/rockchip/rockchip_pdm.c     | 14 ++++++++----
 sound/soc/rockchip/rockchip_sai.c     | 31 +++++++++++++++++++--------
 4 files changed, 71 insertions(+), 26 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 261f36d4c2fd4..ef3f6586af772 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -537,13 +537,26 @@ static int rockchip_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 rockchip_i2s_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
-	.probe = rockchip_i2s_dai_probe,
-	.hw_params = rockchip_i2s_hw_params,
-	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
-	.set_sysclk = rockchip_i2s_set_sysclk,
-	.set_fmt = rockchip_i2s_set_fmt,
-	.trigger = rockchip_i2s_trigger,
+	.probe				= rockchip_i2s_dai_probe,
+	.hw_params			= rockchip_i2s_hw_params,
+	.set_bclk_ratio			= rockchip_i2s_set_bclk_ratio,
+	.set_sysclk			= rockchip_i2s_set_sysclk,
+	.set_fmt			= rockchip_i2s_set_fmt,
+	.trigger			= rockchip_i2s_trigger,
+	.auto_selectable_formats	= &rockchip_i2s_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rockchip_i2s_dai = {
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 5ef7f109706d2..983319a538b11 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -826,14 +826,27 @@ static int rockchip_i2s_tdm_set_bclk_ratio(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 rockchip_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
-	.probe = rockchip_i2s_tdm_dai_probe,
-	.hw_params = rockchip_i2s_tdm_hw_params,
-	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
-	.set_fmt = rockchip_i2s_tdm_set_fmt,
-	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
-	.set_tdm_slot = rockchip_dai_tdm_slot,
-	.trigger = rockchip_i2s_tdm_trigger,
+	.probe				= rockchip_i2s_tdm_dai_probe,
+	.hw_params			= rockchip_i2s_tdm_hw_params,
+	.set_bclk_ratio			= rockchip_i2s_tdm_set_bclk_ratio,
+	.set_fmt			= rockchip_i2s_tdm_set_fmt,
+	.set_sysclk			= rockchip_i2s_tdm_set_sysclk,
+	.set_tdm_slot			= rockchip_dai_tdm_slot,
+	.trigger			= rockchip_i2s_tdm_trigger,
+	.auto_selectable_formats	= &rockchip_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver rockchip_i2s_tdm_component = {
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 343fda478901d..0720748c7c8dd 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -381,11 +381,17 @@ static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 rockchip_pdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rockchip_pdm_dai_ops = {
-	.probe = rockchip_pdm_dai_probe,
-	.set_fmt = rockchip_pdm_set_fmt,
-	.trigger = rockchip_pdm_trigger,
-	.hw_params = rockchip_pdm_hw_params,
+	.probe				= rockchip_pdm_dai_probe,
+	.set_fmt			= rockchip_pdm_set_fmt,
+	.trigger			= rockchip_pdm_trigger,
+	.hw_params			= rockchip_pdm_hw_params,
+	.auto_selectable_formats	= &rockchip_pdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ROCKCHIP_PDM_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 30b5e71d09375..9dfe46ffe0ff0 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -957,16 +957,29 @@ static int rockchip_sai_set_sysclk(struct snd_soc_dai *dai, int stream,
 	return 0;
 }
 
+static const u64 rockchip_sai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rockchip_sai_dai_ops = {
-	.probe = rockchip_sai_dai_probe,
-	.startup = rockchip_sai_startup,
-	.shutdown = rockchip_sai_shutdown,
-	.hw_params = rockchip_sai_hw_params,
-	.set_fmt = rockchip_sai_set_fmt,
-	.set_sysclk = rockchip_sai_set_sysclk,
-	.prepare = rockchip_sai_prepare,
-	.trigger = rockchip_sai_trigger,
-	.set_tdm_slot = rockchip_sai_set_tdm_slot,
+	.probe				= rockchip_sai_dai_probe,
+	.startup			= rockchip_sai_startup,
+	.shutdown			= rockchip_sai_shutdown,
+	.hw_params			= rockchip_sai_hw_params,
+	.set_fmt			= rockchip_sai_set_fmt,
+	.set_sysclk			= rockchip_sai_set_sysclk,
+	.prepare			= rockchip_sai_prepare,
+	.trigger			= rockchip_sai_trigger,
+	.set_tdm_slot			= rockchip_sai_set_tdm_slot,
+	.auto_selectable_formats	= &rockchip_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver rockchip_sai_dai = {
-- 
2.53.0

