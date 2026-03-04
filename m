Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70D30F924
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605365; cv=fail; b=ef5gu4Zv5b+S62RtZno5njxkNihWAtKgLDW4rAWd52rAHkN+WtltwP3lZpq7PHZNVk8NNYb5sUuPM8b0T9x5zzM0HprjusfF6VSM7KWwhutgBglXJ3qPhElwNNeA/5N9zzI9WqP/WzW+lsfZukm0sIQVVVNJRvbN1w99T/0bHHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605365; c=relaxed/simple;
	bh=wXR2dTGcQNU18ZFOljiWWTIYT4QqRWsRFKPp5lMTWyg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ttGWFCAyURyUpHb/tQZqXVmZw0APZ5U+UvuXbqdLWK89r12QdetfFsxrfsjHnSHDMCag+c94By69d7PmRJBI0VX1oUE4rLcjHtIofzNw/GBAirN3BwtKdOuULgUKjqhc1WNAlPTDBjuY/oMCYNoH3aEWpGLFJjFZH/o2RnZp4dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZJL8dsFo; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZJL8dsFo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmihQ73sXma84YMLrI0HJiK4Aj9bpVG2jYONfQTifTGhc+R+fpyJueLePcgRz9bPjD/gMV7acn8iG2EtChjwwIPc0/Q7QZZIQHaS9gENuRtui8qxAFn3jCaFh+croMekSOP4meCWo2uYuY5TcleO3Tgdy1Q8aQvorzCtpo1Pa/OCSRj/j9rDz/5SD2QRYh9oABPzRumFzqJsKyets2VKAMpdyhxcioAgAj3xgBhQdiCsX41edkSML8v+DatSOmhzO3w5253aoQnkR5pAYT4+fjry6lrUfbOvfdpK0bAip4Lz17JdxnyhcaIDzfJTmr/7M+vvbZ1AHq8IurfWUOrz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arAGbQXx1vt0sOdblogjSzM1JjhXZbhkT87OVJhiWEg=;
 b=MidUuKCdai7l45lOxZGJhXpCnTjil0BvaDCPJp/1a5U80BRxjvL0kQnEraixNW8DDos1uaOuz3uSjukYjRTU35D8UWtVnfrhXDaIah7nGZidOwuwEHCHAG1zOqKcypimwtUPlsoQwNN9tQgakesL0hdqsbT8nUCDo2pIeDH+iz1Bt/WwvXPhDqAMh2FZlich6Y0ujZSeIo4qefDRWL3Gql2stL8OtQjIiOs1SVm6udpuKsqXpTae7Zd38AamLd2FQ32N5/nH1F673Ohyvh33ZdtesHprFgLO3jmfbIDMGkX9vrQ5ot0eFzDHkHDsK9n1GZjtABaKszPjSfdI7QnRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arAGbQXx1vt0sOdblogjSzM1JjhXZbhkT87OVJhiWEg=;
 b=ZJL8dsFoo4/Li7lgeSKXdLcbvR+Nnn0wCy7ZVXD/aQzx8ViwnQTEXTvrafkj+q4pWWyUlFotlXDzlOt/DBi+epxVu2dMh15MomR+6+5Dy4WaJaYHK5mn57kRB4AwOSdcn0towKoLl5Kr4h9utTIN4QTUWdswTtxzg7lEgU5znBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:40 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:40 +0000
Message-ID: <87seagp100.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/29] ASoC: amd: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:40 +0000
X-ClientProxiedBy: OSAPR01CA0365.jpnprd01.prod.outlook.com
 (2603:1096:604:35::17) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: b3589d93-cac8-4610-ff99-08de79b67004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	UutX6a4KbSIES901/KRFu8IykLUG+yCrMvQOaWPl65EAYLZDCDqRuF2Fm8O8JIzNo2vmGOq6bhx4Qw9UGYXpkP1e/4V4MdpoFy/+ZQXd6gj/gafEzyJjcksvK14NQAl9nAnvPZtnO3JNGmigzqloJK9f8M5Dwt2L7lGx1+OeNc9ixdbLiUiwLpVUiZSRd5yyoRanG7koZ8cqmKvbUJHmYHPFGsS9Detu8BYhOvmFU3ETRyZvXfrl6peKNn/wldw0xTnvP8lz7lKHpTgQGzBa65zF1saYU8ezyG7RcW6kndG45ozJsGem+7S97t8L1X1YypqReXCORINAS4ILbxnjRwOHW9od4uS5XP+5sF9Is8onBjfKLFOz7y8PgR4NZtrcTXg7Htx1QrKWbmGDEj2QRzf7RztQ2mRkKNSSSefCglR4TTgfw/cphUV6ByQtiJLnVsTwJfTSbtcav9V8N9ScKL7/kWtUI3lCGzLTNzKjLScRR9LeyRN3rrOh6x6DpyJ8HYckXvacnHefBvcIG3TK+l9uWu8fq8+bGunlG3Tg62fT9yueQhAvWX2u6SkqJeuxX5i+FgXHkpqQ1KOs7MyCy5+alVHHBG5g0lVjjR9JRgke9J+V7BmBMUeAf71Gfx6uN+KCLKsPiIDhChTeCthzliKvz0hyRsC7+GoGM97Vx3vsYueQ8SUaEKtD4hq/Cr+ujSdQ+L7nmPK5AMZexL/0FjIZJ8jq2t4bpZjFpjgwqHc8m4sXHcZfEEhteB4QyNyXpL1uw+ARHTCsbTeAH6UCyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?47E0snDaROQ0DvdcoZpSFeq5hVi4P+q/YO0zaaZqpZ6no/H1YDNt2CJ2BokO?=
 =?us-ascii?Q?3c3jJI66/Ar3cBGcKIG5lCP2tx5e9Ebvoo/Eh9GwG192A4sNT5XTmhjSFkmQ?=
 =?us-ascii?Q?ahvetf3jAv4wcqk1t4XdZO52xC6hYJjIEBx3l6bGUyF1XUoL4AK/Xlow/wCv?=
 =?us-ascii?Q?aC+tiDWksNT2oCpeVHb4HUynar1BZEGy8p+ayCbrye5TnUCjkt1iXyitkLsU?=
 =?us-ascii?Q?rqXT65OpEwZ0qrLmAN+m/LdBKox1TTt16+MiJWkqP+7eTA33IfRu4tODnThb?=
 =?us-ascii?Q?trQfZKptlwScTb4Py4gSfe5y/0775opPOuEMptE3NM5giB0GPB0UJqSo1V8Q?=
 =?us-ascii?Q?x7TzR7HKND2elf1aanUf/07FXCzF6/vJ3Y//Qzkb8GI0IFVUm7pGov7JYGD+?=
 =?us-ascii?Q?rWew8KFzWIWt38/S/Dm5qQatcV6MSZCltv1lxww+Jx+cT/RXBAmbjHY1GX+D?=
 =?us-ascii?Q?o6dejfYd4l0b0muifNAkf3XTjCItcHQbeu3X9XdYCN63P9xKrPMAhHNPmPmX?=
 =?us-ascii?Q?aX+X8D9pPmaceZFQNIX+cGiDeWF14fCF+tcpRu+j56VfrbqyNH8Wh16r4qPh?=
 =?us-ascii?Q?MTklcIlY3EGJM5023RaMhmV2ez6kjTH09HnGrXdhI55mrzcfHX1xgvYucV2Q?=
 =?us-ascii?Q?VK9+mPxAAy40l23/TMjp0JFEoxkNu7Y+j5EAjZpc49FdHJEvrqjr3TcTUZXK?=
 =?us-ascii?Q?Qlpaiez4rd9Vo6GfewFCz9rDM1OImXLK5ouz1eTwfLWpE8v5/yw/pdoZGpCK?=
 =?us-ascii?Q?3ldx1mMu0jnxZo3q+YPAj2J86rIjXjpczlhMIa8WRwZsHzgt4L9Auhc9IP6b?=
 =?us-ascii?Q?aWrF829upGU81B5V4wwXHmK0TQeC4QtzhTTNWaB4QiWAkZXKaXuNsukwT/g6?=
 =?us-ascii?Q?HlXuvBWepLjHkGRh+Riet89WoTWfyt1YYe/xLvS2vAOZRf0P6jzZ9cWcBWoI?=
 =?us-ascii?Q?1iYWuI23CFpvAifVAPvVEkc5+FseZke+Jo7JKJJl/Gmp14ciQMeS1mkIyPTX?=
 =?us-ascii?Q?uaS8jRLeJXVV1nKOwDspgzCzyRofcS4tgzwJQCwqfvbt90u7Tiw6gNQvj4tP?=
 =?us-ascii?Q?QngkdS/D3Oe0z95OH4uqCc3CCXRi6rFgqTOqjk4UriXWmfwxo/LCXNVEvbj1?=
 =?us-ascii?Q?/MAy0h2CF4Dlqtz3Tc0dcmLhnkXSqXrZCx4hDQ3i+0UUq4FvBL9kh78JiqqN?=
 =?us-ascii?Q?HnUlvG/Xw7yZH3AUlYc13Mw2UQaaCQu/LjwnYmygAwPj4pb2sVELO9EySuYn?=
 =?us-ascii?Q?LeWzCuNeK8/wj5hmGvOyNQnHqVJ0rx4pw2CYCwebOsNna9nmgbKuIPs9AArs?=
 =?us-ascii?Q?fmSbIg5PC79nOTBS4kW1FzkrOte83fcrDyA1tV5/odGjNPSwUSR4cAoWe3QX?=
 =?us-ascii?Q?6tCR9wvFa0ZhoAzC646j9SaRi+qI5dtAtilOkzGezpU+F4kjA5Popdtm7XgV?=
 =?us-ascii?Q?QV3dBNBZjw34fh/QwAkg2/qoRnGbNbRreBtN+XaWwtov/PrsgL9vd5hZWS8e?=
 =?us-ascii?Q?aMBAw4Qf/JUPdTjOOYp8+F5msFKdat+NRoZuvWLXJdCf9Xm8EkAa9VdgqinW?=
 =?us-ascii?Q?/ba05uO0XAJzLiWDSPPkzbq3xnPWjZaqj/6p3WajiPo0pPL+TthhwUbiL/7f?=
 =?us-ascii?Q?Adkn8pXsy0ZPF0CHiRjUwdjUzG4CHHAHDbZkU/54p08jwKBVirKhDpze/gHV?=
 =?us-ascii?Q?KHRmpyH6+I1A42gTzKUD55hDtarI9xK63TRYlutUAb4YtFBOTMakyOPLvv6H?=
 =?us-ascii?Q?XJYZV+GlyDQTZs0uc3bw5VJTlEBeaCySm5sLQcqiSuQefmMok8qB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3589d93-cac8-4610-ff99-08de79b67004
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:40.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qyz/TIBY+UQ62ORHW16Smj07L/7+cAxDKFHoJI/fva+nOE55L8aSmOqKuD4lySTTKdolJr6B2/KQjgdpY0osOK740XIYdiZ5ZRkrp/X0qK/wmAaotpuqnLVgf3PFqEZ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops fromcomponent driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-pcm-dma.c           | 2 +-
 sound/soc/amd/acp/acp-platform.c      | 2 +-
 sound/soc/amd/ps/ps-pdm-dma.c         | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c         | 2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c   | 2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c  | 2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index c76a4bcc96459..6ad70aa0ea837 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1252,7 +1252,7 @@ static const struct snd_soc_component_driver acp_asoc_platform = {
 	.pointer	= acp_dma_pointer,
 	.delay		= acp_dma_delay,
 	.prepare	= acp_dma_prepare,
-	.pcm_construct	= acp_dma_new,
+	.pcm_new	= acp_dma_new,
 };
 
 static int acp_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 88613569fd64f..6b1e18b31c1c6 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -321,7 +321,7 @@ static const struct snd_soc_component_driver acp_pcm_component = {
 	.close			= acp_dma_close,
 	.hw_params		= acp_dma_hw_params,
 	.pointer		= acp_dma_pointer,
-	.pcm_construct		= acp_dma_new,
+	.pcm_new		= acp_dma_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 7c529fc6ba997..c6cd844d458c8 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -351,7 +351,7 @@ static const struct snd_soc_component_driver acp63_pdm_component = {
 	.close		= acp63_pdm_dma_close,
 	.hw_params	= acp63_pdm_dma_hw_params,
 	.pointer	= acp63_pdm_dma_pointer,
-	.pcm_construct	= acp63_pdm_dma_new,
+	.pcm_new	= acp63_pdm_dma_new,
 };
 
 static int acp63_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 366d7c4bb07e9..f27ebbd213798 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -634,7 +634,7 @@ static const struct snd_soc_component_driver acp63_sdw_component = {
 	.hw_params	= acp63_sdw_dma_hw_params,
 	.trigger	= acp63_sdw_dma_trigger,
 	.pointer	= acp63_sdw_dma_pointer,
-	.pcm_construct	= acp63_sdw_dma_new,
+	.pcm_new	= acp63_sdw_dma_new,
 	.use_dai_pcm_id = true,
 
 };
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 4529404ebd935..37ea5c572eb94 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -363,7 +363,7 @@ static const struct snd_soc_component_driver acp3x_i2s_component = {
 	.close		= acp3x_dma_close,
 	.hw_params	= acp3x_dma_hw_params,
 	.pointer	= acp3x_dma_pointer,
-	.pcm_construct	= acp3x_dma_new,
+	.pcm_new	= acp3x_dma_new,
 };
 
 static int acp3x_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index e832c7c4b96fa..e60e3821703cc 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -376,7 +376,7 @@ static const struct snd_soc_component_driver acp_pdm_component = {
 	.close			= acp_pdm_dma_close,
 	.hw_params		= acp_pdm_dma_hw_params,
 	.pointer		= acp_pdm_dma_pointer,
-	.pcm_construct		= acp_pdm_dma_new,
+	.pcm_new		= acp_pdm_dma_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 6ce82cd8859b8..831e30e9b0426 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -357,7 +357,7 @@ static const struct snd_soc_component_driver acp5x_i2s_component = {
 	.close		= acp5x_dma_close,
 	.hw_params	= acp5x_dma_hw_params,
 	.pointer	= acp5x_dma_pointer,
-	.pcm_construct	= acp5x_dma_new,
+	.pcm_new	= acp5x_dma_new,
 };
 
 static int acp5x_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 1c8aad8499164..710db721ffa48 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -346,7 +346,7 @@ static const struct snd_soc_component_driver acp6x_pdm_component = {
 	.close			= acp6x_pdm_dma_close,
 	.hw_params		= acp6x_pdm_dma_hw_params,
 	.pointer		= acp6x_pdm_dma_pointer,
-	.pcm_construct		= acp6x_pdm_dma_new,
+	.pcm_new		= acp6x_pdm_dma_new,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

