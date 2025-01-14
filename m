Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8F5695
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 01:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736816792; cv=fail; b=tUxfLbRKPEvCCL453oJTE7LpZP56bbWQ8fAfuQAEfE2xV2R1P8DpW0M2c99JI+3HeVvHtgq1/gdh4ym/sDtRohexnL9qhgpe2M6vcN3/zdxN4K+Vr4GrPMzv8WZYQDNvJVXV2/3xkzndXTgyFOzOryZ2xicEM3OGQxP8qcZ3caE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736816792; c=relaxed/simple;
	bh=iJ2VH12Pr99iWduAxAG9YUQMebXaz9ibp8NtbpgIh2w=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=JLiobDCWqaPwlWgmXXULHC/qnbqrQC2H57EyX0ALznuJJGGzeF0+/Ny1ks9nqywzq0XDyy36vgTA8fgY3+Poj/lb5zd+ZDISWhVy3OBOF6Qx98uKS2nhiKZrGhgi6bQCtN/7iFNVKYkooO9KLrwe2lc463+Afyxzz2W7MNiFQBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OZa43f4D; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OZa43f4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDh3tpu/qWq+aDGWO49gmht/3hc5lCpVasQSYXoSjP/FRc/UFTBZd2HO2zY+TtZhAvwnBZsLKs0frSyBw5SJ5WINIyFhu6ksB/j7RRrsFXD8R/B2ffpu+Ia7GooRhPYf98qdRaJgKTScvN4iwuUfmvBGF4t/VZyGFVn+oRNLyzYVBfP6LcV/UMBTEs+KRMnQdDO79RgeMfRWd8rjMvjQeOtrWGEJ4DlDE/0d0hWQX2ExUQsYzxfb+XhDS3UOKvZIZNe1GX46Uuf96c5YrUYNZk3LrloLLHfUhOTOeNzEZfr3RwH03yM319GcDvP/i0kEbLRDyK+cHfQtDP3o4LjCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+o/b4xJFHtHKRZA/l95z1AnfotzPRxmdAP5Zk35v/E=;
 b=FcXdgaECuAJGUJsq7NUdqUMeKzeP1WRdzoAlAlASqDNHVQGLmflnwXGiTLIoissohrVQ0vC8J2VfA09r2pNL1uTPOIjN11s2DhIm6Ys/uOsWfphq+tzbLFBvelbV8sQNgTgDNNToRZcw/VzFM5j92fk86ktmVjaLBNZ/5xG/xm7otqvGjJcR+8UKGu1pLgSaLLKkFFYdsYlGmnGq2+OMxFoJyZyC7nP8NMdxVr9m1P/SlQw0J9VEUdjQcPyMOYs6zXSVz4cV3lBS32KeIjfgIYYW/SZrV9dW5RMOdyuvdhRvhoUKerHMD6sMJWw2KBXVC3vpdaCnl+VmUvaYHAorfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+o/b4xJFHtHKRZA/l95z1AnfotzPRxmdAP5Zk35v/E=;
 b=OZa43f4DmudBsrhEIxpRd+rLE7Ocib8AXigDOyqrOavtmVqzBSelM+X0tJZwUfAp72+OusjyE7uVfNju7abJViHDwrNTLb4t2XF47FgG9N32KguGRWRC7cRoeGzzOsZcOkNDhlwdrQTM25wlFK8VPIHVoeBLsTMsxX7DiOYkygI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5680.jpnprd01.prod.outlook.com
 (2603:1096:400:a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Tue, 14 Jan
 2025 01:06:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 01:06:23 +0000
Message-ID: <877c6ytd9t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-dapm: remove !card check from snd_soc_dapm_set_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Jan 2025 01:06:22 +0000
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 263e5250-aaf1-45eb-ef13-08dd3437a98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+AJgRhFQPKmL44x70o2W2gPSe+rVvXYkb3gYrAmhJ+x2TaG6yp43PA18TQRC?=
 =?us-ascii?Q?koeDP4pkBG7mFBzfHohhp0DAooAVPxZJVZoX1g5rfuibFeaGVfai4Mq/lrLQ?=
 =?us-ascii?Q?qaGC5v+fiUDk3JqKQkiAq/0BD4Ayny8iYqc1Nb6ZKGR9HJ7bvHvE60J8iLGW?=
 =?us-ascii?Q?SGHFz92jJRsE2V42dOruzQs7OqP+zWwQyVlsZPA0sq+w9tQN4ijI85YU2i6b?=
 =?us-ascii?Q?+DYgJ0BMEU/XJgxaMaEy9fNu80XpA0ryfS3MvH8niorzDCzbxN5fA+zJ7dWD?=
 =?us-ascii?Q?qFy0RuvtRRt+FPGRTgOYPj/k1x7OgvhrknGEqHVnwxhQwv+ZRK/k9bInNik0?=
 =?us-ascii?Q?xg9Ix9X6goFShRUenI+1JECCbeOqDSKPYK5zPqB0xBSGXrTDJFObJcN1Eg9e?=
 =?us-ascii?Q?EKveXZm8J7xB+l/94B6FiuosW9JU0ut605QgOyW34RGNdtw3bkBqCoY6R6R6?=
 =?us-ascii?Q?6CRQGhlB3f//GxnS59oaZXmKov+p0vjySYomCocc3sbp4AXQVHOASkcujOdr?=
 =?us-ascii?Q?xK75XiVCOnugoAM+tnZ1TzTiU4l87tIIWYTsnTMwajq/yYaWxnxyV2WqN5jL?=
 =?us-ascii?Q?mQfxKbM0zhZ+1Axj7/s+Gl34Ptfj8+nGyPoilQnCpflKvo6f9At0zsHaEutT?=
 =?us-ascii?Q?k/DKqMN9vBB2JC2Uv4zF0/+XtAone4+E81hfb+YvHyT0oylUaE/moqmbpC+c?=
 =?us-ascii?Q?7uyYFohoUoCee554tIzWm2AQGiI5akwl3E4vkvm4Om9iW9e4lDlNMqmQSU/0?=
 =?us-ascii?Q?pS2t08uFjNshwsCoR5G2MBp3tJTKdnpVKApxGDPDypC3y7rMBPav/EqgewMF?=
 =?us-ascii?Q?i3u4ubUVhSAQkU4O8+xsEH4mrVgBa91PkeNhXQLoyTH5hfub4uL2wZYz4TW+?=
 =?us-ascii?Q?XuA36UycyNRTRyXPHlZNKnP62NkkKXbrqeG7teNoGG9CyK7EX/AcvNIxWNEX?=
 =?us-ascii?Q?tKprWNfwVc6Ly3KOXU2e3XhKysePjnE01Y9CIg4A9+Spx7hQsCulFmCZzwqf?=
 =?us-ascii?Q?ry7jsLTf98yCD4SW0OnWdoUOT+W+M2V0tQdjknmbQVDHbVPrR1VSa0B0ldQc?=
 =?us-ascii?Q?tyKVJokR1FS7y4ykN0iIr8MLLkO4OJ2JHgqDioNnyspGNnTJt72d1BHjKz6c?=
 =?us-ascii?Q?SG7yI67Y1Aqipos1vxlp93G8C65D5Fp6C9RCpGGg6G0wrXvu/cd2s9To53uM?=
 =?us-ascii?Q?sTxiKrmIWB+GY4vO0MaS+0dhKyVXpyz2i43XPBg6BwaAxAPPxIyYl5rOL3jY?=
 =?us-ascii?Q?6r8BNNbyhHEYKybx2JVU9pOFLVAdXsbp18pivNGWdTM3OEghs5FIeSxvWUWm?=
 =?us-ascii?Q?eCQLBmRmIqY4eqfpSfNxpgdnnOeRBNoK1/YNbBzkyWovaxPO2IJr3PBdUrbZ?=
 =?us-ascii?Q?QjcHb3k7/q9ZeRiR8SeOlXiK+HoR0LtDXUJEeFRw1xJehwppRZWk8ZEwyJD0?=
 =?us-ascii?Q?V93FCUQOs4FB1AJXLOStuLxnCyDHOiRE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QoKHhhsZQamyApRFLxuN9vjn9EqOtVicU9fgadcywRGBCh2bWgOqbhkwV/O+?=
 =?us-ascii?Q?/2rfv50ICcvEQZdXetQT0z1UtkmZn8tlad8vlBNOVqooiIqckkwU7l5FH0F6?=
 =?us-ascii?Q?duMjjUq1MW36/exX+VVyu929sbX2EoI0V4YHb3GAaGiCfqV4I+BXhFB8a9Ff?=
 =?us-ascii?Q?7Bx/wP27bREL8wNTcxfnrJgyRSKdc1clF9bivPeEYQ0cXdyuCj5rhwP8hgR/?=
 =?us-ascii?Q?UobZYn3piMi17StxPigRESp3VkVtHv2cnYL+v7E4aa6XsBwi8veQi1cZt8t8?=
 =?us-ascii?Q?hgmOi9htQLg97lkgUevAL5xjABzizPNXcgFJ2sTX9AiTL8WlDqnNeVHwNL1Z?=
 =?us-ascii?Q?YdydT5oR1QhY5bA9wDWwk7lHea3fw/F4F7FMWbvGGaMon5rUMp5A9TTVygSb?=
 =?us-ascii?Q?Z5V82zE79lJzM+NlHJ3dmr3n7U/r736emwB+M+6kHF4Gj0WEjz4mM/GRdmkz?=
 =?us-ascii?Q?jSQ+jYdHwT9wbptxfKGD8AlooFE9tW8IN42EDrP/RsFMLNRLstzd/qdMAF1Q?=
 =?us-ascii?Q?QPDjWuCQV8FzD+MLymasZWwyOviZNsPXkazPstGAu6HV5PYZl7waAFwEMUjP?=
 =?us-ascii?Q?3C1Zk8KmHdya5lfjgEKlkNcEnkNdg8eK1dwAgUzAtkv1obZZp19vnUF0Nrlo?=
 =?us-ascii?Q?30NuC3t6GoS3V3tVz/YRWDLZ31hctKzfr4578nTgM3n+7fxhS/YBxpTMgaUi?=
 =?us-ascii?Q?JYD8i7DPxgqQXFPCxY1Lt3Hlh6I5AGBg3HSfIXYXDgLmFUvzqxfZ7GiF3HQ0?=
 =?us-ascii?Q?n8JK/vqDiCnUQ08E4R/KdrmWGDk2unQA4hzEuaWVAmvjxdXS4G+gmc5GyfPz?=
 =?us-ascii?Q?U7GUkcMlmrx4e5GL4kMEKqZeSQU7LSuWbl+WWCnIpYiuIllVWqGVcNCwJLVl?=
 =?us-ascii?Q?27U5kyoYoyJ9lvBxhrE1K75hJOrC3i0n1jrtSvSzR65MRVAsbbeOYXAEJmUm?=
 =?us-ascii?Q?dswwHsxzQyGBDSQWEoulWDB8LDb66HAG4EoX4xkj/KP4Dmt7N+yp503LZYCO?=
 =?us-ascii?Q?3rXQ6rNpoXIoqqC5pZuyNLWfpqO2ZnDt675us2L5MnCVDXnTsPvrtaI/bb3c?=
 =?us-ascii?Q?arITYKxzDSbhal9WhNSNtxfRgZ1acrDPlRjMm/vi1U3MENZFCyVy0yQn65Qk?=
 =?us-ascii?Q?qjsvblQAOnZSGiMEOT172LiGK+DX4XC6jtVXqjhK0UOKGaWvNfNpz/DIndDZ?=
 =?us-ascii?Q?ksJcMMrexD3B8clS30Be4jt4/nVhQ4QJizDp9cnKF3yaVNfQgrKm8RSWhRM7?=
 =?us-ascii?Q?TWWd37zXY0Cr22HXhrE08P+HEz3nJuInH+zFQbdHwhOX/+bd8icUpMAsROb1?=
 =?us-ascii?Q?5anfnmfiOcT1JKaUEhuFiC9u0V7OXdJkaA4B1TwkkZ+3CXzAlKz4BscfYq7S?=
 =?us-ascii?Q?3KqpFzI1vlGJFJSXDuGjxA/k0neOteeEb+csagpYEDQDWDOMkD7Lf/qWHOUk?=
 =?us-ascii?Q?/l+U044F3nPNRStt5fz2F9RCW0wchpxvekfY8/+PdD2mg5Hz8pz+Zn+eeoW+?=
 =?us-ascii?Q?7CbfSJiu6QVD6DUQ/k+M/b/rpMkdYnfU9FLdNsYMnPohW5hZvREBgaxH8Qtf?=
 =?us-ascii?Q?9DUEP1U39b1a7tcb63VjM/XlyKRwQrzbDbb+HZvH/Debmpv5wtc17wblWoDQ?=
 =?us-ascii?Q?ytC1mzEz8q69oRS3jnqVqPU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263e5250-aaf1-45eb-ef13-08dd3437a98e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 01:06:23.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1YCO+kUSFSxUZh89QGaPrupMVl+fXT863Odsb1dKwvIBcolQKiZWyYSuaoaz5iBmO9XZ85Ib9qaP9oZn9wZpfPfzthQMhlkxfO71Z8ANVvlQh2vVK3LxP+RXCTCML6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5680

dapm is setup by snd_soc_dapm_init(), thus dapm->card never been NULL.
We don't need if (!card) check for it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b1..c0d2c8afe92c8 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -730,7 +730,7 @@ static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
 	if (ret != 0)
 		goto out;
 
-	if (!card || dapm != &card->dapm)
+	if (dapm != &card->dapm)
 		ret = snd_soc_dapm_force_bias_level(dapm, level);
 
 	if (ret != 0)
-- 
2.43.0

