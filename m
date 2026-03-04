Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795937FF53
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605395; cv=fail; b=KU584SJgepfcyKp7xqRS7uZWw7u+llVhPuGdq0UlvblOjBL8O4UEScGpiD/9F4BsDwT0n8EFiegqChkFbIv9iio38UnsDEFLFqVYc6BJSeIPJeXGxp+LCmPb97ElxOUIA2VyNM8iqiYe8RHXC8iEFBVIWGAbx1BD4ks4Rb7yvr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605395; c=relaxed/simple;
	bh=iP90qlvjvO/eOgqbo0b19xafuv5LY8xXv2d9WkIN+I0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TEcUMnkoS6/CNw7M70OjNNDK8CXPqXrdkLUeJdHzGbUD9mHjqUU1HXr8FRF1DOy2/vAgYHkBGXz+d4BQ0r4ZLCb4IEPB13HJyuNMy5PRJdonEhNbEUjFTVsp6IWrzdWJwhYhTD2lgTYr/PYOg2Z3+aefqdds5LVyryZgRY1O0KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TDJup/US; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TDJup/US"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWMjlYetOmLPwNHxRY5/bjE/2rDzCm31HD1590a8J1mdiMuqRl7OtVgCt5ojvKGZIoymejlAoZnRHL7r608CO6ADOh4gvI0latfXu9owBZyn+2ZxZ6QFro1LfxF/YLdF+Zpd49VwMZpOeBuFeMhj4wqDVhfHtuUZN+asfz0aINpjyRnW7ZKvlWcS3PD4BK1+gc9NXakyIvvmzBTtnyj/fPn0xu96+cQgth2QgXHnvrjfx/DBQBOu6+3TqNeaJv/zW3DughwNn1w+zsyacVdLCDtxpLrjxnIHFbkRmIsHYvWHFlPNbUa5XH0MXANXSAeor1JIMU2VBkjF8grBAESdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow4BqyNYhcHZnq2wMhup+3gom/ZrhBWOBBtkaoEXUps=;
 b=p9WzKojxeiH7hyczqcNxZMdeULOsf3LRVul0FYkwkzPD0Xv226FIUySvpvzFeYTUcw4qROgs7KzIZ002CLgDX9QrKBDvgPFPbX8/Z4t678M0enOqqwhkFT89zgzluIm39bkT4Zs98gZzNZJ8m9A5XCgeCpFaXYcVzV2qzjMWAVgmQtarkAAKxfegNkgn5fGeO+BqOtdPk9CqW5oQv8NKNZsX3HO6WMccsng5bdMrPYKwxunpYxr0xksdhjH4loyhDaI+un7/FxjKMQCZ1925L0ypjJqZEh8pjLa79/ppQMCZ2ctx+PkCYIq8bGz6by52T0NEuuH+m3w/ewrulmARDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow4BqyNYhcHZnq2wMhup+3gom/ZrhBWOBBtkaoEXUps=;
 b=TDJup/USN+D8EvFn+9NU/PY6qdfGef0gsIONCpsrDaO2XYOGyDN5oxsWxGbf699xDMmbVjU37/ttSErjJ/O7AU+dRGpVISIZywxgm/8ZgYF4YWG6SzYGtdEYuBwwH8J3V5clMQmRzMCyWj+Ra52hPY6k/4Jj9IT6sO7YIT/kEgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:12 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:12 +0000
Message-ID: <87h5qwp0z4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/29] ASoC: fsl: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:12 +0000
X-ClientProxiedBy: OS7P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd47557-ce48-4fcc-d41e-08de79b682fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	hqirYontPFixF/Y7dEt1r60OmqiFdWWIkuwy9isgZ0WkPXto4ovmCJDGFK0wrpgV8wlgQLPYNJPtWbxCfySJd0L++Fj+pxlSjMrri44viHKUYtkgmJncuMOshHhW4P1riJJAH85r6BcsEaHZHIURuzfxlwzh+H2bKWa7AxS/FbB8dclRqclrN9ckOiqB3LTqlUiHQ8PXnudTXz0NP4NtoqIKH64xDk7rVGjX/FqLRIrxmmA5OLtv4Q/SVpfe9PMjpz7tyUwqCRsPg8naGneXdkFrsjuBWmcZt8IEF0ov9byUUyGS+qqjz69rrYrcMpcU8D1faZImQpArNxA+CDKSG5SFsuHgiNmqwNQcS+fzwHuvejxDD+6KtJUt9GBSs2EzzniWzcmO5x54nfSgZx/iJ7KffpWyOgqZMX+fc8JY1LsmzhCqXZlv3IZQ7yE7uFLp2qtOeJAGwKlC2EeafVBSn34An1WoQF8WaU6Nkpl6VaV9aW//CRDZv6xhnckSa2WK4RPl7ecDHWQhQ2lKxx+mygpK2H5Yusq5UVL4UOdGvUZ4qkAgz9N01wS167le3RaKREjZJ7iYsnOzFcTsyAx3cFGTFifzzyDs2STZ2ZSEBvavyVvaQplA/lko5JvMkLjdf1KUXQBmL7F8pqVVVQ2WmAaM0EviuW0lwIG1ghD9b2q0Q3F7oVyvd662skzstr3QhG4CZ6/SzvvOzUrvBVY80CqdPdgp6vI6mH45QkS62LsFXIyrhg/YQsdBQnqxluHD5CH+lWO/Cb32JIS2tSk7iKmdsqz8UGlS0XJ3rqa8/wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txmeMVwHLAoDGkW8IlbYG3ErL9R2taObNv5hiZCx5OTeb5wOfCYjxlrOlXjg?=
 =?us-ascii?Q?MwYDJr6sMdmAKFfyEnZ7bM6auXargh5LcKckmDaiKtuqtAxWplyQEzGhJ3vD?=
 =?us-ascii?Q?tuCsfAPaEyxVHWTFcAgLDIazitcBHS1ts4v9rW2xfZLCcwymWVGxIsmP39G4?=
 =?us-ascii?Q?5dU7geugFQKMUP8/AmolG6vC3OJOcBsIcFfOwHwtgXGaqNu+riM6lNUKjx9q?=
 =?us-ascii?Q?Oak63GcMQ8vbxUtifEtrF3bZGYb5F8pc0aK7WwaWs5w2/rwLM3S7OWJXNEsp?=
 =?us-ascii?Q?8n12655JTOKMPY57qAaWJEFEXAu+xWMFes2tnAqfvoVmuv7lBC9T6hrttUEG?=
 =?us-ascii?Q?YiQIvC9wBLYuoqdyLteTO+lT6dK99EvKrMhpJQgz/L1ysjxRUf6kRVhh8fvF?=
 =?us-ascii?Q?HDMHVFrefdBvctKwcMVw3vkHnqAqzw1bePL2df87o4UJpr9bYqPjBh2UQRYV?=
 =?us-ascii?Q?Y71GgPbK2pfasAxVAxgwu6q8W2FQcTHCf9Mye4wxdgQNIOTR2c1CuIjb7x7c?=
 =?us-ascii?Q?XAThynP+IdDKCH5hFE15qc0xhDxT/u4GgweJGBZlVAoqP4qfHwGjiPdLBonu?=
 =?us-ascii?Q?czdJzarBKQj5oYFWB1K14LkzjOjjQyLiTvHkZSjVdMZg/wKBVKH/x+Aclwtj?=
 =?us-ascii?Q?OcBlBjeeo1RGNwrSlRTsvKXeJXxMRUPF+jJuPXoF1VDepA3/hWTR48t28En5?=
 =?us-ascii?Q?Fyd2UyOx8KiJUZO3O8qkVaY5g65w1SYK/qUV2iiggQH57kXzk6LpBWiVQTFw?=
 =?us-ascii?Q?x18748T7+vYfAdDo47T80iL0cUiTCWQlwQ1nF1CRSpqldCv7bJgW4ckJbR/o?=
 =?us-ascii?Q?Ox/Gd8FzWYMwktfmzPSEkss3sFOHBXps6jvibVu+VPv8Ym5XY2NUZ/xfZ2AL?=
 =?us-ascii?Q?Xe241eM9Otd6hYk3vCgc3TG8AFGeiFrEuiGxR3sBD85PIff5B6FkDdrED3CN?=
 =?us-ascii?Q?oWqBZTy/uTVy3gaZIO/P0M3mhZmPkf6fx7FnU01k+8mgtM6GZodFcFY1phkU?=
 =?us-ascii?Q?AdPTqyujo0hwUGlxAYjFRoCCr2u19pCVJU18ZXvBtl5/3ZbQNndu+IUvWE7W?=
 =?us-ascii?Q?wakYLr6hg2KxvLX82zStbcOUxskDtEoU0AdnLpkJ8z6ZqlVes/U0ZZA9FV4k?=
 =?us-ascii?Q?dWSysOG6sw3lSzXqbpN6MpjXPAgpFW0Gc6IXU5eN3rDY+ODsygO3lwF68UiB?=
 =?us-ascii?Q?LljXtBao0XRHfxAf9QQ8ei3fYGToWt92uGZtUcga9pB6qrPaif0uBqdWopqR?=
 =?us-ascii?Q?bkx2iYxX5FhiA5ZkL7l4IO0qAqiPR0rl+7PHxJMnPN072Ro+29XQ4YSVVBCP?=
 =?us-ascii?Q?5QticGI4Ot6/LX9Bi/fsHSUDBg1XXuQ+XWEqlmArekeiDlsZotUSoXP+98Dm?=
 =?us-ascii?Q?sBOyyWIhXS7NzQqnMqgcVg1tNe+MQRdUx3VTNacaWAWUWaC9W+qM90z81M7B?=
 =?us-ascii?Q?On2W3uX0clYoE+plC9Ncna6ruAuhgphNCbduyPL9gekzOXww4c+IVswvKcAE?=
 =?us-ascii?Q?7DqImk0GeCj1OFRjgohVGh6KhKqqRXe0hx05Bgoepmb41jVExqq1XXuuyOSw?=
 =?us-ascii?Q?iViRHnUuDvDfkFlehtwtgsAfIKtfX0yoiXfhRcqQK7CfihcrQWEf0c02OqQ7?=
 =?us-ascii?Q?MH+YrH9DGiWHpbyLCqzMDjcnO179bY/4PwoWc8YjRf6MyE8dWBPhSL8iKuTF?=
 =?us-ascii?Q?uENS8WCJSUHg4979mvUOU04LLGPtJtc9DMUTEZedl2mwBOpNTKvuvc+1n+qe?=
 =?us-ascii?Q?Dh81truvA5ONwyBW8AHEaieNra3LnAvcJUvUHPCh6OrSxNptp0pU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd47557-ce48-4fcc-d41e-08de79b682fd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:12.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cKEFcYIlT7YuCDSFIBB43x36Zj0Rp+1TElciv1gFIpNr8eIZiT64/O8lYF2A476o4CT90t8SUqCGO4NZmSZcyHgUHZTeNO9Y6JufzCQQXj31BVregkITT6eozwvZlPU
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
 sound/soc/fsl/fsl_asrc_dma.c  | 2 +-
 sound/soc/fsl/fsl_dma.c       | 2 +-
 sound/soc/fsl/fsl_qmc_audio.c | 6 +++---
 sound/soc/fsl/imx-pcm-fiq.c   | 4 ++--
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 sound/soc/fsl/mpc5200_dma.c   | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 348b0aabfa683..5aa96af994c41 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -505,7 +505,7 @@ struct snd_soc_component_driver fsl_asrc_component = {
 	.open		= fsl_asrc_dma_startup,
 	.close		= fsl_asrc_dma_shutdown,
 	.pointer	= fsl_asrc_dma_pcm_pointer,
-	.pcm_construct	= fsl_asrc_dma_pcm_new,
+	.pcm_new	= fsl_asrc_dma_pcm_new,
 	.legacy_dai_naming = 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix	= "asrc",
diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 26ddbe867b581..b120b3514fbec 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -860,7 +860,7 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	dma->dai.hw_params = fsl_dma_hw_params;
 	dma->dai.hw_free = fsl_dma_hw_free;
 	dma->dai.pointer = fsl_dma_pointer;
-	dma->dai.pcm_construct = fsl_dma_new;
+	dma->dai.pcm_new = fsl_dma_new;
 
 	/* Store the SSI-specific information that we need */
 	dma->ssi_stx_phys = res.start + REG_SSI_STX0;
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 43d401ae2d03e..76e014dfb6d7b 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -54,8 +54,8 @@ struct qmc_dai_prtd {
 	struct snd_pcm_substream *substream;
 };
 
-static int qmc_audio_pcm_construct(struct snd_soc_component *component,
-				   struct snd_soc_pcm_runtime *rtd)
+static int qmc_audio_pcm_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	int ret;
@@ -340,7 +340,7 @@ static const struct snd_soc_component_driver qmc_audio_soc_platform = {
 	.hw_params		= qmc_audio_pcm_hw_params,
 	.trigger		= qmc_audio_pcm_trigger,
 	.pointer		= qmc_audio_pcm_pointer,
-	.pcm_construct		= qmc_audio_pcm_construct,
+	.pcm_new		= qmc_audio_pcm_new,
 	.of_xlate_dai_name	= qmc_audio_of_xlate_dai_name,
 };
 
diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index d51a3de493cb5..e0fb4f8fd5228 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -273,8 +273,8 @@ static const struct snd_soc_component_driver imx_soc_component_fiq = {
 	.prepare	= snd_imx_pcm_prepare,
 	.trigger	= snd_imx_pcm_trigger,
 	.pointer	= snd_imx_pcm_pointer,
-	.pcm_construct	= snd_imx_pcm_new,
-	.pcm_destruct	= snd_imx_pcm_free,
+	.pcm_new	= snd_imx_pcm_new,
+	.pcm_free	= snd_imx_pcm_free,
 };
 
 int imx_pcm_fiq_init(struct platform_device *pdev,
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index edab68ae83665..031e5272215d4 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -624,7 +624,7 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
 	.name		= IMX_PCM_DRV_NAME,
-	.pcm_construct	= imx_rpmsg_pcm_new,
+	.pcm_new	= imx_rpmsg_pcm_new,
 	.open		= imx_rpmsg_pcm_open,
 	.close		= imx_rpmsg_pcm_close,
 	.hw_params	= imx_rpmsg_pcm_hw_params,
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index a593a95aa532e..ee4fb5c932cae 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -307,7 +307,7 @@ static const struct snd_soc_component_driver mpc5200_audio_dma_component = {
 	.close		= psc_dma_close,
 	.pointer	= psc_dma_pointer,
 	.trigger	= psc_dma_trigger,
-	.pcm_construct	= psc_dma_new,
+	.pcm_new	= psc_dma_new,
 };
 
 int mpc5200_audio_dma_create(struct platform_device *op)
-- 
2.43.0

