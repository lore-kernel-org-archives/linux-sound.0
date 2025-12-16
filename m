Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9624166C
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851373; cv=fail; b=vEzGaV/n/t41RmPZseU4jt0wEAknwfER5oRnSeEwhvfG+GT/aK9r/dTKkps9tgcuoUPxWkk4irETHS4L37W656ksYu6BjjLvuIh0LTQNxgaK3J3lo3n8202jdTm/Sj9k1V5+tluVOidgKQdMLKNT6h92t9B+1qs2LlrbXrnPIIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851373; c=relaxed/simple;
	bh=1dSCb7ma11IFLJruWq8M7mZkx6D3Gm7qIP5kSOuK0sA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XMRc2Eq1R10xNKk00N/TwI6TCEhlvOjmOkNEBxm1cfM30Q8Njvm/S6rjJ8UIRHGbnxN3f4ygUv2lR/sPcSUVpp5DvCTqTuUMJw7UUWDbomwjeOZepnA6jMqTUD4NB+42Q0crINzs9bnWxxBcA7c16XdF5Ia2b8ZFN/DkLz/UCys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MBYkRSTR; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MBYkRSTR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiLjNxylmPHpbdQCaTBMRY9PamS43jnrZq1XUNEBspYcMT7WE9srix2Rh8wmpZJr7mHdBIIbChTPm30NAREY/cGXPQm3nPKhPnyEHu1GSThOk3/C30IZg15eIVVMnMU/PlRAnHwGZrscKFaZi9xWma3VS5USA0zZ6rcAMxbS+HsbEO+laNpNzpuwYs8or9DCNdVW4iRx+QfMgkNy1JgFEeRvd4TfrqEOhSz29qxQWpfo0lzjHI+gucPcA3bEkgL9whfynIoHuo40F91E+Wki7bvl2qa3BYli98FJ3yAj7w23FL3WkPRbRO0b9NYrN6TGtjtMn8OV/Nhu2mcp3ay0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT1LM1fosqkSpDDltJH7t9rr5bRK3w8x+aichnERQqM=;
 b=BFGb6EUGoXu9xI1k5vHsabqaHkB8Z+65dgx/X1zIJZ3Za4nFrKGAfLPXvfNQf4k9dAsWcGF+reE7TnzQhMST15nlahM/0XQE9KEPftx5ywHfn0QYlG11NpbLnaSbW1NZV6OMYdKEXsY+fmV/HCcJLuNkdhP0JvxSGbjkhY0oiN+4bi1rgd9P9i6R8N+W7xRk3GI0HJuO3Y4xBT6dVEJcYaJRguD5M1cvTEy4lbTLzrWDPzdHED6wkCjNrqRK2Dwv3/JliM+XQCiavy+yDaicULKJ0xL+KY7QUW88ypO/d6wfYQIgrtldIu8wkx8p5sj87iJOiq+GLnKmoGL38lVU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT1LM1fosqkSpDDltJH7t9rr5bRK3w8x+aichnERQqM=;
 b=MBYkRSTRRh1cLUT+c5Joi8htITk831ywwaQEEKcs1sLhScaRuPUEQABxe0v3EBsRhHDvTxIWx0Y3ijph90tqjIv51317Mrh+6nHrYiwm6bh3wY156q1UwHoVz98FKdzLcSCkOM2F+9m0IyE5nYIAsKD+0K0xch5+5cHSrAx//f8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:16:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:16:08 +0000
Message-ID: <87pl8frx1z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/8] ASoC: soc-dapm: move struct snd_soc_dapm_context
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:16:08 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 22da9b98-49db-4565-2a1c-08de3c491333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j1A3LklyUKxZjwIFkxiCcYMy1GDY1Ildu4sCwkvghTpP5kihvkwgqWHfWKhZ?=
 =?us-ascii?Q?W/bnXRzIba1SOPN7j53IGw5kL51XFsed+X0RGBF+2L+fYQUmi/mndOXE4dVl?=
 =?us-ascii?Q?Q0Q7EfQzB+2oRqO6++6Jg7wpA+gMuRJOyb7160BWCu2J6AJ82dU54JUotbC8?=
 =?us-ascii?Q?hL9nCG6yWOA/F/FFJQ1PXElGU38kmOAXHkCdaWGFOKOercWzDYr/Cxklp/LN?=
 =?us-ascii?Q?cxGSIa83LXDaDLnMczPHX4HUVeQH1cPJMRj3QiOkyqvdzuRc+OWlFHjDCbBg?=
 =?us-ascii?Q?8pr85rFuTmS7z51/OpTXbErVDpfcVAcosCP6+6XIpk1tuqsxqwPH6N1TGuNm?=
 =?us-ascii?Q?OVc9vHpaxT40+ZoHIHUkP2sQf0HnYXa6o9+KtFxdpdE/Ot1BCCa4F/Vuml6X?=
 =?us-ascii?Q?mj6fqJlftJfM7b0gGoXr/GQCA/49BmiwHO0A7KWUdan6t0rRTOohbX3XUr25?=
 =?us-ascii?Q?28eCio88ZrcnPEi8D9bdVdaRU4mvVAuYIOOwOq+h4+9jdOyyoZmHuRyNBwtg?=
 =?us-ascii?Q?sRR3SR0RERXhCWy+OkBjvUtOPtS14NEDRQdokVGAXsFueGu62ZhVAwaya7mR?=
 =?us-ascii?Q?r0RQVY3GETzuWx2Tdm+q6A6RofPgMuquW+6HNrq9o6dPdGfIxGK7txK346+l?=
 =?us-ascii?Q?Izi5MEXQeLd29huU4WjZYRGPo3tAKlfpAb7mLxfypkhxvhgzY8s9aTiPN/9v?=
 =?us-ascii?Q?WZ8+QdxyksTryU+WUlSeuK7w71Rc+jTMTr9Z0M6UEcwpEwqIrxTcxjtQAATI?=
 =?us-ascii?Q?rRsbpmYkqbAcgQae4nx7zW2xxdye0jwzLbqKZo7qY0Snf3N0xNOHbRIaJPK7?=
 =?us-ascii?Q?2pXxKtFnUiLS7eDAxeBsnoZsoycpNC9GAXIINIQojrtlKvi/STdQbXygKUrs?=
 =?us-ascii?Q?Ook4Yfy57bNEiLVSwZj0p8OQJHVkW4Waw2gUGcY+7HnZx+LsnAwjF85uQuIe?=
 =?us-ascii?Q?1GeRvBzSmRL4k58v+0taI1ihKh5tUh/XRU/T0zmY3CJ6OAbptMB1StfiYlgk?=
 =?us-ascii?Q?jGa43rAZr+BFzNAXvHYw9+xhDh9qaFOoq40AEv+j6/y4uAxbZ+4kau6gSsGw?=
 =?us-ascii?Q?OFExLxkEg+KLphhE1+dbBShH6bZuBolqvPsJk7svxaSYlwZVnF5DDfSSHtv+?=
 =?us-ascii?Q?ZpJaaCOFYUSVsY2lzhIaLoCe8XpOPCCxEhNxfhshcog/ixDVG0oCz3K1NgFu?=
 =?us-ascii?Q?xgKfV1PFjZ+OftWvgG1gPXyGFN0ri7roR/xbr4mnXICP/9Z+g4FFe1+HRjze?=
 =?us-ascii?Q?tNtalughwUhPUG2QJzCXlioE0JWWywC1d9bJlQvJ3jbKEzwbFM9byEiAGu/H?=
 =?us-ascii?Q?CYsrKFcPUy2DutLo1Qgibc193IYdU7m9ptHGlkp3giPnaLptpvsnYeGcLGrr?=
 =?us-ascii?Q?RAep8jT/3bbQATFellFPuomH+vnnjqM6aDUzDHXkBDfOzsd7dzELzusWnFi7?=
 =?us-ascii?Q?fWQkBJ2aYS+LHk2oThq4SuLjatKjb1rBO6PZtIN2nIheMAppX/N7Q2bpYDyD?=
 =?us-ascii?Q?1A0LajIOrbhtecnTNKPchYx1WgYcLwIP2yMb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1G3g2FqikE0GTjB9qOuhaRLuJGH/mO37db8pCoUnTMGIzc/fCmTNZDpxAX1g?=
 =?us-ascii?Q?pn914zG69okOilXi1RlMAh6P+7yvaeFnbE91+Awr5uxiek8+D35O47kvt+Kz?=
 =?us-ascii?Q?H/oh179w6GBboA+2obwjJeAWhmgwm/p2WK6RkBp+OlzsjB7jpP67CNYLO6l4?=
 =?us-ascii?Q?Cg7kV+hU2l4sCZ500uDDH9xpNz39vgGaLY5bMusn4U1NhrBj5ozCTUUSpJOs?=
 =?us-ascii?Q?Ky6hwJ7utC9SyWokcU4+LtAJQGcXewKF4ir0SSM5VwJVOWQSt1jTZ1xwmp27?=
 =?us-ascii?Q?9iNG3+vMO3lmGG0Ww9Ag3qp9Uu8l/BI/qDopEf7iQq+c2HXCKXntYS5T4iwp?=
 =?us-ascii?Q?j8BWucVJIikiwF91rRuDg9vbimi4pWoA9MYX+kL/HXtyIWBtZz6NugUpLHUN?=
 =?us-ascii?Q?0/d38ItlAHcvcUmdnt/HMO75YOGb32U2P9bsw3+XmYegQvwfDbC9eFk5bV8T?=
 =?us-ascii?Q?Dy2LxH5FUCqZHPGNaF19gN+1Qxhe3HZD/uPLP9/oRMS43MA+hvB7QTx1WRbM?=
 =?us-ascii?Q?Qb2asUh4/rZhDte7MSGPl1vhzi0mSSYSaQBolS8BlIaMoJP3C0pVCLm2QFOh?=
 =?us-ascii?Q?KUiwam3ndw+e/bPIFiUGyo7qVtH611wFXDNbvfNxec7Q7cowUVRAE59nG79a?=
 =?us-ascii?Q?5zryU8e7WkOz9lym43JBp3Esgnw6xvlNXr+oddpvnBxELBdIMsfnqUIXyDGL?=
 =?us-ascii?Q?ejZkTm5o6F4/5bcvpCjhnT5njSng0uDGbegeX6p8N197IapTX3IxJnngqkNQ?=
 =?us-ascii?Q?SigB2rHOCiKkOV1g9XOOWA9SHj0nOKxNV7dYS3VrVTXZ1fMobnqUhWmEdjIW?=
 =?us-ascii?Q?rJJmAEla7H1wdNpnclaQE/VhIxtt1WpGr/HVOnD7S5F8K2391YFcSgtwYX+c?=
 =?us-ascii?Q?unn/KZjNiqW8OV8AOs3j8tiUTwmUEB+mf3q3J+D5ijlKV3rJAK6/RAUZai27?=
 =?us-ascii?Q?/wHcITxYQZhpvyKqyG2RR0uhkGZt83TglJS7cuyLMzRNzrf7B582q6dRPmcD?=
 =?us-ascii?Q?sbHQ4L2Yst/VefrxdVzeiMFLVeoL2SXtefrI5DKsBvWWKg7hOvldary5PkzG?=
 =?us-ascii?Q?QPfyPFFiIWSt4684SkNc+p20MznYGGplNJX0OdKVdnket15VG5zkd9K2tDTR?=
 =?us-ascii?Q?1HJDtbw279SZ5geBPsCA7WmXupL3nP2JH9w1z/kZrb5PSrO7MuEFCEXZSUwP?=
 =?us-ascii?Q?ht0S9CELhnHfQkpHE9mJcPWypMSAsZjjqgrKuN+IF9ysIYpttvuCPINoqQ+S?=
 =?us-ascii?Q?0QBpC+4916TmGLjei9qFIorzaoJvKDq7JlYsr4dlhu/xc1v11rM9qORlT+VB?=
 =?us-ascii?Q?VJvsiODTkQAiT2Vu4qwuOmaZbUM5chMVMUVMAeC1C3WPabBOIr8B59DD5hwO?=
 =?us-ascii?Q?EXVWYqTiFMUfbCu43fBgHu4+PsBTyUP/OanA03NBOa2aGXa4mgK57l9diaCN?=
 =?us-ascii?Q?i+BZW25XUqIkGekuiRR7P1iy/oR7dCmyN/cuiJJ46AMgOjc+LWRr5UjS7fOZ?=
 =?us-ascii?Q?q5ozBmhSxP6e6Wh+YTNf6G0gZnoLa/+XJBu+8cu6TPqerC6CSAWXsTiBcI67?=
 =?us-ascii?Q?957iBZwhpYGXZDztX0ipN/P5PvmdIsTjBDEebUOZ65ljFXlOzrkAiYgNxIAy?=
 =?us-ascii?Q?iIwPjGJbaznXRMiziT37/a0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22da9b98-49db-4565-2a1c-08de3c491333
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:16:08.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pi13WIrrTa3BppWY2L2okAzvE9ukL7tg0eymwYC1AIbLx2xCoY/d7+Ju7ncI9kTl5fEkBzUrHFSKT4pIqAvWi3yMuBV8AF3xt+nicxgt6u8o6L6a9Og0rzz7paHrSw62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

All drivers are now using new dapm functions.
Move struct snd_soc_dapm_context to soc-dapm.c

Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 22 +---------------------
 sound/soc/soc-dapm.c     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 6f3e1b57cda32..49f0fe05db01f 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -20,6 +20,7 @@ struct regulator;
 struct soc_enum;
 struct snd_pcm_substream;
 struct snd_soc_pcm_runtime;
+struct snd_soc_dapm_context;
 
 /* widget has no PM register bit */
 #define SND_SOC_NOPM	-1
@@ -579,27 +580,6 @@ struct snd_soc_dapm_update {
 	bool has_second_set;
 };
 
-/* DAPM context */
-struct snd_soc_dapm_context {
-	enum snd_soc_bias_level bias_level;
-
-	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
-
-	struct snd_soc_component *component;	/* parent component */
-	struct snd_soc_card *card;		/* parent card */
-
-	/* used during DAPM updates */
-	enum snd_soc_bias_level target_bias_level;
-	struct list_head list;
-
-	struct snd_soc_dapm_widget *wcache_sink;
-	struct snd_soc_dapm_widget *wcache_source;
-
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs_dapm;
-#endif
-};
-
 /* A list of widgets associated with an object, typically a snd_kcontrol */
 struct snd_soc_dapm_widget_list {
 	int num_widgets;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7aef57dcb2a72..07370215ea7cc 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -40,6 +40,27 @@
 
 #include <trace/events/asoc.h>
 
+/* DAPM context */
+struct snd_soc_dapm_context {
+	enum snd_soc_bias_level bias_level;
+
+	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
+
+	struct snd_soc_component *component;	/* parent component */
+	struct snd_soc_card *card;		/* parent card */
+
+	/* used during DAPM updates */
+	enum snd_soc_bias_level target_bias_level;
+	struct list_head list;
+
+	struct snd_soc_dapm_widget *wcache_sink;
+	struct snd_soc_dapm_widget *wcache_source;
+
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dapm;
+#endif
+};
+
 #define DAPM_UPDATE_STAT(widget, val) widget->dapm->card->dapm_stats.val++;
 
 #define SND_SOC_DAPM_DIR_REVERSE(x) ((x == SND_SOC_DAPM_DIR_IN) ? \
-- 
2.43.0

