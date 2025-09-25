Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC5155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777436; cv=fail; b=u79/Qk4DlDWMECcxH8bjVWKxjChPTBdfZtJTTvWmQxh7r7guFCLNV3TZVpeAdsIzDYBPvqHZ8GbD91YyktmztxjIsGYCume1wcvWsjrYDPY0xpy5ioPZcsvcfB7Q5GqPrtJyIGp3Tc4hpbpo+WgAAyvejV71x35+7mn57EXdaXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777436; c=relaxed/simple;
	bh=UX/Y8td8wfSGHViGi3Nq77c8QVsQzaepOY6z0yyYHhY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LggeL8C7yp1Q3jegg5lPPHYtHkWBzdnJtFagYQX5SIMc5XDiAuHHaoXsnIEiP8za+M1ADpwssUmmoGTNb/9sBvRwdE2LLJZXunUsimtVHuVImdCQYK9Kev/k75JhvaIegXKDLLJ94bWYaIEL/QoTrUsW7nYE9zSEl8zyhmX19lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hA3ZYADa; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hA3ZYADa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDuy2GVWqu0Qj6jzYH0Rlq/IpaOxOuh4X2zlK4ORcJrbm4rQ03dCROJ+AL+qABaOxWpsK5b2KCiB708RgDQRuUR4Wc+hKA0vr9tsrdFc3u0qGqb+G357l/8nZb12Ltckojy9BlMEMgAEAMj6/+vfn5gF/2JFsoI7j3ADHcKsNQY5UwnElTGPUeg2leaUdJXx19Irjf/iqEj6wpQx23EMXza1cq4/iCMDWz5hoecAEXZ7cUgP32xcByVN0C5rdTyz+hvTzHX7zrxf63ItEKNW6itm6Q4EPmOQdykftv9fmREIQPEmKFQJCYHogxXGRvkwSYvlcWvKD8XRNRJ99c1YLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jelocXhI/HWIHS4S5DRk53FXQ9brn/QVsdn9nTWpp64=;
 b=h2pZuAQfApTFGQR95wQGxrlnsuYYxI806H822JAG/K5FthErE15o1KxGypLReCkk9ZR7l12LOg2gRxmrQUA4/VzU9fGQrrcNcXy5Popf02tdJQasR0FSso8DKXifYoOQHq9dIr/iDnmFv/L6N2/Ly6KcRnEwu3EguP/XWaMrL2B7AdWopW1nDCXsNLFsxa9j84svN0KwA+EH6O050AxOwXqPfTpzxLwPU4lw2AIiN65ggyfnSX8e4gWI92qX+p1Bgic950ZogFbFa7IzWKzLhf5oqFKNa7IXi29zAw1ZZ+HWSIZZj3N0yiMA0sAvN3Pf9ikhjBriPNvf19hX1pmpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jelocXhI/HWIHS4S5DRk53FXQ9brn/QVsdn9nTWpp64=;
 b=hA3ZYADaN6A/Ewn1WOoJIX8JoSJBTa5L4+nif40Ed9wtfrg23shr9qSIQBJkmszx8uRYuyTFuSMoIGZP6gtC2XxRSIB1adlYHXLk8cM3ycl87UOEv91FB3udIADLGM8VAAXpu2jatT7h1Jaf1AyPQ8EPjOLsoHX5pVW7rZdSZNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:11 +0000
Message-ID: <87cy7fyuug.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/8] ASoC: renesas: msiof: use reset controller
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:11 +0000
X-ClientProxiedBy: TYCP286CA0177.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fc763d-ced4-45c8-47a3-08ddfbf2c80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H1vuyEUbRwvCWhEiPn7jPv655IyyAtrGVeuxghyhgfjcn1Ted2MO94mPBuM0?=
 =?us-ascii?Q?oS+RcdlNQl5VM91d0Sf6aQDBVE7fGVA3rAJKH9O1TsISoeF577nM3lJn+zdt?=
 =?us-ascii?Q?No3GQBulvCxHXQl2nCTtu2xQRtVaDxy1h3QvN3IjhcwhQFa1shY7h+IlhAsK?=
 =?us-ascii?Q?xRkq50QscS0K10Qj2tgRBGsXKFtGVJ/iJw82xByIuTZLCKAujdBIYosRjxaf?=
 =?us-ascii?Q?ytfAxShj1k5m+t36eTSdNG2qLsU8P2cpY3oXg7IjAy/fTDHP30Xpnk/7geY1?=
 =?us-ascii?Q?nHpEZNuL3jX8frprzc0QUbo4OK9+EtjEvAj/8/uFcGd+enctK4+b5mqW4AoE?=
 =?us-ascii?Q?1cc7RjkVLQyk7x+W3VauBmCRHJaDvPjHfyoppN6ENUHGXIk3Jznl0dosRusF?=
 =?us-ascii?Q?h9mo8o1MfvxgHv82hhi7vjVE8OYJboZX2oMyWyglUdkvK8Ja/8EEIHSAFsjW?=
 =?us-ascii?Q?sxCew14n0iU/KLoCcpm4QooxmF2PA7ui/4trKmfkaphiIpa9rqnQvlQ01B+H?=
 =?us-ascii?Q?5EeBxFC1nOUQhPnPXUQBV57wwSJzzcak1LVzshznnFe1wBLeof7QwQOTwtn+?=
 =?us-ascii?Q?3+E81IzTxSece6zlWbGNS0TzJcgExGGgsECdcFzScfMq3cwD0RcTAaysBRSy?=
 =?us-ascii?Q?j8wp/zOmH853WF1IDzr89t8oE54xlwmrcFdpIS9XKDa7++eeSJUjxbnu8I0Q?=
 =?us-ascii?Q?v8tFUjKwMQiTiLIXmOHTHjBEn0eRZK61CgrzuwP4PGMCfgMupHlJNnliJD0o?=
 =?us-ascii?Q?DeKbqRLDWKQTFSXeo37XEE8bl1qTzwV+fSIb/bgI7QNBXRNkhjThHYZEQpLk?=
 =?us-ascii?Q?1CWH9NXTWX2vMuBZ6gc6NztQbtVPniE1zsCgDSBMCfWhuer+l0G6Th/Oq72z?=
 =?us-ascii?Q?+k6JABkrtnX8aNVjsfGUdBh03RIICEivOTw/WIVI5GBeBD6NdNFy+FWVAOVG?=
 =?us-ascii?Q?k96j0emWVG8SXrtjM0ogc8aCK/JveMCNC2n7ZT5bWZBhH5/brL5MH43WFLbj?=
 =?us-ascii?Q?K8gu3VemW7TlECYUkmWP6L/pinXlWDTni/25KYa2mPvrksF5AUWt7UymKgiZ?=
 =?us-ascii?Q?XWM6YbQuTVLV5TovtDy++c1YmcxvEzNLU2MjOn122UfTL+X07RpmNgYUlrr+?=
 =?us-ascii?Q?uqo5nUQOahJQWYf0h+MWrYLg4qoHT1M9Z+aalLtN1RRq98t0amRCJupAlzGu?=
 =?us-ascii?Q?gD3CGwnLeGG3ATK1slbCFPPp1Qc8G1mfVniX1k6xHPGYsiFsRzbxbAmmsjFk?=
 =?us-ascii?Q?r+qQj2qIDFBpW93XFZpXlGC8j2bZnhSP4OSoKWqOQGmquqWfqBZCkCzfwh9o?=
 =?us-ascii?Q?h2Eo7YeUrRwYt03HmAmgMch9OXhfC981UlA1vUfxF/5FYuVP/x7uMzZmNFgH?=
 =?us-ascii?Q?9ZcM7vjhPbxLKPIfZ0kZWVNPiYDfRcrYCnevyLRHZxPLUpGZuc4+1XiQLDbB?=
 =?us-ascii?Q?OSVU59+FTg78v4N3FGio7JVhxQKi6gMfJ/eDbhF0txGzYBNu5Rb+pm3ddR1I?=
 =?us-ascii?Q?sc30UZEiUzxqD7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WW5nVcJASHccjQDCepun0ws9/jTwLmRvds2NW1bHaG3e9vcXr5uY+5r0bJV4?=
 =?us-ascii?Q?zdpibb47H4FL9Dr4aoe1ImFdROFCZ+72ELFKYC9ODfQfvDzxAm42buRJvMJ7?=
 =?us-ascii?Q?TL9pUDUsN3VflsQNO6noQ9+17Ii2+0G5iXXtPkD7xgf+gDm+fEKtI3rO2tO4?=
 =?us-ascii?Q?AYZDPp4s862JVvl9g7teua4GSMcUbTakTa8wuxJTNC+gbWoVHdxWf1uki112?=
 =?us-ascii?Q?qRZBFm3S7kDtAzrfF+gYQYyL/JjytFWIwiSIiNmiHDBxK8dO49RLKKgap+Y8?=
 =?us-ascii?Q?vjZkItwLd6j/eQdKC+vLHaV+DYTlGjsOH2YKDmSWAVcIYChqwWrTqlyYRJDY?=
 =?us-ascii?Q?uYi3sCAuVDm2dYFzYv7Q40Cc9qwZYjmWtCoHIgRVEvbkSpMYkR8W3qJES2Yh?=
 =?us-ascii?Q?M+UkrxQMg2Zy5x/qDjg/qRYDP7vDCfYlLF1uhrzy1naLBNfGab4lblTOl44p?=
 =?us-ascii?Q?K1YcyQRWQIfduIilejnYOcgDf68x576DKeegcnySc2th6ifb7QOmxlcMxdmh?=
 =?us-ascii?Q?pAKJsj17ReYH0BMbKpJCuZ36MH4hZHnGcrxghAp1/eqXKQ3ZR/60idKziakG?=
 =?us-ascii?Q?i9LyjznsG5k45Ukx88gA6bCt1Ke/3Lxiq+v6epKPmre+Lj7FDKTVaTe8L9M4?=
 =?us-ascii?Q?c6v16+TgQFxC5IgXFy9GYMS8GDLJqUU1Dwq51GzK36jggkNvJdd4uauHQjOx?=
 =?us-ascii?Q?AKre9bGIA5HjWeGlc/Ys6fV0KInr+eQbxfqjFuJUVuUG1iLehtRAxDJJUikK?=
 =?us-ascii?Q?0nP+rwxU/90ODZ8pn77qKqFYS0BrWBo7X52SBARfL3STkwHbOTYGsR+s5u3+?=
 =?us-ascii?Q?xtDgztUa6PYvwrslcUKvW8XayFQmJSdyGACvy3599R1PIvQy9BVPH2oelQvz?=
 =?us-ascii?Q?vUKl3iXGYDjUjTlIjBMk4IIv5Ftt9qzJ8hAiOOovVMnooW66feZvvjDTZdJm?=
 =?us-ascii?Q?22mYNOHz2sBeieOGEAbKO/cPsH+ouSXz2x0CBBOy2lqDcODe6UsmQqEHSr5v?=
 =?us-ascii?Q?aHXSv5cFje73LCuMTo29itY3IjUf0IshppX3nuIlae61D4bk2Dia1Mwe8DTM?=
 =?us-ascii?Q?j5pFkbqNAXKpI1NhIYb923xrRuwO0ASZ/+TTK9m+9xAinYms4bzM502/E4An?=
 =?us-ascii?Q?nAlPaS5G+JKxzNAf+ZY5+edc+k+vFcfGQLB7+wDflqp2MdwHJwPe+O1REcrn?=
 =?us-ascii?Q?X/q7Hzfs9mp3GGNph7HpUcCQE5C8tnxyADGd2a0YRuKebW8Q79oYTVTeJKon?=
 =?us-ascii?Q?UWOF+Sdu3/dNJQzrTReIfNummxgjGXww30ucJ50H18q3oUo8ZLeX3vhQl3Zm?=
 =?us-ascii?Q?BdPhjX7S9toPMu2XDHvJfr3eQC0a4PklJqpj192aF6ciQpyMe+FxUHtQT9zY?=
 =?us-ascii?Q?/K3GVcvyjWALvlk6syF8+YZ2UGZLOZIsAnn7wsYXBd4ai5nTwj41/PRPdAti?=
 =?us-ascii?Q?KGkz/Xd2cr10Ris8KqbqAEihS9VuEJSYZhDVh97iv/R6e01suaSgAoX3G77O?=
 =?us-ascii?Q?8ZH7vBiqKj506qhGDKilBYO5jE8a+elbrk6jisjPeNZjupMjgniTEdnkYayB?=
 =?us-ascii?Q?2MzKJfAcX+BDTnH6pldxZsibG6VRk/bkb2CvzTTZYf+YJ4+kM6jCUvDlrT35?=
 =?us-ascii?Q?cz9fqWH+d/dd0FCpVkpnSM4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fc763d-ced4-45c8-47a3-08ddfbf2c80a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:11.4653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJp4DKiKIdxmDruS8qAlZWQcGcify9oUaqpsu61fFh8NmfaFkksgvB6cyfHU+vBrIhHa+zPcd8gR0+GqnpH+ic+dF9nSNXRUR1FvjUGu/ZqSXqXvEGTxmijNEe/MrGRj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

MSIOF has TXRST/RXRST to reset FIFO, but it shouldn't be used during SYNC
signal was asserted, because it will be cause of HW issue.

When MSIOF is used as Sound driver, this driver is assuming it is used as
clock consumer mode (= Codec is clock provider). This means, it can't
control SYNC signal by itself.

We need to use SW reset (= reset_control_xxx()) instead of TXRST/RXRST.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 6819471fb5b2..87bec248d5c1 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -24,12 +24,25 @@
  * Clock/Frame Consumer Mode.
  */
 
+/*
+ * [NOTE-RESET]
+ *
+ * MSIOF has TXRST/RXRST to reset FIFO, but it shouldn't be used during SYNC signal was asserted,
+ * because it will be cause of HW issue.
+ *
+ * When MSIOF is used as Sound driver, this driver is assuming it is used as clock consumer mode
+ * (= Codec is clock provider). This means, it can't control SYNC signal by itself.
+ *
+ * We need to use SW reset (= reset_control_xxx()) instead of TXRST/RXRST.
+ */
+
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/spi/sh_msiof.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/soc.h>
@@ -60,10 +73,13 @@
 struct msiof_priv {
 	struct device *dev;
 	struct snd_pcm_substream *substream[SNDRV_PCM_STREAM_LAST + 1];
+	struct reset_control *reset;
 	spinlock_t lock;
 	void __iomem *base;
 	resource_size_t phy_addr;
 
+	int count;
+
 	/* for error */
 	int err_syc[SNDRV_PCM_STREAM_LAST + 1];
 	int err_ovf[SNDRV_PCM_STREAM_LAST + 1];
@@ -131,6 +147,16 @@ static int msiof_hw_start(struct snd_soc_component *component,
 	 *	RX: Fig 109.15
 	 */
 
+	/*
+	 * Use reset_control_xx() instead of TXRST/RXRST.
+	 * see
+	 *	[NOTE-RESET]
+	 */
+	if (!priv->count)
+		reset_control_deassert(priv->reset);
+
+	priv->count++;
+
 	/* reset errors */
 	priv->err_syc[substream->stream] =
 	priv->err_ovf[substream->stream] =
@@ -152,7 +178,6 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
 		msiof_write(priv, SITMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
 		msiof_write(priv, SITMDR3, val);
-
 	}
 	/* SIRMDRx */
 	else {
@@ -227,6 +252,11 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 			 priv->err_ovf[substream->stream],
 			 priv->err_udf[substream->stream]);
 
+	priv->count--;
+
+	if (!priv->count)
+		reset_control_assert(priv->reset);
+
 	return 0;
 }
 
@@ -490,12 +520,19 @@ static int msiof_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	reset_control_assert(priv->reset);
+
 	ret = devm_request_irq(dev, irq, msiof_interrupt, 0, dev_name(dev), priv);
 	if (ret)
 		return ret;
 
 	priv->dev	= dev;
 	priv->phy_addr	= res->start;
+	priv->count	= 0;
 
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
-- 
2.43.0

