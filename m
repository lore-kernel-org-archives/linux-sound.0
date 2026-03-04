Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E937F8CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605447; cv=fail; b=g5ZzL69/C7Hn9zhzsJ+pbt8WMO2pc0gLzsuMTIQMJJKM5xMY6IQh7Dt/jq1Iko+Q7GJOiupfBnHJ8Kd4FvyA+QVWFdMINdl1AQcWOp7mqoEZcTbVKGmLan8QeGoT+5r45oFtO/kTONGIvhMI/OIKzKdvp59iFiv/ENXTJYs+xxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605447; c=relaxed/simple;
	bh=9YSD5T7RdN04CSyyb5SudpRvZZL8Wu7E9zNk24CaHXw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TQ05WR3JCDPjZollOCgofyE7jwWcLwjf9B/sazpBGJYcFhxtRe0dIw206v0Gexd4FKDyo0OVj1hxODnONHznnf9zZta+Y3X/OkkxKog9zD3pyrlYQHfJkXslBUUlbD+JAKd6VJHSqvnhC3KQ1rs/Xg9P7mpOKYBaH2MeV2pB99A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l2Qb2fXD; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l2Qb2fXD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkNoCq7HSkuCZpx9EQn6qvOka/ZTEWvmqrEmGIRMtdKNLyRJGPgz9CdXEYwIDqUAGS6qCuF0FRiCodV4wKxUMZExpVZY0aabD0yoN1FU9ZJ0GOtiNMri2C0OadVLGa1UAMQN0BcY3U5SXQ0DZaWOCxfaCTVt5etBGa0YoPxSRnXbJcQYlh8l20y1XyTBnvoPF629WqtCTw+kARzKhTaElg0JIZHHZzcFpTNpZr1CTWQ1V+nBj7+pxu3+2899au5D8T5/qJ0gZ+0RHsSvmQNzh5ljnUwXvpZm6azGdyme+cYQV4g2wu0NGbqTTpopyBNgxnW91YOvbKrFOCgYDCpzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7alxssNUv7LV1xuk4OORJnzrLV2GYrPmEa0WYb04+8=;
 b=O5DIFKDOXXviKdYWvbwkJf6FBq/0uurfkCiYFgFkv8mEqvrjDam/LZXdQ4xDOBDSf/ZGQ2I37aMvcN6mUd9mOoRgUJjZW+HjDNXKiTfEMT8A9DSlfJys9uDEy3oDi4kNxleCVEGN4d0AYS9TCLZ0GjpKFtks+KGiRMRsMUSZ7MfrCSfNN4yYJiF0YreM44S8aowvyaVLNDTuhQiw2CqoiCXxi2N4rhSDoDrJ3mFNcXA9og711bY6QuyoanJklpHh83WRKmkQL0czNHaULg2OBrBDPMp6YkCZMxZk9yPeCh8DgThKq8fgUVXj82qGx6fNbdXOjwp1EnweunmB5XDVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7alxssNUv7LV1xuk4OORJnzrLV2GYrPmEa0WYb04+8=;
 b=l2Qb2fXD6tRvnQMlb9k3A0JY5pjbUxnfXStd8a7jChUxXcchom+ppEt4qEOBVvHWTxUPL/r9EB33MKLpqxlIi0mfj4iMBEKuxYdkNUPcPMwi89roDVE56ME7tFe/XabSHbfn+idlWduGy0Sg4IG7Gn76+FPaz1dfgtHMNYc19Pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB17519.jpnprd01.prod.outlook.com (2603:1096:604:44b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 06:24:03 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:24:03 +0000
Message-ID: <87v7fcnmd8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 25/29] ASoC: tegra: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:24:03 +0000
X-ClientProxiedBy: TY4P301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::19) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB17519:EE_
X-MS-Office365-Filtering-Correlation-Id: 2814f493-0c57-4e77-1ea3-08de79b6a1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	AlH+CJ3MvXziCpUTykg0TYSg5kMbTLLza0+Ssy4ePbjbYKHR1BzU9Jl+Fe/raoQLhwo8/A3IoimeWVK5bnc1kN7A2Eq3MXfoI2d0fs/X8lK64Q1OTL8hwVdVoxm+q1arvTTNXGLjNev4MACwqyALHz7Nh+KsUb+IGJ6YSQOqOQzVvlQbparonYXnOqd+GYF2HvF5zl4pVYpFlIQVOw8jirh3xz/5WF7ohR3XTSbqm8YfCiaCf/HOE23MJ7Av22h1uhgRxq9WXJL8LqsKdAY3jgXwbX1SpTwlBVLoeYWxHUJ1eoT0jpVzRqLrxQG+pnTLtXG7xoTGnJxYiC6uVDOdEF5Q7Hg+Kj2EV2YQjnPCccfyFqGbRv96n76Bh34qtMGBlxfhRLKibVWhU54LBNJQQ4+1oPuzq++uD9h0RSuPu5m6KXe2flujdbWfuvnLVvSL150l/XPniHIBb+Z1QGzc9Yuprtijm+6bo9WjM7aBHUPCePAaEc1Ikq6zFzSqpZUwPa5s2IQxaPmZHzmZ4IJoAg0/mOHVCkBbJK9q2Z5HR5MDrJTOwkoLnPi1+ct58jkAMPeYYdW44D12bFK8zld908dLznRvuctd3IoUJTbKyuWbIYm8CrTf0k01Qg5MkfpZVl6CLaFqw6J0jxj+A6jUgVulPstKbEWn7gFmoTtZzeOpBlYRTBWCOAcxDWeMvnDgeZIayLlV52qse18XtQ5i4upvgcPVwmfjJQnnQgxkjP3n3ZAa96fnAwXj+MgJRt6rIGMbqR/Y4K60yWLbHe3ljl4r2pzEfPNBQlTXIL0Z8fU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?euwSQ6xDr3l82NTT4OZl8df6xLGr+fQyV8O1V6fIYIYUzxb5XQiqUmasX/4i?=
 =?us-ascii?Q?mchuD/9DeJIbQJrGkxt9WLPB7NPzewANtmrKOQVZu8vUjWkKAGP/gk6Ntqjv?=
 =?us-ascii?Q?lUd+t/1eMIZKUYwnn34dTbZObkD0caGQLgrw4aQ377eZuUyAcHjx8rszxPOR?=
 =?us-ascii?Q?9x9IlnhUiFjii68tLHdlBtKGgz8XyuCbslVn+Sc96j1tKWXBMSKk79OvIKhr?=
 =?us-ascii?Q?fiKf0vcdY/9WwlJecI6JMRLvoCN9c2/D5iFBX8wuP5je907anCU9dEbQYFrI?=
 =?us-ascii?Q?EGsB5JfDLaSklGeyvAiWzxO3Bx6oUlrREKTSRdOT2iReudwCCzZlfZpmwTKm?=
 =?us-ascii?Q?f1l4EI8bcOL4C0NcWQEI6w/+Omvl0b6m6rwd1RJzzM1cYs/VIvJu+mbiiWQp?=
 =?us-ascii?Q?P+6fGrFTVbAb0Jk+VEQ4cZwmxPxrILbdUyyo9dV2xZ7j3SzNjBftvvp3m+JS?=
 =?us-ascii?Q?rs8aSjVKbHxHZJRmj1Syifgypz5ZKlMOmW8/JaGe34me8cjpUvwv+XthjHkH?=
 =?us-ascii?Q?FPRtp00xJWcIaJtudqnT7aCf5IHyaXj7/nVozJNB7kODMKs0bB7R0s49aMCS?=
 =?us-ascii?Q?qLiDPsSt+UxKuWEhvhmw76+B6Qg0ZrLJBi8QwFNzl/H285yp1T9yc4CozvME?=
 =?us-ascii?Q?1z8R2kqtxfSJij/PLEpDcDJq/mgJdXbGZnznK6s3HwTR6TsiyELV6mAtbepQ?=
 =?us-ascii?Q?R62TqceRX6L/uvOgs89o6Q1HyDxmwPf18LCYTEy6bOgDo5wLYvOad15WyKpH?=
 =?us-ascii?Q?GYgrC9WRdbdR4mqwXkaUkWeCbk9cqub0LoVtJK3BiwkACsdQRNuu30Uft87d?=
 =?us-ascii?Q?WxF2s6JanAv3ZcjpM6zZbEZRfVYbyBYNumPcf6OisIn0ebYtGjx122WAtHxv?=
 =?us-ascii?Q?8XP05m1JxVn7TNKPOqu6awyEi46Slq9kLq1Hkd0It15P98TTqh9ZhQXDoXxl?=
 =?us-ascii?Q?Ag3e6THvR5UgYoQb4G+0sqw/2mCuJM2UTUhM6Hnp7ew2ad60F8Act6vhJe2O?=
 =?us-ascii?Q?e1X5xc3i73d4ceANCUJ40hR+n0x/gafKJgrJEkK9c4bsn84v5tiqd491v0ti?=
 =?us-ascii?Q?IwBq+EhOJSatZPLBU3SLnZH1cCJMCHWq6sFWdjmILwygYnfYIDjHVD3Awt2q?=
 =?us-ascii?Q?gj5ocLlMYxnT9/NTSXIIcQuC5q0+bClrnCtunQc1jrNoqTCX+ClDZOrd9Rxn?=
 =?us-ascii?Q?TbjETCmfnmjEGQeoK+A3KFHWG9TXQ1JSOfTsPqRx/7NZ6vU8pqmxLJrZMdms?=
 =?us-ascii?Q?P3DhgPMZP9y/N1bQegftj4VQgdx1UDG2rmKVK9pIYfLIIsDQdG3l8XdTcMxK?=
 =?us-ascii?Q?efANSzjZnjT3AAT6QZwik9aBGkizO2+wWlnb++Z28vGOhThmdNkIKPHNhxOn?=
 =?us-ascii?Q?XpAIQd3oIFi5szx134SpyDYsjbTzeBZVQ2rvg2TZmPh6ARLOc6x6g8W7+Mc8?=
 =?us-ascii?Q?e453rrUirvp0UXlo2I7+uTF7tYKUPzl3Bu9QpKXFXStT+u8Orv80w26+iUxM?=
 =?us-ascii?Q?UeCAja2D2fpmNVt1cxuvHMiwM1CHQKeQWJgFzm7HHr6sflj4uuqnuc2beQDb?=
 =?us-ascii?Q?X3dh0xMsuGvowQ8lmzVxl6JZgTL1PwsRuF5SkR+NO/BoB8B05CYvsiTd3uWH?=
 =?us-ascii?Q?tIuEEn+aSXffmaiSmy7C3t2ZnCvNJQvEs+wczPEewayt4/aU+gsdzjkYJc5r?=
 =?us-ascii?Q?lKhyX11Rmxs2lba4ilQvt0CnIKcpnTEW6acvfWnWqA83AGgX9vv5Qv9CW6HI?=
 =?us-ascii?Q?GoKCfsY6BE4gwi2mnbqF1dYW3+6oBHWrfCAk3LE7zheWaBpl0F3U?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2814f493-0c57-4e77-1ea3-08de79b6a1c0
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:24:03.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNtm7qya6QF0Kvk2dQSOy/oza1PeGAiZeYlKj0To3stZ0N02rZYEmWP1TtkrT+tagAe63GTVCbjepsGASIK/Nye2pdErcqCbuTnSD9fMecX9Noz1GYxQsJwddIrakc14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17519

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra210_admaif.c | 6 +++---
 sound/soc/tegra/tegra_pcm.c       | 6 +++---
 sound/soc/tegra/tegra_pcm.h       | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 0976779d29f28..ecb0955266628 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -839,7 +839,7 @@ static struct snd_kcontrol_new tegra264_admaif_controls[] = {
 static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 	.controls		= tegra210_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
-	.pcm_construct		= tegra_pcm_construct,
+	.pcm_new		= tegra_pcm_new,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
@@ -849,7 +849,7 @@ static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
 	.controls		= tegra186_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra186_admaif_controls),
-	.pcm_construct		= tegra_pcm_construct,
+	.pcm_new		= tegra_pcm_new,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
@@ -859,7 +859,7 @@ static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
 static const struct snd_soc_component_driver tegra264_admaif_cmpnt = {
 	.controls		= tegra264_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra264_admaif_controls),
-	.pcm_construct		= tegra_pcm_construct,
+	.pcm_new		= tegra_pcm_new,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 05d59e03b1c5e..c490a9e668586 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -204,8 +204,8 @@ static int tegra_pcm_dma_allocate(struct device *dev, struct snd_soc_pcm_runtime
 	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC, dev, size);
 }
 
-int tegra_pcm_construct(struct snd_soc_component *component,
-			struct snd_soc_pcm_runtime *rtd)
+int tegra_pcm_new(struct snd_soc_component *component,
+		  struct snd_soc_pcm_runtime *rtd)
 {
 	struct device *dev = component->dev;
 
@@ -218,7 +218,7 @@ int tegra_pcm_construct(struct snd_soc_component *component,
 
 	return tegra_pcm_dma_allocate(dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
 }
-EXPORT_SYMBOL_GPL(tegra_pcm_construct);
+EXPORT_SYMBOL_GPL(tegra_pcm_new);
 
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index 2a36eea1740dd..ad69ca9233da0 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -20,8 +20,8 @@
 #include <sound/dmaengine_pcm.h>
 #include <sound/asound.h>
 
-int tegra_pcm_construct(struct snd_soc_component *component,
-			struct snd_soc_pcm_runtime *rtd);
+int tegra_pcm_new(struct snd_soc_component *component,
+		  struct snd_soc_pcm_runtime *rtd);
 int tegra_pcm_open(struct snd_soc_component *component,
 		   struct snd_pcm_substream *substream);
 int tegra_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

