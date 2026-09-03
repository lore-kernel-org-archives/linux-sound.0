Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF261A2C0B
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398004; cv=fail; b=SEgcrgzuh3xuj3vb/WueDPBq6RcGCGlix4nc14ATMnprArcHddHhYmiU0bDsZrjxrs0Vs3Z2fMNRUzevhPIPqHBYDvoMkoCoOGzmvWBSJYPsi8uu4lD5XZ9GFy0z0XAwbNp+KHtMWRLt0LqNnV0m+QdVKUdP6E+I5pDQrZdWbh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398004; c=relaxed/simple;
	bh=dQy438mLMvGlvo/SvZ9X12qcocl6XUw+uJ2NAAWr9fg=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ElkQNMaJYczw81zJQ1nT1GKhNQVqLI0xL7J7udIPAr/KkFW7LeELA6HCeyHc7izpLfObBoVYQ/kotUOi142hnEx3/HFI2pMS/Ku7vfO8x3Ki7bXRk3AokDmq942luh5Gwbt4kuQ1czqUolU1JWhGkXa9N1wo3xYmc4u1+pb64gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IGfIKems; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IGfIKems"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rueGMxMGhDnLwpWwoGMEAhpqAqu+qY0UBTxaJEzZ7z73P9NEYaolwzyV5Atyvyw99f0NSDzdVvvhvb+Y1IkFYXLAt7jY+pMlBLf3wbfFDeQWOe92UyxUnluj/YRI8YjJBuIoh6A1FmkZDpN69SdTDVrltNRwTD/697H+/X0bPYCRNTrBSHrOLOSf6YnYnLMgK9eg0PEuKN6bidL8QISk94mZ969hL9aWNq3wx35x9JoD/9R6xoKO4E06toHPEkQr/kGs2YK3KGUZJNosafz1C44cfcM26wa7C8OTxoEpQgxoBAVwgP/Q0g3sa4EODSzLPaQo/xpY8kzhqnopkfv+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdCIYc/EIbYzRXr+LU5+MN2o9gHSOXH/hGFZV2LYJYA=;
 b=O6xI8H/dSV2KGj9cu1vy51+9+k04LcHf3s18lpN+mPQT92TmCxPY7R5Q9gG5GH+ppXiCiz6U34nGPy6jjzqK3doVQA9Dl3XCtNQUQJjP8ID24pB/wV7OVTkXjdfGKIcqz5jPCv8QT6ZzVcs4HQb8+kADOy0+tt59PuKN5wx7AolpgZ/BakKBLTyET+hisCmJ2k+d5eT96QCLWOYyP2LsoEdjrdrblhbu2ZARJ4qtEFEdnyf7+sKMTiCTTKYLRu8QQRm+CCOg6V1SfgNernL7NPNKNJGz63kwdcX465KvqFWeTRPmp5OQ8Esmik4CrMRL+lnTgWIYWpLK4/XH5Tktwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdCIYc/EIbYzRXr+LU5+MN2o9gHSOXH/hGFZV2LYJYA=;
 b=IGfIKemsmt540YMJcWHgSPQdgEM3WsBkuZ6rDkiAJNuHTdMXZDlwURlwa/ujST5MQ2NKHe+dMMROmkeGatv/OjMq7iLf7vJo5DHM7rjs+d5QOsztDEcMGjyn0bD+sCIRpD/2csckAIqKsbO9c7R68XFR42S07ErVymLE8TJVLic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB14227.jpnprd01.prod.outlook.com
 (2603:1096:405:222::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:17 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:17 +0000
Message-ID: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/21] ASoC: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:16 +0000
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB14227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8857f3-c79a-45c5-4a29-08df095888e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|18002099003|56012099006|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	vPWy9nPtl0RqFlMQH8o0EnDpPSraTPoD4blUKSdUvfgwKOS4PujeSLDC9YkB1w8JFGYOesdNvTug3QXfiChVvQeT5tsKVvPfuf1jaNxupcWBPqTKTFyW7brcCy+amwZQjYLWxFruxU9XduDpqfXvhcrPlrHW8GT+k+Lnu/oEimv+P81VGCToAn0dWfxiX9Z59COhzT3rc4xZ7l/fQIm4UlCtaUV4nuunA0M4WOI+5k8TWmlre1877KmoGkip84SIExwPwt+XWmYFQMx/ntsePUQIM3WcSf/TKUAfno6WN6X3i18rlNXdyAZn/rO5Srd+Lm9/L3lJoifDMS0CLWSGS5OCkQIxrX0i6LXodYHZq0ZJufit1o9v7XHm6BOR0t+zTofoLZxs4lvPX/zPjjECmtor6wDiT5H12b+VzBCsz7OqBvqgHQgWb/+1YRf2AIws3NakRDXSXCDEMKVFLkUJpjwa9VzhP1iouLv6BKaw7+sYsjn9BnFbowSV2eEUjeFJ9y6EeG5YyG7A7cdPbPlrcRB6ypyF2167Gna3MClVsT0cOw0wxOQ6Tsith7SJWQ3gpERS5/HnLc4xCj4bm+QBBEseo9jjSXcKMWapTTQPVW9WCQB7eSG90y97IgQuKy1k6gb1laDFnjLqlTNEYdJ5gW0HU7PJk1uhjhpAmIDqg0Zoi60qT9pobfAIN6p5QofQQ4bPBp9cLN/N+r97bx0W646nTblhTwXXENuxEqfZF8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1euZhbYTGyZTt2QVMV5luXgf3dEKuKhr3KyK+W1IUCTj6gFKAJ4TBG5BX8ZV?=
 =?us-ascii?Q?H7zpN8CflNdNKfD/w7mEoBKXsRx+7xp68Y+6WWmxUOug0cJadIBQOmMs3jAh?=
 =?us-ascii?Q?iiHXAKHdxHKpp35yFM99ztHAb1vKXJqNFHtr83mgPujchMkE70tHDyX1Kdku?=
 =?us-ascii?Q?y2ImzJdmGaMpOCbFUxHkKnsfrbQ5/PTc4xP/icl2wTSAEMpt/he7vwBm+/SW?=
 =?us-ascii?Q?Bmk1SdvKWELNwg19Xy0JEbInQFXOxZTmrNcyLcthi8jabgfiW/aHUfhMT5rA?=
 =?us-ascii?Q?Xd7cqHjK8I1XRY8n6Sw4N0z+cRF4lhwuYtYiR6hBEZKGAVe5TlP+AoU/0vyi?=
 =?us-ascii?Q?+kq2nuhvzOWOHfZqAVUs3Gu01Kg1adb9/M3d4ulEplliwLmEZl2fGDAHjpfP?=
 =?us-ascii?Q?348IZOFt0RoFVmwhx2ABOrMhWmv/1upJE1fiP5B+I8aZETMhGCdAeBhC82eb?=
 =?us-ascii?Q?ZfCaaMaILuyh6Jt2gtrOlPVhYhxBWQSOsnjrqHIHi+4C7O8Na5N1/z02QRZN?=
 =?us-ascii?Q?UhN4PUgMpkYtRuer7mHMunIQL4h4rzgcUqSYS1txO8adVoaKW/kCBHkxH5uT?=
 =?us-ascii?Q?cZrb9JojCwbehtjQjbqn67hEMgJSJJOipQ9jBmi3oGR7Jkbv91LNzME0rOeT?=
 =?us-ascii?Q?KoNQsGXrAJw/ZohPvVnJ/CuTNggz7pHoappSSC1ApGbWL5JxB80OHCY70onU?=
 =?us-ascii?Q?okzZ9ypf6FoRt+EudVCRx1BIF3oCyeHkG4BD4RlWwoL841ami2NAMJGfgLNI?=
 =?us-ascii?Q?4AfbVzGPOXLQ30mHPr+5pw+AQVsoV45qnmmAMN7T2+nXyM+zEoq9Ossx9qFm?=
 =?us-ascii?Q?RQHeLgX9ik8C6wsdb6az9gNKmMZDnwVPkP8QQAU7NagacLIlNoDRGB7w3IGu?=
 =?us-ascii?Q?YEyLf6N0DIEg0uh9G2uXNXdBnf9phCAnhR4HTOCL5SEJ1TkxlBNQyJnqn8au?=
 =?us-ascii?Q?Oj/bduWRxjww6w8Au7n/YKb2uQUzatDfthrDszlgmrr/ZBJveAXrWK3TmH61?=
 =?us-ascii?Q?8drHZnmtiYGKKi6sEuGsxLukmvD3xZGWamyFbX6yBrqqVCUQ0lrzHvtKl/k7?=
 =?us-ascii?Q?Vs57jJilLB6cbgW+7JZ9/HKTrl5ZeIjHcNNw9ti61z17cbYfALeWBDtaJUUi?=
 =?us-ascii?Q?H6S6wRXR8qc1imH1qAKrKmtR9+WSE+Z7ZfiwwvyvabcTcRP0AjVPz5rZavrW?=
 =?us-ascii?Q?C8WW96dimd6uASV9r7fKO3sxvksRty+d19oh9tMM/WSH+CRnchMw+I4Q74ZZ?=
 =?us-ascii?Q?Nj/V0mEF+L1WS2HudQfOnnRJY9BFIJVSW5+niga/iCy7VObCINr6ZN/I2fZw?=
 =?us-ascii?Q?TwvX7dEXGCgpKXrZOJzcDqL4oK+bOKsnuBhAskW1+wjK7ZXxu/W2Zi/37ayt?=
 =?us-ascii?Q?7chnp0aGqrMWviMJuBEnEmx0+qh/QbBDxj/sZB4545WSAVtnJ3MBmFVU5M7N?=
 =?us-ascii?Q?S3JtNP5icE5vwM33qkbTn6dg4tFcGhLosjeQ3sN6WBeBjOODd/YtL0Mbx4Yr?=
 =?us-ascii?Q?RcbiILIdKtP+mvigR3hV3gOCIF09lj/4s9/cYUiApLkrC7BJV1sgKZUOYnlm?=
 =?us-ascii?Q?vOyd4DQiywD9tbxbS1A8uI8CPKr4AvtDZ9jOPBDb/NZjQTbkF/BWK8T70wQe?=
 =?us-ascii?Q?5mnDaoSX4I31ZM3Nt1IVarPY/gtLQLGh9RkFES9dTyt8w2ACZ+SfQsvRqDmX?=
 =?us-ascii?Q?RYZToMTxM3pqpkME+eQYKhcrJiazSshCPT5WC7YQ5kh0YrCLSs7+JtF1pOhM?=
 =?us-ascii?Q?dtncs9X1ekPTOoNQfZmRnVvxsUlIgx1oRkrGqXgGp8hjlLJH10Ch?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8857f3-c79a-45c5-4a29-08df095888e9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:16.9943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzlUkVS4RgKvMbjsvf1Ttv8b2NZXRKNqTKTgAg5h1okB3LHmK0WPXP/zy9EoA6Wwq6EILX1KutLfhFPnqzKutBtHWvkRftyXbUEZHHzJGf/JmRPXKnD0QLNPtdPx1fe2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14227


Hi Mark, all

I'm now posting "use .auto_selectable_formats" for Codecs.
This is "use .auto_selectable_formats" for each vendor.

o: done
y: now posting
x: this patch-set

	[o] Step1: ASoC: a to b
	[y] Step2: ASoC: codec: ...
	[x] Step3: ASoC: d to x

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's policy.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" property itself is necessary anyway.


Kuninori Morimoto (21):
  ASoC: dwc: use .auto_selectable_formats
  ASoC: fsl: use .auto_selectable_formats
  ASoC: hisilicon: use .auto_selectable_formats
  ASoC: img: use .auto_selectable_formats
  ASoC: jz4740: use .auto_selectable_formats
  ASoC: kirkwood: use .auto_selectable_formats
  ASoC: loongson: use .auto_selectable_formats
  ASoC: mediatek: use .auto_selectable_formats
  ASoC: mxs: use .auto_selectable_formats
  ASoC: pxa: use .auto_selectable_formats
  ASoC: renesas: use .auto_selectable_formats
  ASoC: rockchip: use .auto_selectable_formats
  ASoC: samsung: use .auto_selectable_formats
  ASoC: sti: use .auto_selectable_formats
  ASoC: stm: use .auto_selectable_formats
  ASoC: sunxi: use .auto_selectable_formats
  ASoC: tegra: use .auto_selectable_formats
  ASoC: ti: use .auto_selectable_formats
  ASoC: uniphier: use .auto_selectable_formats
  ASoC: ux500: use .auto_selectable_formats
  ASoC: xtensa: use .auto_selectable_formats

 sound/soc/dwc/dwc-i2s.c                     |  9 ++++++
 sound/soc/fsl/fsl_audmix.c                  |  7 +++++
 sound/soc/fsl/fsl_esai.c                    | 13 ++++++++
 sound/soc/fsl/fsl_mqs.c                     |  6 ++++
 sound/soc/fsl/fsl_sai.c                     | 17 +++++++++++
 sound/soc/fsl/fsl_ssi.c                     | 13 ++++++++
 sound/soc/fsl/lpc3xxx-i2s.c                 |  4 +++
 sound/soc/fsl/mpc5200_psc_i2s.c             |  4 +++
 sound/soc/hisilicon/hi6210-i2s.c            |  7 +++++
 sound/soc/img/img-i2s-in.c                  | 12 +++++++-
 sound/soc/img/img-i2s-out.c                 | 13 +++++++-
 sound/soc/img/img-parallel-out.c            |  8 ++++-
 sound/soc/jz4740/jz4740-i2s.c               |  7 +++++
 sound/soc/kirkwood/kirkwood-i2s.c           |  7 +++++
 sound/soc/loongson/loongson_i2s.c           |  6 ++++
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 11 +++++++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c  |  6 ++++
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c  | 10 +++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c  | 12 ++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c  | 13 ++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 15 ++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  | 11 +++++++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c  | 11 +++++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 17 +++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  | 11 +++++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  | 10 +++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  | 11 +++++++
 sound/soc/mxs/mxs-saif.c                    | 10 +++++++
 sound/soc/pxa/mmp-sspa.c                    |  6 ++++
 sound/soc/pxa/pxa-ssp.c                     | 11 +++++++
 sound/soc/pxa/pxa2xx-i2s.c                  |  6 ++++
 sound/soc/renesas/rz-ssi.c                  |  9 ++++++
 sound/soc/renesas/siu_dai.c                 |  6 ++++
 sound/soc/renesas/ssi.c                     | 13 ++++++++
 sound/soc/rockchip/rockchip_i2s.c           | 25 ++++++++++++----
 sound/soc/rockchip/rockchip_i2s_tdm.c       | 27 ++++++++++++-----
 sound/soc/rockchip/rockchip_pdm.c           | 14 ++++++---
 sound/soc/rockchip/rockchip_sai.c           | 31 +++++++++++++------
 sound/soc/samsung/i2s.c                     | 29 +++++++++++-------
 sound/soc/samsung/pcm.c                     |  9 ++++++
 sound/soc/sti/uniperif_player.c             | 29 ++++++++++++------
 sound/soc/sti/uniperif_reader.c             | 27 ++++++++++++-----
 sound/soc/stm/stm32_i2s.c                   | 12 ++++++++
 sound/soc/stm/stm32_sai_sub.c               | 15 ++++++++++
 sound/soc/sunxi/sun4i-i2s.c                 | 13 ++++++++
 sound/soc/sunxi/sun8i-codec.c               | 13 ++++++++
 sound/soc/tegra/tegra20_i2s.c               | 10 +++++++
 sound/soc/tegra/tegra210_i2s.c              | 13 ++++++++
 sound/soc/tegra/tegra30_i2s.c               | 10 +++++++
 sound/soc/ti/davinci-i2s.c                  | 14 ++++++++-
 sound/soc/ti/davinci-mcasp.c                | 14 +++++++++
 sound/soc/ti/omap-mcbsp.c                   | 12 ++++++++
 sound/soc/uniphier/aio-cpu.c                |  9 ++++++
 sound/soc/ux500/ux500_msp_dai.c             | 33 +++++++++++++--------
 sound/soc/xtensa/xtfpga-i2s.c               | 12 ++++++--
 55 files changed, 630 insertions(+), 73 deletions(-)

-- 
2.53.0

