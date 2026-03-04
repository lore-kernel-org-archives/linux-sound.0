Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDBB37F758
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605380; cv=fail; b=b92lG/ZKeIabF077du9RzcnmSMVuwkJnReQlQocT/EQCaqq7pUtY64T+GmygRwQoBnmG3yZ5NgKYC4/6Ur0Qcfrra4G/ErdDsoKnNN5uGYMkpAINW60DHJXLOBurBF5AXhHnei2DVp9WCHSKU2aFrtlpkeYFIHn5C78wjMgFU+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605380; c=relaxed/simple;
	bh=EqFWQTQQrvDcZ6uh30EvqXiBlrzon7jvf3a+yOoSPEI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dSk8da+BYWQdH3QoprAfVQirmcRtGS90pGVLyksbxnR4Jhky7cJ3YcjfIYBSk9ZFa0hvT6ZIYZXEHVqgXmEeEvaL9QGaa6SMgW/l/ajB+YqGWxqBmTEOFndQAJ167C4C605DuWu7q02e1LTqJh9x5tPCrzFpvCLUtELjd53rmFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hhJtahle; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hhJtahle"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6+NWCjlLEwVzY9ig6CCDOKH0ORWR6MckXCqMXtcVLDUrZpzqnNe40N3yXv8mbicnpYEPjFejyqWQ1cIvF3uisUNxY2xnyUVPuRUUzZRH940Sv4ThpwnmSdBvLFKXOcH6ouhLpwe5p+VxEcxyP7/HOzsX2BBhOYKy4JFGznA5Adu37KYFS6wwT24HKs4BUrVULLbvQDyrALtKKWD4ss3U1UZBDe3yMRsKSGaJMy5NKzAyJZhSk8U65PHmRijIsr3O6MtSg9on7xTJvZWtsoyiT9xdzzCfNe1bNKZfqj9vV8+tsNhtXPWQr9lPI+k4iR6xIPieLa9zpAnnKg4t63AXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYASI+5428opbgK0/bB2OYvo44oieODzXj0+KTxlPtY=;
 b=jkDY+iDbtp4r4e5TFyD3ilOO5E4CNFzQ+e7ypk6MqjvovmrCdicATNvZpvmYdWegNX8ItvLAiA/vtQcDAgYO/1gbj/WY83d6KJNgpi0kl+8oNAebqDXCYvfFjP8xqaMoVskTwSoUEOsbhA4dL9vBtd/JoXwdXRMrXw9+QYVmGeiL0mlMEUcO6W64B3KAvRXGrcMAnJfBsISao/S7IUDMFRUzlQX+Pz2iS49cM46iT4eJuUp18m3lcOp7Hiiq/tmF+ZH6M1XOCsdnMg80j7gLLSK5HBxCGl/lE6P5h7F2AKIB0M8M3jFikdlqko4Av9cStR4epQLccdA6Zmsb3cAKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYASI+5428opbgK0/bB2OYvo44oieODzXj0+KTxlPtY=;
 b=hhJtahleNSD0Q8oobwl5r1MYGX89roMO34BerqCEeu2S6YSbEA97V1i9ixoMG/atadBVlu8KpVblaIcTdo8gKeKhPH3fyoC/MXvXXPOhczniMtxQxztTwW2ABXm5w20xE7tF5z2/cTwLORUh50B9ww6bYvVe1UBF3V4jFnRXhYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:57 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:57 +0000
Message-ID: <87ms0op0zj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/29] ASoC: bcm: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:57 +0000
X-ClientProxiedBy: OS3PR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:604:de::8) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: e1aaed30-82a4-41d1-2df3-08de79b67a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	3odybhGNYD8DxD3xYxMGstFZ1zxVII3aMvF9kneynBAABeMul1gm0uDhD67GIFNydIxF06iTF0nZT39kvDsLDn94tjFh/IyFxc2zgpS0iojdEIzdtV7kxA6//cj3+VjOKU+q1iJDdndPkA7lG/dCEgGEJy4C/f6OA88hEIt+1SKcmWiZCxfSc83XUc6uv5qWhDDe8+lumtl+0c+v2kkweS76jNwPzoPpAd7t0tPV6meI7qQx/LaAkowTeuLCcusxMxQFtYIqnseCPuUGE8zJSSGbr13a83geh/k0Qwukr6ZOScw20xCYDuawnFtDPfjS0kJAWPf0QCWv3ZlBLHp443PfSKiTEoQatas3pxU0AAcPQXWyAnRtdIxGjfqdulYmvtQi/ivrbo3TKLBnCCATgcDHBgOQTybuM9GkIFiJ9o4Kb0Tdr13hZ/3kWAX+a5ZxcCHXZfQ22ZOe3WpSfLWP59WXi7/A7XMezRlwmSkpE8R0s4U72FkApc6LUPg++hOj/QD7zJzind04BuhJtvmM4q4NqKd9SPZZRqZqQzVTUl7hUHGJbo9Eaq6aH3SFPuv1+c9YKRBldzYkWzG8fS6HEQXDswNtqw6SOLOWAQCZPobGymZXvgSU+q1yq6Kw+hzM638PM42D72/lFxzzTGtCWcT4FNZ2KVymlFq0oRj8zlrwBMgvz453nOELUN9td3cpsw9RBEgvDhdUstLIz7Vbnq/+53DCxZLaPizscwSmnEJwucIBrth2bpBF9M0STIZ0rjEgNTm+EOsMVMJ5I+mt2hk99OOFAdH7tS3exDhdvPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GIV9YTp3hCamVnzQ7hlhSR/pXLZs8WjGmpg0B5vFQr3SnMLt/9OYYSS3+S2W?=
 =?us-ascii?Q?CoV09g0q1lqNcgxx6QnTB3PddtATbNs52zkLd5hmJO9tkub3JYKoTp6fN37k?=
 =?us-ascii?Q?rxkwjIRVtO1xvdsJErH6y0wB0/2N8/hI6eZHXf6o8xn9DGt1mUFTEsZ1Jfs4?=
 =?us-ascii?Q?GTgS/hxmNOI+bEvnVwwMqyyNQhH0NiMxfh1N5JzTLjrIdSG1/V42HfWioy/D?=
 =?us-ascii?Q?6UDPgew66+SD+ggZzc3qA0hfEjYs/WZdmPg6/Ja3D86UNSXU1k7iL/Xu5knT?=
 =?us-ascii?Q?6zcLpRhvhXNnx87JT4GkDByciAM6yRjstv3Ro8jeQWgjkoCnrGd+zHuHoV8L?=
 =?us-ascii?Q?HiViafe8UJIkVSn4mogHV4C8TsU/IrMVNywppmcOLS+qudrnaswQQSldnJE+?=
 =?us-ascii?Q?gpHS1QheaR0hvHiqGACZxBcV7qlSbVttfvum86qVcnQkGuLfSt6OHHWUnMXC?=
 =?us-ascii?Q?vS6EbprZXq5S2eSXFx2dQ5oX2YsnITyi/fZWM6jw93qw3wVi6I0h2PcCZA97?=
 =?us-ascii?Q?N36gpPttWMu8ZVRFV8Xdwo7eEHtX8yvzwEEpkwMdSPpqCSnsO2EOchZDLTL3?=
 =?us-ascii?Q?QoQIHXxoIOJ9t8t/b8ptRVDN9T3TgbhlZ4mqIcrJbdktqJlwlABfu86ObvKS?=
 =?us-ascii?Q?tMXTTrcnp2X2oueYOFTpWowCq8j6f4FTQDdt5KLOmMv6NOnUTPLoglGnfxe6?=
 =?us-ascii?Q?1mtT6hB3jF5FD+UDVPfCJQ8rsReLCBRyCOHstZPqIw7NZACM10BSFpHibYKW?=
 =?us-ascii?Q?tfGDtNoOUR4Q2gMCJwRiwM0ybj1UG8dhJOhUb0zUSgeP4miXar5mjqgYV5Fx?=
 =?us-ascii?Q?GXjVVkRpfKZdD7J/Gtm6u6a0PZBIbH+qXN3T6SaM3AZOkPiau4DvvuXsmNZy?=
 =?us-ascii?Q?kC0Cq3tkg0npTWSbJPjUxpneI6Uo+vDF+bjD6HhmBZkBlRvWh+dlkn6ACFoo?=
 =?us-ascii?Q?Y+G0rGrPr2rSQfXIYKwCaABHSM1w7AcOreZj9gJTfoPPj4JP6EPTCLSVGdnm?=
 =?us-ascii?Q?btbmDtMXhY/UM1YXzb5EhWtjoP3435eH8lnbGHbEjJBXBhQywBQlSDSQTiZ7?=
 =?us-ascii?Q?5zAfCEqC9YLA7JR45B8RVAh6sLNDHktKo7XK5uQLif2XAUfv4wiBFx00iXth?=
 =?us-ascii?Q?/8o3ceryUrK8vbBKjGXSNZIW3kyOl4kVOAVk5cl5jeY1L4/lcpO6Lvs/Z2ke?=
 =?us-ascii?Q?hidau2iXJ5Ea6eT9PewJc6e6k2NPDIDG6gpkL5iFmXYLU48tM8lU37Wry9OT?=
 =?us-ascii?Q?wa4NaZkZ0i3tj99h4lJ8ZYpswQU/8rNopYFcFwxvZ1z5sjqacRFY88GdiYx2?=
 =?us-ascii?Q?lWEK85M+UF8F8KUfdAUtGlIUzhL3WQeT38a5/ZYaXLOyWCOv63scJ+bssdYz?=
 =?us-ascii?Q?gwOAEFslECxkpMxX67cY+3dfvKD7STy1iVKQo+I8xMHvb1bG8ltQTNbZxkyl?=
 =?us-ascii?Q?W+d902XkRPtTQbRsQdKCKLhMol5sewTnKXy0fveVMcIXla3RCm/d+uxDwWDh?=
 =?us-ascii?Q?VqWtq12LwTwdZ61sKlWlligjgEvv5s0C4BdmOgjrBDQxGMUswZ/6N1dDF6Lw?=
 =?us-ascii?Q?lLIJTW3tqzGDnG9AXYVbYwXSz3Drq2rRWoi2WkVOf58ThHPFOsU6a7LPCaLZ?=
 =?us-ascii?Q?muNEdfpC+xkm/vCdawUAO0TOtgIslq1SkD/huBYgYxsBZoVIUAYHnihVc9RV?=
 =?us-ascii?Q?EQtv+IkVAoX0UaEsWaM0ZpleLLBBR0AJOPPm39kQtl6ngRTiFHE93tGcdXQ+?=
 =?us-ascii?Q?0SmBDHCczHFHoYjb+G8JQYnhYPbCEOlcwNRiBscqdQq+LG3OGKKg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1aaed30-82a4-41d1-2df3-08de79b67a27
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:57.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqMukxw2RgwwAqi0E06r/wA+oRHjlhId6u+qNNs8hQQ3F0wnnq/6MY5DbRgTImBuTEiPP9xduOY851zTL4AaNbhNjmwmU96JSUJXQoiMD8PNE+qhcWbPPbk5bWp1UmVX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index 6a3fd0d893656..a40f6bed69c6f 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -386,7 +386,7 @@ static const struct snd_soc_component_driver bcm63xx_soc_platform = {
 	.prepare = bcm63xx_pcm_prepare,
 	.trigger = bcm63xx_pcm_trigger,
 	.pointer = bcm63xx_pcm_pointer,
-	.pcm_construct = bcm63xx_soc_pcm_new,
+	.pcm_new = bcm63xx_soc_pcm_new,
 };
 
 int bcm63xx_soc_platform_probe(struct platform_device *pdev,
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 4cb2fe10bcdc1..dc243f2dfd32b 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -713,7 +713,7 @@ static const struct snd_soc_component_driver cygnus_soc_platform = {
 	.prepare	= cygnus_pcm_prepare,
 	.trigger	= cygnus_pcm_trigger,
 	.pointer	= cygnus_pcm_pointer,
-	.pcm_construct	= cygnus_dma_new,
+	.pcm_new	= cygnus_dma_new,
 };
 
 int cygnus_soc_platform_register(struct device *dev,
-- 
2.43.0

